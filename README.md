# Single Decatron Clock Firmware

Firmware for a clock built around a single Decatron (Dekatron) cold-cathode
gas-discharge tube — a 1950s-era 30-position counting tube repurposed here as
an analogue-style hours/minutes/seconds display.

Current software version: `4`

See [`SPECIFICATION.md`](SPECIFICATION.md) for the full hardware/firmware
specification and [`DecatronClockFirmware/USER_MANUAL.md`](DecatronClockFirmware/USER_MANUAL.md)
for end-user documentation of the web interface and configuration options.

## Hardware overview

An ESP8266 (Wemos D1 Mini) drives a Decatron tube through a two-guide
stepping scheme, decoding a rotary glow position from three interrupt phases
per step (30 pin-steps per revolution). The device runs as either a
standalone clock (NTP with DS1307 RTC fallback) or as an I2C slave to a
master clock — in this repo's current configuration, an
[ENIAC Nixie clock](../eniac-firmware) — which pushes wall-clock time and
blanking state once per second.

## Highlights

Some of the more interesting problems this firmware solves:

- **Single-interrupt display multiplexing with per-dot brightness weighting**
  — one `timer1` ISR steps the tube through all 30 positions, comparing the
  current pin against three independently tracked display targets
  (hours/minutes/seconds) and re-arming itself with a dwell count scaled 60×,
  15×, or 5× the base "off" duration. Three dots glow simultaneously at
  three distinct brightness levels from a single timer, with no separate
  PWM channel per dot.
- **Self-homing via a swappable ISR** — at boot the firmware runs a slow
  *scanning* interrupt handler that free-runs the tube until a physical index
  sense pin fires, then hot-swaps `timer1`'s callback to the normal *display*
  handler. The index trigger continues correcting drift at every revolution,
  so the tube's absolute glow position never has to be assumed — it's always
  physically re-derived.
- **Graceful multi-source time arbitration** — an I2C slave callback
  (`ICACHE_RAM_ATTR`, interrupt-context, exactly 4 bytes, no blocking) accepts
  push updates from a master clock once per second and overrides local state;
  if a second passes with no packet, the display falls back to its own
  NTP-derived clock and locally computed blanking without a hiccup. All the
  actual decision logic runs in the main loop — the ISR only stashes bytes
  into `volatile` buffers.
- **Layered blanking with escalating button override** — day/week schedule,
  PIR motion timeout, and an explicit remote "blanked" command from the I2C
  master all compete to blank the tube, and a single button independently
  suppresses all of them: press once to hold the display on for a minute,
  twice in quick succession for an hour, three times for a day, with the
  press count decoded from timing between presses.
- **Perceptually-tuned spin-up ramp** — coming out of blanking, the HV supply
  re-enables and the multiplex dwell count ramps back down from a 250,000-count
  "off" dwell to a 1,000-count "on" dwell at one of three configurable rates,
  so the tube visibly fades in rather than snapping to full brightness.
- **Self-describing status page** — the root web page live-scans all 128 I2C
  addresses to report connected peripherals, and encodes overall device
  health (WiFi / NTP / SPIFFS / OTA-available / auth / debug) as a compact
  single-character status string, alongside uptime and tube-on-time
  statistics persisted to SPIFFS.
- **Zero-touch provisioning and recovery** — first boot (or a factory reset
  triggered by holding the button at power-up) opens a WiFiManager captive
  portal; once configured, the device is reachable by mDNS hostname, supports
  OTA updates gated on available flash headroom, and independently exposes
  WiFi-only, config-only, and full-factory reset endpoints.

## Repository layout

| Path | Description |
|---|---|
| [`DecatronClockFirmware`](DecatronClockFirmware) | Main Arduino sketch and supporting modules (display ISR, I2C slave, web server, NTP, RTC, SPIFFS config, button handling, debug logging). |
| [`decatron_clock_test`](decatron_clock_test) | Standalone bench sketch for exercising the Decatron tube stepping logic in isolation. |

## Building

This is an Arduino sketch targeting the ESP8266 core.

```bash
# Board: Lolin/Wemos D1 Mini, 160 MHz, Flash 4MB (FS: 2MB, OTA: ~1MB)
# Open DecatronClockFirmware/DecatronClockFirmware.ino in the Arduino IDE
# or build with arduino-cli:
arduino-cli compile --fqbn esp8266:esp8266:d1_mini DecatronClockFirmware
arduino-cli upload  --fqbn esp8266:esp8266:d1_mini -p <port> DecatronClockFirmware
```

Dependencies: [`TimeLib`](https://github.com/michaelmargolis/arduino_time),
[`WiFiManager`](https://github.com/tzapu/WiFiManager), and the ESP8266
Arduino core (`ESP8266WiFi`, `ESP8266WebServer`, `ESP8266HTTPUpdateServer`,
`ESP8266mDNS`, `LittleFS`/`SPIFFS`, `Wire`).

## Documentation

- [`SPECIFICATION.md`](SPECIFICATION.md) — full hardware/firmware specification, including the I2C protocol, GPIO map, and configuration parameters
- [`DecatronClockFirmware/USER_MANUAL.md`](DecatronClockFirmware/USER_MANUAL.md) / [`USER_MANUAL.html`](DecatronClockFirmware/USER_MANUAL.html) — end-user manual

## License

This project is licensed under a strict Attribution-NonCommercial license — see
[`LICENSE`](LICENSE) for the full text. In short: attribution to Ian Sparkes is required, and
commercial use is not permitted without a separate written license.
