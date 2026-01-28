# Single Decatron Clock - User Manual

**Firmware Version 4**

---

## Table of Contents

1. [Introduction](#introduction)
2. [Hardware Overview](#hardware-overview)
3. [Initial Setup](#initial-setup)
4. [Understanding the Display](#understanding-the-display)
5. [Web Interface](#web-interface)
6. [Configuration Options](#configuration-options)
7. [Blanking and Power Management](#blanking-and-power-management)
8. [Time Sources](#time-sources)
9. [Button Functions](#button-functions)
10. [Troubleshooting](#troubleshooting)
11. [Technical Specifications](#technical-specifications)

---

## Introduction

The Single Decatron Clock is a unique timepiece that uses a Decatron tube - a vintage gas discharge counting tube - to display the current time. The Decatron tube contains 10 cathodes arranged in a circle, and glowing dots rotate around the tube to indicate hours, minutes, and optionally seconds.

The clock synchronizes time automatically via the internet using NTP (Network Time Protocol) and includes a battery-backed real-time clock for maintaining time during power outages.

### Key Features

- **Automatic time synchronization** via NTP
- **Battery-backed RTC** for time persistence during power loss
- **Web-based configuration** interface
- **Configurable display blanking** based on time of day or motion detection
- **Optional PIR motion sensor** support
- **Over-the-air firmware updates**
- **Multiple timezone support**

---

## Hardware Overview

### Components

| Component | Description |
|-----------|-------------|
| Decatron Tube | 10-cathode gas discharge display tube |
| ESP8266 (D1 Mini) | WiFi-enabled microcontroller |
| DS1307 RTC | Battery-backed real-time clock (optional but recommended) |
| PIR Sensor | Motion detector for auto-blanking (optional) |
| Push Button | Factory reset and future functions |

### Pin Connections

| Pin | Function |
|-----|----------|
| D7 | Decatron Guide 1 (G1) |
| D8 | Decatron Guide 2 (G2) |
| D6 | Index Detection |
| D5 | High Voltage Enable |
| D4 | PIR Motion Sensor (optional) |
| D3 | Push Button |
| D1 | I2C Clock (SCL) for RTC |
| D2 | I2C Data (SDA) for RTC |

---

## Initial Setup

### Step 1: Power On

When powered on for the first time (or after a factory reset), the clock will create a WiFi access point for configuration.

### Step 2: Connect to WiFi Configuration Portal

1. On your phone or computer, look for a WiFi network named **"decatron"**
2. Connect to this network using password: **SetMeUp!**
3. A configuration portal should open automatically
4. If it doesn't open automatically, navigate to `192.168.4.1` in your web browser

### Step 3: Configure WiFi

1. Select your home WiFi network from the list
2. Enter your WiFi password
3. Click **Save**
4. The clock will restart and connect to your network

### Step 4: Access the Web Interface

Once connected to your network, you can access the clock's web interface:

- **By hostname:** `http://decatron.local` (if mDNS is supported on your network)
- **By IP address:** Check your router's connected devices list to find the clock's IP address

### Step 5: Configure Time Settings

1. Navigate to the **Time Server** page
2. Select your timezone (see [Timezone Configuration](#timezone-configuration))
3. The clock will automatically sync time from the NTP server

---

## Understanding the Display

The Decatron tube displays time using up to three glowing dots that rotate around the tube's circular display:

### Display Elements

| Dot | Represents | Position Calculation |
|-----|------------|---------------------|
| Hours | Current hour (12-hour format) | Hour position on a 30-point scale |
| Minutes | Current minutes | Minutes divided by 2 (0-29) |
| Seconds | Current seconds (optional) | Seconds divided by 2 (0-29) |

### Reading the Time

The display works similar to an analog clock face:
- The **hours dot** shows the current hour
- The **minutes dot** shows the current minutes
- The **seconds dot** (if enabled) shows the current seconds

Since the Decatron has 10 cathodes with 3 phases each (30 positions total), the time is mapped to these 30 positions:
- Hours are converted from 24-hour to 12-hour format
- Minutes and seconds are divided by 2 to fit the 30-position display

### Flash Mode

When flash mode is enabled:
- The seconds dot blinks on and off
- The minutes dot blinks alternately every 500ms
- This helps distinguish between the different time elements

---

## Web Interface

The clock provides a web-based interface for configuration and status monitoring.

### Default Login Credentials

If authentication is enabled:
- **Username:** admin
- **Password:** setup

### Main Pages

#### Summary Page (/)

The home page displays:
- **WiFi Status:** Connected network and signal strength
- **Current Time:** Local time and timezone
- **System Uptime:** How long the clock has been running
- **NTP Status:** Last sync time and next update
- **Clock Information:** Motion sensor status, time source, RTC status
- **System Information:** ESP8266 details, memory usage
- **I2C Devices:** Detected devices on the I2C bus

**Status Indicators:**
| Letter | Uppercase | Lowercase |
|--------|-----------|-----------|
| W | WiFi connected | WiFi disconnected |
| N | NTP time valid | NTP time invalid |
| S | SPIFFS mounted | SPIFFS error |
| U | OTA update available | OTA unavailable |
| A | Authentication enabled | Authentication disabled |
| D | Debug mode on | Debug mode off |

#### Time Server Page (/time)

Configure NTP and timezone settings:
- NTP server pool selection
- Update interval
- Timezone string

#### Clock Configuration Page (/clockconfig)

Configure display and blanking options:
- Show/hide seconds
- Flash mode on/off
- Display rotation calibration
- Spin-up speed
- Blanking schedules
- Motion detector settings
- Authentication settings

#### Utility Page (/utility)

Maintenance functions:
- Reset WiFi settings only
- Reset configuration only
- Reset all settings (factory reset)
- Force NTP update
- Firmware update (OTA)
- Enable debug output

---

## Configuration Options

### General Display Settings

| Setting | Options | Description |
|---------|---------|-------------|
| Show Seconds | On / Off | Display the seconds dot |
| Flash Seconds/Minutes | Flash / Fixed | Enable blinking mode |
| Display Rotation | 0-9 | Calibrate physical tube alignment |
| Spin-up Speed | Slow / Medium / Fast | How quickly display transitions |

### Display Rotation Calibration

If the display appears rotated (12 o'clock is not at the top):
1. Go to **Clock Configuration**
2. Adjust the **Display Rotation** value (0-9)
3. Each increment rotates the display by one cathode position
4. Save and observe the display until aligned correctly

### Spin-up Speed

Controls how fast the dots move during position changes:
| Speed | Delay | Best For |
|-------|-------|----------|
| Slow | 200ms | Visual effect, gentle transition |
| Medium | 100ms | Balanced performance |
| Fast | 50ms | Quick updates, minimal motion |

---

## Blanking and Power Management

The clock can automatically turn off (blank) the display based on time schedules or motion detection.

### Time-Based Blanking Modes

| Mode | Description |
|------|-------------|
| Never blank | Display always on |
| Blank all day on weekends | Off on Saturday and Sunday |
| Blank all day on weekdays | Off Monday through Friday |
| Blank always | Display always off |
| Blank hours - every day | Blank during set hours daily |
| Blank hours - weekdays only | Blank during hours Mon-Fri |
| Blank hours - weekends only | Blank during hours Sat-Sun |
| Blank hours - week + all weekends | Blank hours on weekdays, all day on weekends |

### Blanking Hour Configuration

When using hour-based blanking:
- **Blank From:** Start hour (0-23)
- **Blank To:** End hour (0-23)

Example: To blank from 11 PM to 7 AM:
- Blank From: 23
- Blank To: 7

### Motion Detector (PIR)

If a PIR motion sensor is connected:

1. The display turns on when motion is detected
2. The display blanks after the timeout period with no motion
3. Motion detection overrides time-based blanking

**Motion Timeout Options:**
- 60 seconds (1 minute)
- 120 seconds (2 minutes)
- 300 seconds (5 minutes)
- 600 seconds (10 minutes)
- 1800 seconds (30 minutes)
- 3600 seconds (1 hour)

**PIR Pullup Setting:**
- Enable if your PIR sensor requires an internal pull-up resistor
- Most PIR modules have their own pull-up and don't need this

---

## Time Sources

The clock uses multiple time sources with automatic fallback:

### Priority Order

1. **NTP (Network Time Protocol)** - Primary source
   - Syncs time over the internet
   - Default server: pool.ntp.org
   - Update interval: ~2 hours (7261 seconds)

2. **DS1307 RTC** - Backup source
   - Battery-backed real-time clock
   - Maintains time during power outages
   - Automatically updated when NTP syncs

3. **Internal ESP8266 Time** - Fallback
   - Used only when NTP and RTC unavailable
   - May drift over time

### Timezone Configuration

The clock uses POSIX timezone strings. Common examples:

| Location | Timezone String |
|----------|-----------------|
| UK (GMT/BST) | `GMT0BST,M3.5.0/1,M10.5.0` |
| Central Europe (CET/CEST) | `CET-1CEST,M3.5.0,M10.5.0/3` |
| US Eastern (EST/EDT) | `EST5EDT,M3.2.0,M11.1.0` |
| US Pacific (PST/PDT) | `PST8PDT,M3.2.0,M11.1.0` |
| Australia Eastern (AEST/AEDT) | `AEST-10AEDT,M10.1.0,M4.1.0/3` |

The format is: `STD offset DST,start,end`

For a comprehensive list, see: https://github.com/nayarsystems/posix_tz_db/blob/master/zones.csv

### NTP Update Interval

- **Default:** 7261 seconds (~2 hours)
- **Range:** 60 to 86400 seconds
- The default avoids round-hour sync times to distribute server load

---

## Button Functions

The clock has a single push button (connected to pin D3):

### Factory Reset

To perform a factory reset:
1. Power off the clock
2. Press and hold the button
3. Power on the clock while holding the button
4. Continue holding for at least 1 second
5. Release the button
6. The clock will reset all settings and enter WiFi configuration mode

---

## Troubleshooting

### Clock Won't Connect to WiFi

1. Ensure you're entering the correct WiFi password
2. Check that your router is using 2.4 GHz (ESP8266 doesn't support 5 GHz)
3. Try moving the clock closer to your router
4. Perform a factory reset and reconfigure

### Display Shows Wrong Time

1. Check the timezone configuration in the web interface
2. Force an NTP update from the Utility page
3. Verify your internet connection is working
4. If you have an RTC, ensure the battery is not depleted

### Display Appears Rotated

1. Go to Clock Configuration
2. Adjust the Display Rotation value
3. Try different values (0-9) until 12 o'clock is at the top

### Cannot Access Web Interface

1. Ensure you're on the same network as the clock
2. Try accessing by IP address instead of hostname
3. Check if your router shows the clock as connected
4. Wait a few minutes after power-on for the clock to fully boot

### Display is Dim or Not Working

1. Check all cable connections
2. Verify the high-voltage power supply is working
3. Check that blanking is not enabled
4. Move around if a PIR sensor is installed (triggers motion detection)

### NTP Sync Fails

1. Check your internet connection
2. Try a different NTP server (e.g., `time.google.com`)
3. Verify no firewall is blocking NTP (UDP port 123)
4. The clock will fall back to RTC time if available

### Status Shows 'n' (NTP Invalid)

This means NTP hasn't synced successfully. The clock will:
- Use RTC time if available
- Retry NTP sync periodically
- Check the Summary page for more details

---

## Technical Specifications

### Microcontroller
- **Platform:** ESP8266 (Lolin D1 Mini)
- **CPU Speed:** 160 MHz
- **Flash Memory:** 4 MB (2 MB filesystem)
- **WiFi:** 802.11 b/g/n (2.4 GHz)

### Display
- **Type:** Decatron gas discharge tube
- **Cathodes:** 10
- **Display Positions:** 30 (3 phases per cathode)
- **Multiplexing:** ~1000 Hz (timer interrupt driven)

### Time Accuracy
- **NTP:** Sub-second accuracy when synced
- **RTC:** Typical ±2 ppm drift (~1 minute/year)

### Power
- **Input:** 5V DC via USB
- **High Voltage:** Generated internally for Decatron

### Network Features
- **mDNS:** `decatron.local`
- **Web Server:** Port 80
- **OTA Updates:** Supported (when flash space permits)

### Configuration Storage
- **Format:** JSON
- **Location:** SPIFFS filesystem
- **File:** `/config.json`

---

## Support and Updates

For firmware updates, bug reports, and additional documentation, visit the project repository.

### Firmware Update Procedure

1. Download the latest firmware binary
2. Go to the Utility page in the web interface
3. Click "Choose File" under Firmware Update
4. Select the firmware binary file
5. Click "Update"
6. Wait for the update to complete (do not power off)
7. The clock will restart automatically

**Note:** OTA updates require sufficient free flash space. The Summary page indicates OTA availability with 'U' (available) or 'u' (unavailable).

---

*Single Decatron Clock Firmware - Version 4*
