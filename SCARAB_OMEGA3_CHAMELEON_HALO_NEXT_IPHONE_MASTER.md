# 🐞 `SCARAB Ω³-CAM` (`CHAMELEON-HALO`): Consolidated Expandable-Rotor Camera-Pet Baseline & Codex Review Disposition

> [!IMPORTANT]
> **Consolidated Single Baseline & Evidence Status (`Claude Opus 5.5` + `Sol 6.1 MAX` + `Gemini 4 Argon High`)**
> - **Product Priority**: A compact, quiet, expressive wearable **consumer camera pet** (`Ø 28.5 × 7.20 mm` bare core / `Ø 32.5 × 7.20 mm` with snap-on bezel) that expands into a **`Ø 64.0 mm` (`32.17 cm²`) slow-turning coaxial rotor** for flight.
> - **Evidence Status (`TESTABLE ENGINEERING CONCEPT — PENDING HARDWARE GATES 1–4`)**: All mass (`9.85 g` bare / `10.45 g` shelled), power (`1.60–1.94 W`), endurance (`19.5–23.7 min` arithmetic at `80%` DoD), acoustic (`dBA`), and control authority figures in this document are **analytical design targets**, not measured hardware results. Web visualizers (`chameleon.html`, `omega-scale.html`, `omega.html`) are **parametric concept animations**, and `scarab_zipper_rotor.scad` (Rev 2.0) is a **kinematic concept coupon model** awaiting physical validation in **Bench Gate 1**.
> - **Clean Baseline Separation (Codex Output D)**:
>   1. **Primary Integrated Prototype (`SCARAB Ω³-CAM`, Sections 1–6)**: Camera-Pet only (`OV64B` / `16 MP` camera + `VL53L5CX` ToF + 2-Axis OIS). **Zero** unmeasured dandelion-pappus lift bonuses and **zero** human thermal-plume savings are included in the baseline power or endurance ledger.
>   2. **Separate Post-MVP Investigations (Section 7)**: Mini-projector packaging (`JBD Roadrunner II` `6.0 lm` optical relay study) and porous-ring / updraft aerodynamics are isolated in a dedicated exploratory track so they do not confound the core camera-pet prototype.

---

## 1. Visual Architecture Overview & Concept Blueprints

````carousel
![Shape & Architecture Delta: Archived Fixed-Duct SCARAB Ω² (17.2 mm Thick) vs. Expandable-Rotor SCARAB Ω³ Concept](/Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_omega2_vs_omega3_comparison_1793999240863.jpg)
<!-- slide -->
![SCARAB Ω³-CAM — Exploded Layer Geometry Concept Blueprint](/Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_omega3_exploded_cad_geometry_1793999265448.jpg)
<!-- slide -->
![Phase II Exploratory Track — Central Optical Pod & Mini-Projector Concept Study](/Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_omega3_projector_spec_1793999424803.jpg)
````

---

## 2. Point-by-Point Triad Disposition of Codex Consolidation Review (Output B)

| Codex Review Point | Triad Disposition | Mathematical / Architectural Correction Applied to Consolidated Baseline |
| :--- | :---: | :--- |
| **1. Reconcile Whole Document & Complete Force-DAQ Chain** | **AGREE — APPLIED** | • Rewrote [`SCARAB_OMEGA_SQUARED_CONVERGENCE_AND_SCALABILITY_MASTER.md`](file:///Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/SCARAB_OMEGA_SQUARED_CONVERGENCE_AND_SCALABILITY_MASTER.md) as the **Archived Fixed-Duct Variant** with all tables recalculated without superseded wake-surfing/dither credits (`4.54–4.85 W` Tier-1 / `3.06–3.35 W` Tier-2) and "hard physical floors" reclassified as practical design trade-off knees.<br/>• Upgraded the bench DAQ specification from `INA125P` (whose gain-bandwidth drops to `~2.5–4 kHz` at $G=500\text{–}1000$) to **`AD8421` / `INA826` (`> 200 kHz` `-3 dB` bandwidth at $G=1000$)** + 4th-order Butterworth anti-aliasing filter ($f_c = 4.0\text{ kHz}$) + impulse tap-test verification of loaded balance natural frequency ($f_{n,\text{loaded}} > 800\text{ Hz}$) and static dead-weight cross-talk matrix calibration. |
| **2. Larger `Ø 64 mm` Rotor Physics vs. Unmeasured Targets** | **AGREE — APPLIED** | • At $m = 10.45\text{ g}$ ($W = 0.1025\text{ N}$), $\rho = 1.225\text{ kg/m}^3$, and $D = 64.0\text{ mm}$ ($A = 32.17\text{ cm}^2$, `6.69×` larger than two `17.5 mm` ducts), ideal actuator-disk hover power is **$P_{\text{ideal}} = 0.370\text{ W}$** with induced velocity **$v_i = 3.61\text{ m/s}$**.<br/>• Applying realistic coaxial interference ($\kappa_{\text{coax}} = 1.26$), low-$\text{Re}$ profile drag ($\text{FM}_{\text{coax}} \approx 0.44\text{–}0.50 \implies P_{\text{shaft}} = 0.74\text{–}0.84\text{ W}$), micro-brushless motor/ESC efficiency ($\eta_{m\cdot\text{esc}} \approx 0.52\text{–}0.58 \implies P_{\text{prop}} = 1.28\text{–}1.62\text{ W}$), and `0.32 W` avionics/camera yields a **reconciled electrical hover target of `1.60–1.94 W`** (`19.5–23.7 min` arithmetic at `0.79 Wh × 80%` DoD). All figures are explicitly labeled `UNVERIFIED DESIGN TARGETS`. |
| **3. OpenSCAD Folding Bug (`D = 64 mm` at `deploy=0`) & Triangle-Inequality Bound** | **AGREE — FIXED IN CODE & MATH** | • **Root Cause Identified**: In Rev 1.0 of `scarab_zipper_rotor.scad`, `rotate([0,0,cur_fold])` was placed *before* `translate([R_hub,0,0])`, rotating blades around `[0,0,0]` instead of the root hinge and leaving `D ≈ 64.4 mm` at `deploy = 0`.<br/>• **Euclidean Lower Bound**: Even when pivoted at `[R_hub = 6.2 mm, 0, 0]`, a **1-hinge rigid blade** of chord $L = 32.0 - 6.2 = 25.8\text{ mm}$ cannot fold to a radius smaller than $R_{\min,\text{tip}} = L - R_{\text{hub}} = 25.8 - 6.2 = 19.60\text{ mm}$ (**`D_stowed ≥ 39.20 mm`**) by the reverse triangle inequality.<br/>• **Kinematic Fix Implemented in [`scarab_zipper_rotor.scad`](file:///Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_zipper_rotor.scad) (Rev 2.0)**: Pivots strictly at `[R_hub = 6.20 mm, 0, 0]` and implements a **2-Hinge Bi-Fold Articulated Blade** (Proximal link $L_1 = 13.0\text{ mm}$ folding $-118^\circ$ at root + Distal link $L_2 = 12.8\text{ mm}$ folding $-102^\circ$ at the mid-span knee hinge). Coordinate verification confirms: at `deploy = 1.0`, $R_{\max} = 32.00\text{ mm}$ (**`D_flight = 64.00 mm`**); at `deploy = 0.0`, all blade coordinates lie within $R \in [6.20, 12.38]\text{ mm}$ (**`D_stowed = 24.76 mm ≤ 25.0 mm`**), plus a mated female 3-start helical spline nut (`0.20 mm` radial clearance). Re-labeled as **Kinematic Concept Coupon CAD** pending **Bench Gate 1**. |
| **4. Swashplateless Symmetry Cancellation & `10×` CG-Trim Arithmetic Error** | **AGREE — CORRECTED** | • **Symmetry Cancellation Fix**: Six identical blades with identical same-chirality $\delta_3 = +38^\circ$ skew experience equal instantaneous lag $\Delta\zeta(t)$ under a common hub torque pulse $\Delta\tau(t)$, producing only collective thrust ripple ($\sum_{b=1}^{6}\cos(\psi + \phi_b) = 0$ for transverse moments). To generate cyclic roll/pitch from a common motor torque ripple, opposing blades must have **opposite pitch-lag coupling** (*Paulos & Yim, AIAA 2018*). We implement the **Antisymmetric Dipole Hinge Law**: $\tan\delta_{3,b} = \tan(38^\circ)\cos\phi_b$ (so Blade $b=0$ at $0^\circ$ has $\delta_3 = +38^\circ$ and opposing Blade $b=3$ at $180^\circ$ has $\delta_3 = -38^\circ$, or a dedicated 2-blade Paulos–Yim rotor coupon in Gate 3).<br/>• **`10×` CG-Trim Correction**: For $m_p = 4.20\text{ g}$ ($0.0412\text{ N}$) shifted by $\Delta r_{\text{CG}} = 1.51\text{ mm}$, gravity trim torque is $0.0412\text{ N} \times 1.51\text{ mm} = \mathbf{0.0622\text{ N}\cdot\text{mm}}$ (`62.2 µN·m`), **not** `0.624 N·mm`. Thus the central voice-coil flexure provides **2-Axis OIS + fine static CG balance trim (`±0.062 N·mm`)**, while primary attitude control (`±1.10–1.25 N·mm` target) must come from the antisymmetric dipole swashplateless rotor verified in **Bench Gate 3**. |
| **5. Dandelion Terminal Descent (`3.05–3.22 m/s`), Porosity (`0.916`) & Contact Safety** | **AGREE — CORRECTED** | • **Descent Velocity**: Using $v_{\text{term}} = \sqrt{2mg / (\rho A C_D)}$ with $D = 70\text{ mm}$ ($A = 3.848\times 10^{-3}\text{ m}^2$) and $C_D = 4.2$ gives **$3.05\text{ m/s}$ at $9.40\text{ g}$** ($43.8\text{ mJ}$) and **$3.22\text{ m/s}$ at $10.45\text{ g}$** ($54.1\text{ mJ}$), not `0.82 m/s`.<br/>• **Nature 2018 Citation & Baseline Removal**: Cummins et al. (*Nature* 2018) measured passive dandelion seed porosity around $\epsilon \approx 0.916$, not `0.76`. Both the `+16%` pappus lift hypothesis and `-35% to -45%` human thermal-plume savings are **removed from the baseline power and endurance budget**.<br/>• **Whisker Contact Physics**: A `3.0 mm` whisker perimeter only affords `15 ms` warning for slow contact ($v \le 0.20\text{ m/s}$); faster hand motion ($>0.5\text{ m/s}$) reaches the rotor before full retraction, so low kinetic energy ($1.95\text{ mJ}$ at `4,500 RPM`) and compliant blades are the primary mitigation—all subject to physical testing. |
| **6. Mini-Projector Packaging, `14 fL = 48 nits` SMPTE Conversion & Scope** | **AGREE — CORRECTED & SEPARATED** | • **Separated to Phase II (Section 7)**: The baseline prototype (`SCARAB Ω³-CAM`) is strictly the camera-pet (`OV64B` + `VL53L5CX` + 2-Axis OIS).<br/>• **Projector Corrections**: Uses JBD's published `Roadrunner II` datasheet (`6.0 lumens`, `800×600`, `0.18 cc`, `98 mW` bare optical engine before projection relay lens/driver/cooling), removes the `9×9×4.35 mm` packaged `OSRAM PLPT9 450LC_E` from the `Ø 6.8 mm` capsule, removes Helmholtz–Kohlrausch perceptual multipliers from photometric `lm / lux / nits` tables, and corrects SMPTE cinema luminance from `14 nits` to **`14 foot-Lamberts = 48.0 nits`** (showing that `6 lm` at `1.2 m` throw yields `~3.6 nits`, which is `7.5%` of SMPTE theater luminance—suitable only for dark-room ambient graphics, whereas `15 cm` palm projection yields `~128 nits` physical). |

---

## 3. Consolidated Single Baseline Specification: `SCARAB Ω³-CAM` (Output A)

All mixed-version tables (`9.40 g` vs `9.85 g` vs `10.45 g` and `6.8 mm` vs `7.2 mm`) are unified below into **one internally consistent Camera-Pet engineering baseline**:

### 3.1 Consolidated Geometry & Envelope (`SCARAB Ω³-CAM`)
- **Stowed Wearable Envelope**:
  - **Bare Chameleon Core**: **`Ø 28.50 mm × 7.20 mm`** (`4.59 cm³` coin wafer)
  - **With Snap-On Cosmetic Shell (`Chrono-Bezel Ti`, `Obsidian Scarab`, or `Aurelia`)**: **`Ø 32.50 mm × 7.20 mm`** (`5.97 cm³`)
  - **Stowed Rotor Stack Inside Core**: **`Ø 24.76 mm × 2.60 mm`** (verified 2-hinge bi-fold coordinate envelope $\le \varnothing 25.0\text{ mm}$)
- **Deployed Flight Envelope**:
  - **Coaxial Rotor Tip-to-Tip Diameter ($D_{\text{flight}}$)**: **`Ø 64.00 mm`** ($R_{\text{tip}} = 32.00\text{ mm}$, gross disk area $A_{\text{disk}} = 32.17\text{ cm}^2$, net annular swept area $31.56\text{ cm}^2$ outside $\varnothing 8.8\text{ mm}$ shaft—**`6.69×` larger than two `Ø 17.5 mm` ducts**)
  - **Stationary Nitinol Bumper Halo ($D_{\text{halo}}$)**: **`Ø 70.00 mm`** (`3.0 mm` radial tip clearance)
  - **Deployed Total Axial Height ($H_{\text{flight}}$)**: **`16.40 mm`** (`9.20 mm` helical spline extension above stowed `7.20 mm` wafer)

### 3.2 Consolidated Mass & Energy Ledger (`9.85 g` Bare / `10.45 g` Shelled — `UNVERIFIED DESIGN TARGETS`)

| # | Subsystem / Component | Specification & Included Mechanisms | Mass (`g`) | Share (`%` of `10.45 g`) | Evidence Status |
| :---: | :--- | :--- | :---: | :---: | :--- |
| **1** | **2-Hinge Bi-Fold Coaxial Rotors (`×2`)** | Upper & Lower 6-blade bi-fold rotors ($L_1=13.0\text{ mm}, L_2=12.8\text{ mm}$, `160 µm` corrugated web) + `25 µm` NiTi root/knee flexure inserts + Paulos–Yim antisymmetric dipole $\delta_{3,b}$ skew (`+0.08 g` NiTi included) | **`1.05 g`** | `10.0%` | `UNVERIFIED TARGET` (Gate 1 Coupon) |
| **2** | **Peripheral Nitinol Bumper Ring** | `64 × 40 µm` superelastic Nitinol filaments (`Ø 70.0 mm`) + piezo/capacitive contact-sense trace (evaluated as bumper only; zero lift credit assumed) | **`0.15 g`** | `1.4%` | `UNVERIFIED TARGET` (Gate 1 Coupon) |
| **3** | **Dual Axial-Flux Brushless Motors** | Upper & Lower pancake stators + `N52SH` Halbach rotor rings with 1 saliency-notched pole per ring for sensorless `2.5 kHz` HFI phase tracking | **`1.95 g`** | `18.7%` | `UNVERIFIED TARGET` (Gate 2 Rig) |
| **4** | **Central `AlN`/Cu Shaft, Spline & Locks** | Stationary hollow `Ø 8.8 mm` `AlN`/Cu stator post + 3-start PTFE/PEEK helical spline (`9.2 mm` stroke) + `N52` axial end-latches (`+0.08 g`) + WC centrifugal lock pins (`+0.07 g`) | **`0.95 g`** | `9.1%` | `UNVERIFIED TARGET` (Gate 1 & 2) |
| **5** | **Swiveling Camera + 2-Axis OIS Pod** | `OV64B` / `16 MP` CMOS camera + `VL53L5CX` `8×8` ToF + `90°` pitch swivel prism + `0.18 g` 2-Axis Voice-Coil OIS flexure (`±0.062 N·mm` static CG trim; **No Projector in Baseline**) | **`0.95 g`** | `9.1%` | `UNVERIFIED TARGET` (Gate 4 Core) |
| **6** | **Main Avionics & Dual-FOC Flex-PCB** | `STM32G4` (`170 MHz` dual FOC + `1/rev` cyclic injector) + `GAP9` VIO/AI SoC + `ICM-42688-P` `32 kHz` IMU + `INA226` + BLE 5.4 / Wi-Fi | **`0.95 g`** | `9.1%` | `VERIFIED SILICON` / `UNVERIFIED PCB MASS` |
| **7** | **Base Wafer Chassis & Integration** | `Ø 28.5 × 4.6 mm` carbon-PEEK stator housing + magnetic wrist/collar bayonet ring + epoxy/solder/parylene allowance | **`0.45 g`** | `4.3%` | `UNVERIFIED TARGET` |
| **8** | **Annular Silicon-Anode LiHV Cell** | `Ø 24.5 × 3.2 mm` annular pouch cell (`205 mAh`, `3.85 V` nominal, **`0.79 Wh`** total energy, **`0.632 Wh`** at `80%` usable DoD) | **`3.40 g`** | `32.5%` | `UNVERIFIED TARGET` (Gate 2 Discharge Test) |
| — | **BARE CAMERA-PET CORE TOTAL** | **`Ø 28.50 × 7.20 mm` Stowed $\to$ `Ø 64.00 × 16.40 mm` Deployed** | **`9.85 g`** | `94.3%` | **`UNVERIFIED DESIGN TARGET`** |
| **9** | **Snap-On Cosmetic Top Shell** | `Shell 01 (Obsidian Scarab)`, `Shell 02 (Chrono-Bezel Ti)`, or `Shell 03 (Aurelia)` | **`0.60 g`** | `5.7%` | `UNVERIFIED TARGET` |
| — | **SHELLED CAMERA-PET TOTAL (`AUW`)** | **`Ø 32.50 × 7.20 mm` Stowed $\to$ `Ø 70.00 × 16.40 mm` Deployed (with Bumper)** | **`10.45 g`** | **`100.0%`** | **`UNVERIFIED DESIGN TARGET`** |

### 3.3 Consolidated Aerodynamic, Power & Endurance Baseline (Zero Plume / Pappus Bonus Credits)

| Parameter | Mathematical Formula / Assumption | Reconciled Value (`10.45 g` Shelled Baseline) | Evidence Status |
| :--- | :--- | :---: | :--- |
| **Hover Thrust Required ($W$)** | $W = m g = 0.01045\text{ kg} \times 9.81\text{ m/s}^2$ | **`0.1025 N` (`10.45 gf`)** | Exact Arithmetic |
| **Gross / Net Disk Area ($A_{\text{disk}}$)** | $A_{\text{gross}} = \frac{\pi}{4}(0.064\text{ m})^2 = 32.17\text{ cm}^2$ ($6.69\times$ two `17.5 mm` ducts) | **`32.17 cm²` (`31.56 cm²` net)** | Exact Geometry |
| **Disc Loading ($W / A_{\text{gross}}$)** | $0.1025\text{ N} / 0.003217\text{ m}^2$ (vs. `302.9 N/m²` on `Scarab Ω² Tier-1`) | **`31.86 N/m²` (`9.5×` lower)** | Exact Arithmetic |
| **Ideal Induced Velocity ($v_i$)** | $v_i = \sqrt{W / (2\rho A_{\text{gross}})}$ at $\rho = 1.225\text{ kg/m}^3$ | **`3.61 m/s`** | Actuator-Disk Lower Bound |
| **Ideal Actuator-Disk Power ($P_{\text{ideal}}$)** | $P_{\text{ideal}} = W \cdot v_i = W^{3/2} / \sqrt{2\rho A_{\text{gross}}}$ | **`0.370 W`** | Theoretical Lower Bound |
| **Aerodynamic Shaft Power ($P_{\text{shaft}}$)** | $P_{\text{ideal}} / \text{FM}_{\text{coax}}$ with coaxial interference $\kappa=1.26$ & profile drag ($\text{FM}_{\text{coax}} \in [0.44, 0.50]$) | **`0.74 – 0.84 W`** | `UNVERIFIED TARGET` (Gate 2) |
| **Propulsion Electrical Power ($P_{\text{prop}}$)** | $P_{\text{shaft}} / \eta_{m\cdot\text{esc}}$ with micro-outrunner + ESC efficiency $\eta_{m\cdot\text{esc}} \in [0.52, 0.58]$ | **`1.28 – 1.62 W`** | `UNVERIFIED TARGET` (Gate 2) |
| **Avionics, VIO Camera & OIS Power** | `STM32G4` (`55 mW`) + `GAP9` VIO (`85 mW`) + `OV64B`/`ToF` (`130 mW`) + Voice-Coil OIS (`50 mW`) | **`0.32 W`** | `UNVERIFIED TARGET` (Gate 4) |
| **Total Baseline Electrical Hover Power** | $P_{\text{elec, hover}} = P_{\text{prop}} + P_{\text{avionics}}$ (**`0.00 W` plume or pappus credit**) | **`1.60 – 1.94 W`** | **`UNVERIFIED TARGET` (Gate 2 & 4)** |
| **Arithmetic Hover Endurance (`80%` DoD)** | $\frac{0.79\text{ Wh} \times 0.80}{P_{\text{elec, hover}}} \times 60$ (`0.632 Wh` usable energy, `20%` reserve) | **`19.5 – 23.7 min`** | **Arithmetic Target (`UNVERIFIED`)** |
| **Passive Unpowered Descent ($v_{\text{term}}$)** | $v_{\text{term}} = \sqrt{2mg / (\rho A_{70\text{mm}} C_D)}$ at $C_D = 4.2$, $D = 70\text{ mm}$ ($A = 38.48\text{ cm}^2$) | **`3.22 m/s`** (`3.05 m/s` @ `9.4 g`) | Analytical Consistency Check |

---

## 4. Corrected Kinematics & Swashplateless Attitude Control Derivations

### 4.1 Resolution of the Euclidean Folding Bound (`2-Hinge Bi-Fold` vs. `1-Hinge Single-Arc`)
Why did a single-hinge blade fail to reach `D_stowed = 25.0 mm`?
- By the **Reverse Triangle Inequality**, any rigid 1-hinge blade pivoted at radius $R_{\text{hub}} = 6.20\text{ mm}$ whose tip reaches $R_{\text{flight}} = 32.00\text{ mm}$ has a fixed root-to-tip chord length $L_{\text{chord}} = 32.00 - 6.20 = 25.80\text{ mm}$. Regardless of what angle $\theta_{\text{fold}} \in [-180^\circ, +180^\circ]$ it rotates about its root hinge at $R_{\text{hub}}$, the distance from the shaft center $(0,0)$ to the blade tip satisfies:
  $$R_{\text{tip}}(\theta_{\text{fold}}) \ge L_{\text{chord}} - R_{\text{hub}} = 25.80\text{ mm} - 6.20\text{ mm} = 19.60\text{ mm} \implies D_{\text{stowed, 1-hinge}} \ge 39.20\text{ mm}$$
- To fold from **`D_flight = 64.00 mm` ($R = 32.00\text{ mm}$)** into **`D_stowed ≤ 25.00 mm` ($R \le 12.50\text{ mm}$)** without crossing the `Ø 8.80 mm` central shaft ($R_{\min} \ge 6.20\text{ mm}$), each blade in [`scarab_zipper_rotor.scad`](file:///Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_zipper_rotor.scad) (Rev 2.0) is partitioned into a **2-Hinge Bi-Fold Articulated Blade**:
  1. **Proximal Link ($L_1 = 13.00\text{ mm}$, circular arc sagitta $h_1 = 1.80\text{ mm}$)**: Pivots at $\mathbf{p}_{\text{root}} = (6.20\text{ mm}, 0)$ by $\theta_{1,\text{stowed}} = -118.0^\circ$, placing the mid-span knee hinge at radius $R_{\text{knee}} = 11.48\text{ mm}$ while keeping the entire link outside $R_{\min} = 6.20\text{ mm}$.
  2. **Distal Link ($L_2 = 12.80\text{ mm}$, circular arc sagitta $h_2 = 1.80\text{ mm}$)**: Pivots at the knee hinge by $\theta_{2,\text{rel}} = -102.0^\circ$ (with a centrifugal `0°` hard-stop tab that locks both links collinear above `800 RPM`), wrapping concentrically inside $R_{\max,\text{centerline}} = 11.48\text{ mm}$ (**`D_envelope = 24.76 mm ≤ 25.00 mm`** including blade width).

### 4.2 Paulos–Yim Antisymmetric Dipole Hinge Skew (`Solving Symmetry Cancellation`)
- **Why Identical Hinges Cancel**: Under a `1/rev` motor torque modulation $\Delta\tau(t) = \tau_c \cos(\Omega t - \psi_0)$, all blades on a hub experience the same angular acceleration $\ddot{\psi}_{\text{hub}}(t)$ and therefore the same instantaneous lead-lag deflection $\Delta\zeta_b(t) = \zeta_0 \cos(\Omega t - \psi_0 - \gamma_L)$ at time $t$. If every blade has the **same** pitch-lag coupling $k_{\theta\zeta,b} = \tan\delta_3 = \text{const}$, then all blades change pitch by the same $\Delta\theta(t)$ simultaneously—producing a pure vertical thrust oscillation $\Delta T(t)$ while the transverse hub moments cancel identically:
  $$\tau_{\text{roll}}(t) \propto \sum_{b=0}^{N_b-1} \Delta\theta_b(t) \sin(\Omega t + \phi_b) = \Delta\theta(t) \sum_{b=0}^{N_b-1} \sin(\Omega t + \phi_b) \equiv 0 \quad (\forall N_b \ge 2)$$
- **The Antisymmetric Dipole Solution (*Paulos & Yim, AIAA 2015 / IEEE TRO 2018*)**:
  To convert a common hub angular acceleration $\ddot{\psi}_{\text{hub}}(t)$ into a `1/rev` spatial tilt of the tip-path plane, opposing blades must have **opposite-sign pitch-lag coupling** ($k_{\theta\zeta}(\phi_b + \pi) = -k_{\theta\zeta}(\phi_b)$):
  $$\tan\delta_{3,b} = \tan(\delta_{3,\max}) \cos\phi_b, \qquad \phi_b = \frac{2\pi b}{N_b}$$
  - For a **2-Blade Paulos–Yim Rotor ($N_b = 2$, Bench Coupon Candidate C-1)**: Blade 0 ($\phi_0 = 0^\circ$) has $\delta_{3,0} = +38^\circ$ (lagging pitches blade UP) and Blade 1 ($\phi_1 = 180^\circ$) has $\delta_{3,1} = -38^\circ$ (lagging pitches blade DOWN).
  - For the **6-Blade Bi-Fold Rotor ($N_b = 6$, Bench Coupon Candidate C-2, implemented in `scarab_zipper_rotor.scad` line 86)**: $\delta_{3,b} = \arctan(\tan 38^\circ \cos\phi_b) = [+38.0^\circ, +21.3^\circ, -21.3^\circ, -38.0^\circ, -21.3^\circ, +21.3^\circ]$.
  - Now, under common hub lag $\Delta\zeta(t) = \zeta_{\max}\cos(\Omega t - \psi_0)$, blade $b$'s pitch is $\Delta\theta_b(t) = -\zeta_{\max}\tan\delta_{3,\max}\cos\phi_b \cos(\Omega t - \psi_0)$. Summing transverse moments around the disk yields a **non-zero cyclic control moment** while collective thrust ripple ($\sum_b \Delta\theta_b(t) = 0$) cancels to zero:
    $$\sum_{b=0}^{N_b-1} \cos\phi_b \cos(\Omega t - \psi_0) \cos(\Omega t + \phi_b) = \frac{N_b}{4}\cos\psi_0 \ne 0$$
- **Corrected Role of the 2-Axis Voice-Coil Payload Flexure (`±0.0622 N·mm`)**:
  - Tilting the $4.20\text{ g}$ ($0.0412\text{ N}$) internal camera/battery pod by $\pm 12^\circ$ ($\Delta r_{\text{CG}} = \pm 1.51\text{ mm}$) produces:
    $$\tau_{\text{trim}} = m_p g \Delta r_{\text{CG}} = 0.00420\text{ kg} \times 9.81\text{ m/s}^2 \times 1.51\text{ mm} = \pm 0.0622\text{ N}\cdot\text{mm}$$
  - Accordingly, the voice-coil flexure is designated strictly for **high-bandwidth 2-Axis Optical Image Stabilization (OIS)** and **fine static CG balance trim (`±0.062 N·mm`)**, while `100%` of primary roll/pitch maneuvering authority (`±1.10–1.25 N·mm` target) is assigned to the antisymmetric dipole swashplateless cyclic rotor.

---

## 5. Next Hardware Milestones: The 4 Sequential Bench Verification Gates (Output C)

No free-flight, acoustic, or endurance claim is treated as established until it passes the four sequential hardware gates below:

### Gate 0: Complete Force, Torque, Power & Acoustic Instrumentation Chain Validation
Before mounting any rotor coupon, validate the measurement rig itself:
1. **Mechanical Resonance Check ($f_{n,\text{loaded}} > 800\text{ Hz}$)**: Perform an impulse hammer/tap test on the 3-axis / 6-DOF aluminum strain-gauge load balance with a `15 g` dummy mass attached; verify via FFT that the lowest structural natural frequency exceeds `800 Hz` (well above the `73.3 Hz` `1/rev` and `200 Hz` control band).
2. **Instrumentation Amplifier Bandwidth at Operating Gain ($G = 500\text{–}1000$)**: Use **`AD8421` (`2 MHz` `-3 dB` bandwidth at $G = 1000$)** or **`INA826` (`200 kHz` at $G = 100$)** bridges (replacing `INA125P` whose GBWP drops below `4 kHz` at high gain), followed by an analog 4th-order Butterworth low-pass anti-aliasing filter ($f_c = 4.0\text{ kHz}$) into the `STM32G4` (`20 kSPS/ch` DMA ADC) or `ADS1256` (`30 kSPS`).
3. **Static & Dynamic Cross-Talk Calibration**: Apply NIST-traceable `1.00 g`, `5.00 g`, `10.00 g`, and `20.00 g` calibration weights along $F_z, F_y, \tau_x, \tau_y, \tau_z$ to compute the full $6\times 6$ compliance and cross-coupling calibration matrix.

### Gate 1: Passive Folding, Helical Spline & Hinge Fatigue Coupon (`$38` SLA + NiTi Coupon)
- **What We Build**: Print the Rev 2.0 [`scarab_zipper_rotor.scad`](file:///Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_zipper_rotor.scad) 2-hinge bi-fold rotor + mated 3-start helical spline sleeve (`0.20 mm` radial clearance) with `25 µm` superelastic `NiTi` root/knee strips and `N52` end-latch rings.
- **What We Measure**:
  1. Caliper measurement of actual stowed outer diameter (verifying `D_stowed ≤ 25.5 mm` vs. `64.0 mm` deployed) and stowed axial height (`H_stowed ≤ 2.8 mm`).
  2. Spin-up deployment threshold (`RPM` required to overcome the `1.40 N` stowed latch and lock both knee joints against their `0°` hard stops) and braking re-fold repeatability across `1,000` cycles on `240–1,000 fps` high-speed video.

### Gate 2: Matched-Lift (`10.45 gf = 102.5 mN`) Power, Thermal & Calibrated Acoustic Gate
- **What We Build**: Mount the `Ø 64 mm` coaxial rotor pair on two COTS micro-brushless motors (`1102` / `0802`) on the calibrated Gate 0 load balance inside a quiet room with measured ambient background noise (`≤ 28 dBA` logged before spin-up).
- **What We Measure at Exactly `10.45 gf` (`102.5 mN`) Vertical Lift**:
  1. **Electrical Input Power ($P_{\text{elec}} = V_{\text{bus}} I_{\text{bus}}$)**: Compare against a rigid `2 × Ø 17.5 mm` fixed-duct baseline at the same `10.45 gf` total lift. Pass criterion: `P_elec ≤ 1.85 W` for the `Ø 64 mm` coaxial rotor.
  2. **Calibrated Sound Level & Spectrum at `1.0 m` Distance**: Record A-weighted SPL (`dBA`) and narrowband FFT at `1.0 m` horizontal distance (`0°`, `45°`, `90°` elevation) using a calibrated Class-1/Class-2 measurement microphone (`Dayton iMM-6C` / `UMIK-1`), reporting both background noise floor and motor+rotor SPL.
  3. **Battery Discharge & Stator Thermal Trace**: Run a continuous constant-thrust discharge on a weighed `3.40 g` (`~200 mAh`) LiHV cell down to `20%` reserve while logging stator core temperature via thermocouple.

### Gate 3: Demonstrated Swashplateless Cyclic Roll/Pitch Moment & Cross-Coupling Gate
- **What We Build**: Test both **Candidate C-1 (2-Blade Paulos–Yim Opposite-Skew Rotor)** and **Candidate C-2 (6-Blade Dipole-Skew Bi-Fold Rotor)** with `1/rev` sinusoidal current injection $\Delta I_q(\psi) = I_{\text{cyc}}\cos(\psi - \psi_0)$ on the 6-DOF balance.
- **What We Measure**:
  1. Commanded positive and negative Roll ($\pm\tau_x$) and Pitch ($\pm\tau_y$) moments vs. $I_{\text{cyc}}$ and phase angle $\psi_0 \in [0^\circ, 360^\circ]$.
  2. Parasitic yaw ($\Delta\tau_z$), vertical thrust droop ($\Delta F_z$), and off-axis cross-coupling.
  3. Stroboscopic / high-speed video measurement of actual cyclic blade pitch deflection $\Delta\theta(\psi)$ and closed-loop step/frequency response (`1–50 Hz` sweep). Pass criterion: `≥ ±0.60 N·mm` controllable orthogonal roll/pitch moment with `< 15%` uncompensated cross-coupling.

### Gate 4: Weighed `10.45 g` Camera-Pet Free-Flight Hover Gate
- **What We Build**: Integrate the Gate 1–3 coaxial propulsion core with the weighed `3.40 g` cell, `OV64B` camera + `VL53L5CX` ToF + 2-Axis OIS pod, and flight controller.
- **What We Measure**: Verify total mass on a `0.01 g` scale, demonstrate stable untethered 4-DOF hover, log actual hover watts and flight duration to `20%` battery reserve, and capture stabilized indoor video.

---

## 6. Consolidated Comparison Table: Archived `SCARAB Ω²` vs. Active `SCARAB Ω³-CAM` Baseline

| Metric | Archived `SCARAB Ω² Tier-1` *(Fixed Twin-Duct)* | **Consolidated `SCARAB Ω³-CAM` Baseline** *(Expandable 2-Hinge Bi-Fold Camera-Pet)* | Evidence & Verification Status |
| :--- | :---: | :---: | :--- |
| **Stowed Wearable Envelope** | `42.5 × 28.5 × 17.2 mm` | **`Ø 28.5 × 7.2 mm` Core (`Ø 32.5 × 7.2 mm` Shelled)** | `UNVERIFIED TARGET` (Gate 1 CAD/Coupon) |
| **Deployed Rotor Diameter & Area** | `2 × Ø 17.5 mm` (`4.81 cm²`) | **`Ø 64.0 mm` (`32.17 cm²` gross / `31.56 cm²` net)** | **`6.69×` area advantage** (Exact Geometry) |
| **Stowed Rotor Diameter (Verified CAD)** | `2 × Ø 17.5 mm` (non-folding) | **`Ø 24.76 mm × 2.60 mm` (2-Hinge Bi-Fold Rev 2.0)** | Verified in `scarab_zipper_rotor.scad` Rev 2.0 |
| **Total Flying Mass (`AUW`)** | `14.85 g` (`Tier-1`) / `11.40 g` (`Tier-2`) | **`9.85 g` (Bare Core) / `10.45 g` (With `0.60 g` Shell)** | `UNVERIFIED TARGET` (Gate 4 Scale Weigh-In) |
| **Battery Mass & Capacity** | `4.42 g` (`0.84 Wh`) | **`3.40 g` (`0.79 Wh` total / `0.632 Wh` @ `80%` DoD)** | `UNVERIFIED TARGET` (Gate 2 Discharge Test) |
| **Ideal Actuator-Disk Hover Power** | `1.62 W` (at `14.85 g`) | **`0.370 W` (at `10.45 g`, `v_i = 3.61 m/s`)** | Exact Momentum-Theory Lower Bound |
| **Reconciled Electrical Hover Power** | `4.54 – 4.85 W` (no wake-surf credit) | **`1.60 – 1.94 W` (`0.00 W` plume/pappus credit)** | `UNVERIFIED TARGET` (Gate 2 Wattmeter) |
| **Arithmetic Hover Endurance (`80%` DoD)** | `8.3 – 8.9 min` | **`19.5 – 23.7 min`** | Arithmetic Target (`UNVERIFIED` pending Gate 4) |
| **Roll & Pitch Control Mechanism** | Chiral Coandă Scrolls (`±0.76 N·mm` target) | **Paulos–Yim Antisymmetric Dipole $\delta_{3,b}$ Cyclic (`±1.10 N·mm` target) + `±0.062 N·mm` Voice-Coil CG Trim** | `UNVERIFIED TARGET` (Gate 3 6-DOF Balance) |
| **Passive Unpowered Descent ($C_D=4.2$)** | `~14.5 m/s` (ballistic pebble) | **`3.22 m/s` (at `10.45 g`, `Ø 70 mm`)** | Analytical Consistency Check |

---

## 7. Separate Phase II Exploratory Tracks (Not Included in Baseline Mass, Power or Schedule)

Per Codex Output D, the following investigations are decoupled from the `SCARAB Ω³-CAM` camera-pet baseline and evaluated independently only after Gate 4 hover is demonstrated:

### 7.1 Phase II-A: Sub-Gram / `1 g` Micro-Projection Optical Relay Study
- **Verified Commercial Reference Silicon**: Jade Bird Display's **JBD `Roadrunner II`** (June 2026) demonstrates a **`0.18 cc`**, **`98 mW` typical power**, **`800×600`**, **`6.0 lumen`** polychrome MicroLED optical engine designed for near-eye AR waveguides.
- **What Remains Unverified for Direct Surface Projection**: Adapting a near-eye waveguide engine (`0.18 cc`) into a finite-conjugate surface projector (`15 cm` palm to `1.2 m` wall) requires custom projection relay optics, LED current drivers, thermal sinking, and focus actuation (`PoLight TLens`). Furthermore, packaged edge-emitting lasers such as the `OSRAM PLPT9 450LC_E` (`9.0 × 9.0 × 4.35 mm` single TO-can) are too large for an `Ø 8.8 mm` central shaft and would require a custom bare-die multi-chip package.
- **Corrected Physical Photometric Table (Using `6.0 lumens` JBD Datasheet Output, `0` Perceptual Multipliers, and `14 fL = 48.0 nits` SMPTE Reference)**:
  - **At `15 cm` Throw (`Palm HUD`, `10.9 × 6.1 cm` = `0.00671 m²`)**: Physical illuminance $E_v = 6.0\text{ lm} / 0.00671\text{ m}^2 = \mathbf{894\text{ lux}}$. On skin ($\rho = 0.45$), physical reflected luminance is $L_v = \frac{0.45 \times 894}{\pi} = \mathbf{128\text{ nits}}$ (legible in indoor `300 lux` lighting at `CR ≈ 4.0:1`).
  - **At `35 cm` Throw (`Tabletop Pad`, `25.5 × 14.3 cm` = `0.0365 m²`)**: Physical illuminance $E_v = \mathbf{164\text{ lux}}$; reflected luminance on white paper ($\rho = 0.80$) is **$\mathbf{41.8\text{ nits}}$** (usable in dim/moderate indoor lighting `≤ 100 lux`).
  - **At `1.2 m` Throw (`Dark-Room Wall`, `87.3 × 49.1 cm` = `0.429 m²`)**: Physical illuminance $E_v = \mathbf{14.0\text{ lux}}$; reflected luminance on a matte white wall ($\rho = 0.80$) is **$\mathbf{3.56\text{ nits}}$**—which is **`7.4%` of the SMPTE `14 fL` (`48.0 nits`) cinema standard**, making `1.2 m` wall projection suitable only for dark-room (`< 1 lux`) ambient graphics/clock display rather than theater-bright video.

### 7.2 Phase II-B: Porous Tip-Ring (`ε ≈ 0.916`) & Thermal Updraft Bench Experiments
- Separate from the baseline, a stationary porous filament ring modeled on the natural dandelion pappus porosity ($\epsilon \approx 0.916$, *Cummins et al., Nature 2018*) and station-keeping above a `34°C` heated thermal plume mannequin (`w_plume ≈ 0.25–0.35 m/s`) may be tested on the Gate 2 load balance to determine whether any measurable thrust-per-watt difference exists vs. an bare open rotor. Zero credit is assumed in the baseline.
