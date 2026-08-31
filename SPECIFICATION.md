# Single Decatron Clock Firmware Specification

**Version:** 4
**Platform:** ESP8266 (Lolin/Wemos D1 Mini)
**Framework:** Arduino (ESP8266 Arduino Core)

---

## 1. Overview

The Single Decatron Clock firmware drives a single Decatron (Dekatron) gas-discharge tube clock. A Decatron is a cold-cathode tube with 30 cathode positions (10 main cathodes plus 20 guide cathodes). The tube glows at one or more positions simultaneously; display intensity is controlled by the dwell time of the interrupt-driven scanning loop.

The firmware operates in two modes:

- **Standalone mode** — the device sources its own time from NTP over WiFi, with fallback to an onboard DS1307 RTC.
- **I2C slave mode (current)** — the device acts as an I2C slave to a master clock (e.g. Eniac/LTC-ESP32). Time, blanking state, and display mode are pushed to it once per second. NTP remains active as a fallback time source; the RTC is not accessible while the I2C bus is in slave mode.

### 1.1 Key Features

- Decatron tube display: simultaneous hours, minutes, and seconds dots at configurable brightnesses
- I2C slave receiver: accepts time and control data from a master clock once per second
- NTP time synchronisation over WiFi (fallback when no I2C master is present)
- Configurable day/week blanking schedules
- PIR motion detection with configurable timeout
- Button-triggered blanking suppression (1 minute / 1 hour / 1 day)
- Adaptive brightness via LDR (light-dependent resistor)
- Optional seconds flashing
- Web configuration interface with HTTP Basic Authentication
- Over-the-air (OTA) firmware updates
- mDNS hostname resolution
- SPIFFS-backed persistent configuration and uptime statistics
- Factory reset via button held at boot

---

## 2. Hardware

### 2.1 Microcontroller

| Component | Specification |
|-----------|---------------|
| MCU | ESP8266 (Lolin/Wemos D1 Mini) |
| Clock | 160 MHz |
| Flash | 4 MB (FS: 2 MB, OTA: ~1 MB) |
| Framework | Arduino (ESP8266 Arduino Core) |

### 2.2 GPIO Assignments

| Signal | Pin | GPIO | Description |
|--------|-----|------|-------------|
| Guide1 | D7 | GPIO13 | Decatron guide 1 (G1) |
| Guide2 | D8 | GPIO15 | Decatron guide 2 (G2) |
| Index | D6 | GPIO12 | Decatron index sense (K0 high when glow at K0) |
| HVEnable | D5 | GPIO14 | High-voltage supply enable (HIGH = on) |
| PIR | D4 | GPIO2 | PIR motion sensor input |
| Button1 | D3 | GPIO0 | User input button (active low) |
| LDR | A0 | ADC0 | Light-dependent resistor (analogue) |
| I2C SDA | D2 | GPIO4 | I2C data (slave to master clock) |
| I2C SCL | D1 | GPIO5 | I2C clock (slave to master clock) |

> **Note:** In I2C slave mode the SDA/SCL pins (D2/D1) cannot simultaneously be used to communicate with the onboard RTC. The RTC is therefore bypassed.

### 2.3 Peripherals

| Peripheral | Interface | Address / Notes |
|------------|-----------|-----------------|
| DS1307 RTC | I2C | 0x68 — bypassed in slave mode |
| Master clock (Eniac) | I2C slave | 0x6A (106) — this device |
| LDR | Analogue | A0 |
| PIR sensor | Digital | D4, optional |

---

## 3. Display

### 3.1 Decatron Tube

A Decatron has 30 addressable positions driven via a two-guide stepping scheme. Each step consists of three phases:

| Phase | Guide1 | Guide2 | Effect |
|-------|--------|--------|--------|
| 0 | LOW | LOW | Resting (at current cathode) |
| 1 | HIGH | LOW | Step via G1 |
| 2 | LOW | HIGH | Step via G2 |

Three phase steps advance the glow by one main cathode position (1/10th of the tube). Ten main cathodes × 3 phases = 30 total pin-steps per revolution.

### 3.2 Display Values

Time is mapped to tube positions as follows:

| Value | Mapping | Tube position range |
|-------|---------|---------------------|
| Hours | `((h % 12) * 60 + m) * 30.0 / 720` | 0–29 (12-hour) |
| Minutes | `m / 2` | 0–29 |
| Seconds | `s / 2` | 0–29 |

Three dots are shown simultaneously. Dwell-time weighting controls relative brightness:

| Dot | Multiplier (× base mux count) | Relative brightness |
|-----|-------------------------------|---------------------|
| Hours | 60× | Brightest |
| Minutes | 15× | Medium |
| Seconds | 5× | Dimmest |

The base mux count (`INT_MUX_COUNTS_ON = 1000`, units of 0.2 µs at TIM_DIV16 / 80 MHz) sets the off-state dwell; active positions dwell longer.

### 3.3 Startup Scan

On power-up the firmware runs a slow scanning interrupt (`displayUpdateScanning`) at `INT_MUX_COUNTS_OFF × 2` to locate the index mark and home the tube before switching to normal display.

### 3.4 Display Rotation

`current_config.displayRotate` (0–9) offsets the index correction point so the K0 position can be aligned to any desired clock position.

### 3.5 Seconds Flash

When `current_config.flashSeconds` is set:
- The minutes dot is hidden for the first 500 ms of each second.
- The seconds dot alternates on/off every 100 ms.

### 3.6 Blanking

When `blanked` is true the HV supply is disabled (`HVEnable = LOW`) and the mux count ramps up toward `INT_MUX_COUNTS_OFF`. When un-blanked, HV is enabled and the mux count ramps back down to `INT_MUX_COUNTS_ON` at a rate set by `spinUpVal`.

---

## 4. I2C Slave Protocol

The device listens at I2C address **106 (0x6A)** on SDA = D2 (GPIO4), SCL = D1 (GPIO5).

### 4.1 Receive Packet (master → slave)

Sent by the master once per second. Exactly 4 bytes:

| Byte | Field | Range | Description |
|------|-------|-------|-------------|
| 1 | Hours | 0–23 | Current hour (24-hour) |
| 2 | Minutes | 0–59 | Current minute |
| 3 | Seconds | 0–59 | Current second |
| 4 | Control | — | See below |

#### Control Byte

| Bit(s) | Mask | Field | Description |
|--------|------|-------|-------------|
| 0 | `0x01` | Blanked | 1 = master requests display blank |
| 1–4 | `0x1E` | Primary mode | Master's current display mode (reserved for future use) |
| 5–7 | — | Reserved | Ignored |

### 4.2 Behaviour on Receipt

The `onI2CReceive` callback (runs in interrupt context) stores the received bytes in volatile variables and sets `i2cDataReceived = true`. In the main loop, when the flag is set:

1. `displayHours`, `displayMinsPrep`, and `displaySecsPrep` are recalculated from the received h/m/s.
2. `blanked` is set from control bit 0, overriding any local NTP-based blanking decision.

### 4.3 Fallback

If no I2C packet has been received since the last second tick, the display continues to be driven by the NTP-derived internal time and local blanking logic.

---

## 5. Time Sources

### 5.1 Priority

| Priority | Source | Condition |
|----------|--------|-----------|
| 1 | I2C master | Packet received in current loop iteration |
| 2 | NTP | WiFi connected and NTP valid |
| 3 | Internal (TimeLib) | No connectivity; retains last set time |

### 5.2 RTC

A DS1307 RTC at I2C address 0x68 is supported in standalone mode only. While the I2C bus is configured as slave (address 0x6A), the device cannot act as I2C master and the RTC is bypassed (`useRTC = false`).

### 5.3 NTP

| Parameter | Default |
|-----------|---------|
| NTP pool | Configured at first boot / via web UI |
| Update interval | Configurable |
| Timezone | POSIX TZ string, configurable |

NTP updates are requested at startup and periodically by the async NTP component. A successful update also sets the RTC in standalone mode.

---

## 6. Blanking

Blanking disables the HV supply and fades the mux count to `INT_MUX_COUNTS_OFF`. Multiple sources can independently trigger blanking.

### 6.1 Blanking Sources

| Source | Trigger | Notes |
|--------|---------|-------|
| I2C master | Control byte bit 0 set | Overrides local logic immediately |
| Day/schedule | `current_config.dayBlanking` | See modes below |
| PIR timeout | No motion within `pirTimeout` seconds | When PIR sensor installed |
| Button suppression | Active suppress period | Overrides day/schedule and PIR |

### 6.2 Day Blanking Modes

| Value | Name | Description |
|-------|------|-------------|
| 0 | Never | Always on (default) |
| 1 | Weekend | Blank all day Saturday and Sunday |
| 2 | Weekday | Blank all day Monday–Friday |
| 3 | Always | Always blank |
| 4 | Hours | Blank between `blankHourStart` and `blankHourEnd` every day |
| 5 | Weekend or Hours | Mode 4 on weekdays, mode 1 on weekends |
| 6 | Weekday or Hours | Mode 4 on weekends, mode 2 on weekdays |
| 7 | Weekend and Hours | Mode 4 only during weekends |
| 8 | Weekday and Hours | Mode 4 only during weekdays |

### 6.3 PIR Motion Detection

When a PIR sensor is installed, native day/schedule blanking is disabled. The tube blanks after `pirTimeout` seconds of no motion (default 300 s, range 60–3600 s). Motion is detected by counting consecutive loop iterations where the PIR pin is HIGH; at least half the impressions-per-second must be active to count as a valid detection.

### 6.4 Button Blanking Suppression

A button press during a blanked period suppresses blanking. Successive rapid presses increase the suppression duration:

| Presses | Duration |
|---------|----------|
| 1 | 1 minute |
| 2 | 1 hour |
| 3 | 1 day |

---

## 7. Configuration

### 7.1 Stored Parameters (SPIFFS)

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `ntpPool` | String | — | NTP server hostname |
| `ntpUpdateInterval` | int | — | NTP poll interval (s) |
| `tzs` | String | — | POSIX timezone string |
| `showSeconds` | bool | — | Show seconds dot |
| `flashSeconds` | bool | — | Flash seconds dot |
| `dayBlanking` | byte | 0 | Blanking schedule mode |
| `blankHourStart` | byte | 0 | Blanking start hour |
| `blankHourEnd` | byte | 7 | Blanking end hour |
| `pirTimeout` | int | 300 | PIR inactivity timeout (s) |
| `usePIRPullup` | bool | — | Enable PIR pin internal pull-up |
| `displayRotate` | byte | 0–9 | Index position offset |
| `spinUpSpeed` | byte | 1 | Spin-up speed (0=slow, 1=medium, 2=fast) |
| `webAuthentication` | bool | true | Require HTTP auth |
| `webUsername` | String | admin | Web UI username |
| `webPassword` | String | setup | Web UI password |
| `testMode` | bool | true | Enable test/diagnostic mode |

### 7.2 Persistent Statistics

| Field | Description |
|-------|-------------|
| `uptimeMins` | Total uptime in minutes |
| `tubeOnTimeMins` | Minutes the tube has been unblanked |

Statistics are written to SPIFFS once per day and on explicit save.

### 7.3 Factory Reset

Factory reset is triggered by:
- Holding Button1 at boot.
- The `/resetall` or `/resetoptions` web endpoint.

Reset restores all parameters to defaults and saves to SPIFFS.

---

## 8. Web Interface

The device hosts an HTTP server on port 80. All pages except the root require HTTP Basic Authentication when enabled.

### 8.1 Endpoints

| Path | Description |
|------|-------------|
| `/` | Status and clock information |
| `/time` | Set time manually |
| `/resetoptions` | Reset configuration to defaults |
| `/resetwifi` | Clear WiFi credentials and restart |
| `/resetall` | Full factory reset |
| `/update` | OTA firmware upload (admin / update) |

### 8.2 mDNS

The device advertises itself via mDNS as `http://<hostname>.local` with an HTTP service on port 80.

---

## 9. WiFi

On first boot (or after a WiFi reset) the device starts a WiFi captive portal AP named **decatron** with passphrase **SetMeUp!**. The portal times out after 60 seconds. Once credentials are saved they are used on all subsequent boots. Auto-reconnect is enabled; a dropped connection is retried once per hour.

---

## 10. Firmware Updates

OTA updates are available at `/update` (credentials: admin / update) when the compiled sketch size is less than half the available flash. Updates are served via `ESP8266HTTPUpdateServer`.

---

## 11. Spin-Up Speeds

The mux count ramps from `INT_MUX_COUNTS_OFF` (250 000) down to `INT_MUX_COUNTS_ON` (1 000) at startup and after un-blanking. The ramp rate is controlled by `spinUpVal`:

| Mode | `spinUpVal` | Ramp character |
|------|-------------|----------------|
| Slow | 200 | Gradual |
| Medium (default) | 100 | Normal |
| Fast | 50 | Rapid |

---

## 12. Software Architecture

### 12.1 Interrupt Handler

`displayUpdate()` runs on `timer1` (TIM_DIV16, single-shot). Each call:
1. Advances `phaseStep` (0→1→2→0).
2. On phase rollover, advances `digitStep` (0–9).
3. Calls `G_step(phaseStep)` to assert Guide1/Guide2.
4. Compares `pinStep = digitStep * 3 + phaseStep` against the three display targets.
5. Sets the next timer alarm to the dwell count for the active dot (or the base count if none match).

`indexMarkTrigger()` fires on the falling edge of the Index pin and corrects `digitStep` to align the tube to `displayRotate`.

### 12.2 Main Loop Cadence

| Interval | Action |
|----------|--------|
| Every 10 ms | Main loop tick: handle web server, PIR sampling, flash logic, I2C data application, HV/mux ramp |
| Once per second | `performOncePerSecondProcessing`: blanking check, NTP poll, display value update |
| Once per minute | `performOncePerMinuteProcessing`: uptime stats, connectivity log |
| Once per hour | `performOncePerHourProcessing`: WiFi reconnect attempt |
| Once per day | `performOncePerDayProcessing`: save stats to SPIFFS |

### 12.3 I2C Slave Callback

`onI2CReceive(int numBytes)` runs in interrupt context (`ICACHE_RAM_ATTR`). It reads exactly 4 bytes into volatile buffers and sets `i2cDataReceived`. All non-trivial processing occurs in the main loop.

### 12.4 Component Files

| File | Responsibility |
|------|----------------|
| `DecatronClockFirmware.ino` | Main sketch: display ISR, setup, loop, time management, blanking, I2C slave |
| `ClockDefs.h` | Pin assignments, constants, blanking mode enums |
| `SPIFFS.cpp/h` | Persistent config and stats (ArduinoJson 5) |
| `ESP_DS1307.cpp/h` | DS1307 RTC driver (I2C master; unused in slave mode) |
| `NtpAsync.cpp/h` | Asynchronous NTP client |
| `HtmlServer.cpp/h` | HTTP server, OTA, mDNS, HTML helpers |
| `ClockUtils.cpp/h` | String/debug utilities |
| `ClockButton.cpp/h` | Debounced button handler |
| `DebugManager.cpp/h` | Serial debug output |
