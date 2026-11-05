# 🪲🕸️ SCARAB1 — Brooklyn Weekend DIY MVP Build Plan, Local Shopping BOM & 7-Step 3D Assembly Guide (`SERICOPTERA / KŌRŌ LANTERN`)

- **Project**: `Scarab1` (`Photogenik` / `The Porcelain Scarab` / Form 06 `SERICOPTERA / KŌRŌ LANTERN`)
- **Google Drive Workspace**: https://drive.google.com/drive/folders/1N7eXUW2lRcgNYZYLpvEsXKXg5YAiGsLp
- **Interactive 3D WebGL Assembly & Live Winch Simulator**: https://portalstest.github.io/photogenik-scarab/mvp.html (Google Drive ID: `1aQc2Mqm2Hlqwr84itYLRr32Wh6N1tV0B`)
- **24-Second 720p Animated 3D Step-by-Step Instructional Video**: https://portalstest.github.io/photogenik-scarab/scarab_brooklyn_mvp_assembly_guide.mp4 (Google Drive ID: `1lmRvOUpaij0hOUee4IWYDSANg8W8ildl`)
- **6-Form 3D CAD Studio (including Form 06 Sericoptera)**: https://portalstest.github.io/photogenik-scarab/forms.html (Google Drive ID: `1BxV7ssVdoVnMoRvz_OQB2McEByAGYEx_`)
- **7-Mode Indoor Utility CAD Blueprint**: https://portalstest.github.io/photogenik-scarab/blueprint.html (Google Drive ID: `1W7cEga7ceVH4uIs0uNV-gnihs4_B3za0`)

---

## 1. Overview: Two Weekend Build Paths in Brooklyn (`$85` vs. `$141.70`)

You can build a working physical MVP of **Form 06 (`SERICOPTERA / KŌRŌ LANTERN`)** in a single weekend in Brooklyn with **zero custom PCBs** and **zero micro-soldering** using off-the-shelf (`COTS`) parts:

1. **Tier 1 — Ceiling-Rappelling AI Lantern & 5× Yo-Yo Hoist MVP (`~$85`, 2-Hour Build, No Drone Required)**:
   - Focuses strictly on the **Spider-Silk Ceiling Winch, `0 W` Chandelier Overwatch, Pendulum Swing, and `65 g` Floor Yo-Yo Hoist** (`Seeed XIAO ESP32S3 Sense` camera/mic + `DRV8837` H-bridge + `6 mm` worm-gear winch + `3.0 m` `0.12 mm` `PowerPro` Spectra line + `0.4 mm` vase-mode Kōrō lantern shells + `WS2812B` warm `2200 K` LEDs).
2. **Tier 2 — Full Flying, Ceiling-Perching & Spider-Silk Winch MVP (`$141.70`, `46.5 g` All-Up Flying Mass, Saturday–Sunday Build)**:
   - Builds on the **`M5Stack StampFly v1.1` (`81.5 × 81.5 mm`, `36.8 g`)** open-source `ESP32-S3` shrouded quadcopter (which already has built-in `PMW3901` Optical Flow, `VL53L3CX` ToF laser, `BMI270` 6-axis IMU, and 4 shrouded ducts) and adds the **`+1.85 g` Spider-Silk Winch Module**, **`1.7 g` linear wing servo**, and **`0.4 mm` vase-mode split elytra shells**.

---

## 2. Where to Buy Parts Locally in Brooklyn (Same-Day / Next-Day)

| Brooklyn / NYC Source | Location / Transit | What to Pick Up Same-Day |
| :--- | :--- | :--- |
| **1. Micro Center Brooklyn** | **850 3rd Ave, Sunset Park** (Industry City — `D / N / R` train to 36th St) | `Seeed Studio XIAO ESP32S3 Sense` (`$13.99`, in-stock in Maker aisle), `M5Stack` / `ESP32` accessories, `Pololu DRV8837 / DRV8833` dual H-bridge breakout (`$4.95`), `Inland Translucent Natural PLA` filament (`$16.99`), `WS2812B` NeoPixel mini strip, `JST-SH / Grove` jumper wires, `3M Command` strips, CA glue. |
| **2. Local Brooklyn Tackle Shop** | **Dream Fishing Tackle** (672 Manhattan Ave, Greenpoint) or **Bay Ridge Tackle** | **`PowerPro 10–15 lb (0.12 mm)` braided Spectra fishing line** (`$14.99` spool). Spectra is UHMWPE (identical polymer family to Dyneema SK99): `0.12 mm` diameter, `0.035 g` for `3.0 m`, `9 kg` (`90 N`) breaking strength (`200×` the robot's weight). |
| **3. Adafruit Industries NYC** | **150 Varick St, Lower Manhattan** (Fast NYC courier / UPS Next-Day to Brooklyn) | Micro planetary/worm gearmotors, `Grove HY2.0-4P` cables, ultra-thin silicone wire (`30 AWG`), `1S LiHV` batteries. |
| **4. Brooklyn 3D Printing** | Home `Bambu Lab A1 Mini / Prusa`, ** Brooklyn Public Library (Central Library Info Commons)**, or **NYC Resistor / Voodoo Manufacturing** | Print the two `0.4 mm` **Spiral Vase Mode (`Spiralize Outer Contour`)** translucent PLA/PETG split elytra shells (`2.15 g` each = `4.3 g` pair, 14-minute print time) + the `0.4 g` snap-on dorsal winch saddle & bobbin. |

---

## 3. Complete Bill of Materials (BOM), Mass Budget & Cost Breakdown

| Step | Component | Exact Part / Spec | Mass (`g`) | Cost (`USD`) | Source |
| :-: | :--- | :--- | :-: | :-: | :--- |
| **1** | **Shrouded Quad Base** | `M5Stack StampFly v1.1` (`ESP32-S3`, `BMI270` IMU, `PMW3901` Optical Flow, `VL53L3CX` ToF, `300 mAh` 1S LiHV) | `36.80 g` | `$49.95` | M5Stack / Amazon / Mouser |
| **2** | **Vision & Audio SoC** | `Seeed Studio XIAO ESP32S3 Sense` (`OV2640` `1600×1200` cam + digital MEMS mic + Wi-Fi/BLE + `HY2.0-4P` cable) | `1.40 g` *(cam/board net)* | `$13.99` | **Micro Center Brooklyn** (Aisle 3) |
| **3** | **Wing Servo + Winch Driver** | `Spektrum A2010` / `DM-S0020` `1.7 g` Linear Micro-Servo (`$11.99`) + `Pololu DRV8837` H-Bridge (`$4.95`) | `1.70 g` | `$16.94` | Micro Center / Horizon Hobby |
| **4** | **Spider-Silk Winch & Spool** | `6 mm × 12 mm` coreless planetary gearmotor + miniature `M0.3` brass worm-gear self-locking spool + `3.0 m` of `0.12 mm` `PowerPro` Spectra braided line (`9 kg` test, `0.035 g`) | `1.50 g` | `$24.98` | Tackle Shop (Greenpoint) + Amazon |
| **5** | **Ceiling Anchor Ferrule** | `10 mm × 1.5 mm` `N52` Neodymium Ring Magnet + micro-hook ferrule (`0.8 g`) + `3M Command` brushed-steel ceiling target washer (`0 g` flight weight) | `0.80 g` | `$8.99` | Micro Center / Hardware Store |
| **6** | **Vase-Mode Kōrō Shells** | `0.4 mm` single-wall Spiral Vase Mode translucent PLA split shells + `4× WS2812B-2020` `2200 K` warm LEDs | `4.30 g` | `$16.99` *(spool)* | Micro Center (`Inland PLA`) |
| **7** | **Fasteners & Adhesives** | `M1.4` nylon screws, `0.5 mm` carbon hinge pin, medium CA glue, `30 AWG` silicone leads | *(included)* | `$9.86` | Micro Center Brooklyn |
| — | **TOTAL ALL-UP FLYING MVP** | **Fits comfortably inside StampFly's `~50–52 g` indoor hover ceiling (`88 gf` max thrust = `1.89:1` TWR)** | **`46.50 g`** | **`$141.70`** | **Weekend Build Ready** |

---

## 4. Solderless Wiring & Pinout Schematic (`StampFly` ↔ `XIAO ESP32S3` ↔ `Winch & Servo`)

No PCB fabrication or SMD soldering is required. Everything connects via the `StampFly` top expansion header and `XIAO ESP32S3` GPIO pins:

```
┌────────────────────────────────────────────────────────────────────────────┐
│ M5STACK STAMPFLY v1.1 (81.5 × 81.5 mm Base Frame • 1S 3.8V LiHV + 5V Boost)│
│  [HY2.0-4P Grove Port A] ──► 5V (Red) / GND (Black) / GPIO1 (TX) / GPIO2   │
└───────────────┬────────────────────────────────────────────────────────────┘
                │ Plug-and-Play 4-Pin Grove Cable (Zero Soldering)
                ▼
┌────────────────────────────────────────────────────────────────────────────┐
│ SEEED STUDIO XIAO ESP32S3 SENSE (Front Chin Mount • OV2640 Cam + Mic)      │
│  • 5V & GND  ──────► Powers XIAO Camera + DRV8837 + 1.7g Linear Wing Servo │
│  • D0 / GPIO1 (RX) ◄──► UART Telemetry & Flight Trigger to StampFly ESP32  │
│  • D1 / GPIO2 (TX) ◄──► Optical Flow / ToF Altitude Readout                │
│  • D3 / GPIO4 (PWM) ──► 1.7g Linear Micro-Servo Signal (50Hz, 1000–2000µs) │
│  • D4 / GPIO5 (IN1) ──► Pololu DRV8837 H-Bridge IN1 (Winch Reel-In)        │
│  • D5 / GPIO6 (IN2) ──► Pololu DRV8837 H-Bridge IN2 (Winch Pay-Out)        │
│  • D6 / GPIO7 (DIN) ──► 4× WS2812B-2020 Warm-Amber 2200K Shell LEDs        │
└───────────────┬─────────────────────────────────────────┬──────────────────┘
                │                                         │
                ▼                                         ▼
┌───────────────────────────────────┐     ┌──────────────────────────────────┐
│ 1.7g LINEAR WING SERVO (GPIO4)    │     │ DRV8837 H-BRIDGE (GPIO5 / GPIO6) │
│  • 0°  (1000µs): Closed Sanctuary │     │  • IN1=1, IN2=0: Reel Up (15cm/s)│
│  • 15° (1200µs): Visor Camera Peek│     │  • IN1=0, IN2=1: Rappel Down     │
│  • 60° (1800µs): Full Flight /    │     │  • IN1=0, IN2=0: Worm-Gear Brake │
│                  Kōrō Lantern Open│     │    (0.0 mW Static Ceiling Hold!) │
└───────────────────────────────────┘     └──────────────────────────────────┘
```

---

## 5. Step-by-Step 3D Assembly & Bring-Up Instructions (Matches `mvp.html` & Video)

### Step 1 (`0:00–0:03` in Video): Base Airframe Inspection (`36.8 g`)
1. Unbox the **`M5Stack StampFly v1.1`** (`81.5 × 81.5 mm` shrouded 4-duct frame).
2. Snap the `300 mAh` 1S LiHV battery into the ventral tray and verify a 5-second stable hover using the stock `M5Atom Joystick` or ESP-NOW controller so you have a known-good baseline before adding hardware.
3. Verify the ventral **`PMW3901` Optical Flow** and **`VL53L3CX` Time-of-Flight (ToF)** laser window on the bottom PCB are completely unobstructed.

### Step 2 (`0:03–0:06` in Video): Snap-Fit `XIAO ESP32S3 Sense` Vision & Audio Module (`+1.4 g` → `38.2 g`)
1. Press the `OV2640` camera + digital MEMS mic expansion board onto the top of the **`Seeed Studio XIAO ESP32S3`** (`21 × 17.5 mm`).
2. Clip the XIAO onto the front nose bridge of the `StampFly` at a `12°` downward look angle using two drops of medium CA glue or the printed snap-cradle.
3. Plug the 4-pin **`Grove HY2.0-4P`** cable into the `StampFly` top expansion port (`5V`, `GND`, `GPIO1`, `GPIO2`). Flash the `CameraWebServer` sketch over USB-C and verify live `1600×1200` MJPEG streaming at `http://scarab-mvp.local`.

### Step 3 (`0:06–0:09` in Video): Mount `1.7 g` Linear Wing Servo & `DRV8837` Winch H-Bridge (`+1.7 g` → `39.9 g`)
1. Adhere the **`1.7 g` `Spektrum A2010` linear micro-servo** along the left dorsal spine of the `StampFly` PCB.
2. Adhere the **`0.4 g` `Pololu DRV8837` H-bridge breakout** along the right dorsal spine.
3. Connect the servo signal wire to `XIAO GPIO4` (`D3`) and the `DRV8837` `IN1 / IN2` pins to `XIAO GPIO5 / GPIO6` (`D4 / D5`).

### Step 4 (`0:09–0:12` in Video): Install Dorsal Spider-Silk Winch & `3.0 m` Spectra Spool (`+1.5 g` → `41.4 g`)
1. Wind **`3.0 meters` of `0.12 mm` `PowerPro` Spectra braided fishing line** (`9 kg` / `20 lb` test, weighing just `0.035 g` total) onto the `10 mm` Delrin/PLA micro-bobbin.
2. Couple the bobbin to the **`6 mm × 12 mm` coreless planetary gearmotor + miniature `M0.3` self-locking worm gear** mounted precisely over the `StampFly` Center of Gravity (`CG`, `X = 0, Y = 0`).
3. Because the worm gear cannot be back-driven by vertical tension, cutting power to the `DRV8837` (`IN1 = 0, IN2 = 0`) locks the spool mechanically at **`0.0 mW` static power draw**.

### Step 5 (`0:12–0:15` in Video): Thread Dorsal Fairlead & `10 mm` `N52` Magnetic Ceiling Ferrule (`+0.8 g` → `42.2 g`)
1. Thread the `0.12 mm` Spectra line vertically through a `4 mm` smooth PTFE/ceramic guide tube (preventing the line from ever touching the 4 shrouded rotors).
2. Tie an improved clinch knot to the **`10 mm × 1.5 mm` `N52` neodymium magnetic ring ferrule (`0.8 g`)**, which rests flush inside the dorsal fairlead cone during normal flight.
3. Stick the included **`25 mm` brushed-steel target washer** to your Brooklyn apartment ceiling (or bookshelf overhang) using a damage-free `3M Command` strip.

### Step 6 (`0:15–0:18` in Video): Snap On `0.4 mm` Vase-Mode Translucent Split Shells (`+4.3 g` → `46.5 g`)
1. Slice the left and right **Form 06 `SERICOPTERA / KŌRŌ LANTERN`** shells in Bambu Studio / Cura with **`Spiralize Outer Contour` (Vase Mode)** enabled, `0.4 mm` line width, `0.20 mm` layer height, and `0` top/bottom/infill layers using `Inland Translucent Natural PLA`. Each shell prints in `14 minutes` and weighs **`2.15 g`**.
2. Pin the shells to the front carbon hinge rod and link the `1.7 g` linear servo pushrod to both shell horns so:
   - `0°` = Closed Sanctuary (`100%` hardware camera shutter).
   - `15°` = Perched Visor Peek.
   - `55°–65°` = Outboard Flight & Warm `2200 K` Kōrō Lantern Bloom (completely clearing the four `33 mm` rotor intake ducts).

### Step 7 (`0:18–0:24` in Video): Live Flight, Ceiling Dock, `0.0 W` Rappel, Pendulum & `65 g` Yo-Yo Hoist
1. **Fly & Ceiling Dock**: Command takeoff; when the `VL53L3CX` ToF sensor detects the ceiling at `< 8 cm`, the `10 mm` `N52` ferrule snaps onto the ceiling steel washer with **`14 N` (`1.4 kg`, `30×` vehicle weight)** holding force and the flight controller immediately disarms all 4 rotors to **`0.0 W` (`0 dBA`)**.
2. **`0 W` Chandelier Rappel (`Mode 7A`)**: Pulse `DRV8837` (`IN2 = HIGH`) for `4.5 seconds` to pay out `0.8 m – 1.5 m` of `0.12 mm` Spectra line, then set `IN1 = IN2 = LOW`. The Scarab hangs silently in mid-air at `0.0 W` motor draw as a floating `2200 K` Kōrō lantern and `360°` security/vlog camera for **6–8+ hours** on a single `300 mAh` charge.
3. **Pendulum Swing (`Mode 7B`)**: Pulse the rear two rotors for `180 ms` while suspended on the `1.2 m` tether to initiate a silent pendulum arc across the room.
4. **`5×` Yo-Yo Crane Hoist (`Mode 7C`)**: While the Scarab remains magnetically locked to the ceiling steel disc (`14 N` hold), unlatch the magnetic/micro-hook ferrule and lower the line `2.4 m` to the floor to snag a **`65 g` keyring or AirPods case (`1.4×` the Scarab's own weight)** and winch it vertically at `15 cm/s` (`~1.1 W` motor draw) without ever spinning the flight propellers.
