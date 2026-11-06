# 🛸 [ARCHIVED FIXED-DUCT BASELINE] `SCARAB Ω²` (`Arch 4.2`): Reconciled Fixed-Duct Concept & Trade-Off Specification

> [!WARNING]
> **Architectural Status — Archived Fixed-Duct Variant (Superseded by Expandable-Rotor `SCARAB Ω³-CAM` Consolidated Baseline)**:
> Per the November 6, 2026 Engineering Consolidation Review, the **expandable-rotor architecture (`SCARAB Ω³-CAM`, `Ø 64 mm` deployed disk)** is the active primary engineering track because `6.69×` larger swept area reduces disc loading and ideal hover power from first principles. This document preserves the **`SCARAB Ω²` (`2 × Ø 17.5 mm` fixed twin-duct)** concept with **all tables and sections fully reconciled** (superseded phase-locked wake-surfing `-9.2%` power credits and continuous `180 Hz` dither removed from dynamic hover budgets, and "universal physical floors" reclassified as practical design trade-off knees). All figures remain **`UNVERIFIED DESIGN TARGETS`** pending bench testing.

---

## 1. Reconciled Summary of Fixed-Duct Mechanisms (`SCARAB Ω² / Arch 4.2`)

1. **Opposite-Chirality Chiral Coandă Scrolls (`UNVERIFIED — Candidate for Bench Gate A`)**:
   - Uses residual swirl from counter-rotating coaxial rotors mounted on a **Single Inter-Rotor X-Vane Hub ($z = 0$)** to steer the exit jet across curved ventral cheeks ($R_c = 6.0\text{ mm}$), governed by a **16-element empirically calibrated asymmetric allocation matrix $\mathbf{B}_{\text{cal}}$**.
   - *Superseded hypotheses removed from baseline*: Fixed-phase coaxial wake-surfing (`+8.4%` lift / `-9.2%` power) is incompatible with differential-RPM roll commands and is **excluded** from the active hover budget. Continuous `180 Hz` AC rotor speed dither incurs continuous $I^2R$ winding losses and is **excluded** from steady hover.
2. **Split-Gyroid Clamshell & Hybrid Necked-Helmholtz (`1.24 kHz`) + Quarter-Wave (`2.26–3.57 kHz`) Liner (`UNVERIFIED — Candidate for Bench Gate B`)**:
   - Combines 8 lumped-element **Necked Helmholtz resonators** (`0.35 mm` slit neck + `42 mm³` cavity targeting the `1.25 kHz` 1st BPF) with 8 **Quarter-Wave channels** ($L_{\text{eff}} = 24–38\text{ mm}$ targeting the `2.26–3.57 kHz` 2nd/3rd harmonics) inside a 2-piece molded shell (`≥ 2.5°` draft angle, pending moldflow/tooling validation).
3. **Structural Battery Sandwich I-Beam + Shared `47 µF` DC-Link Bus (`UNVERIFIED — Candidate for Bench Gate C`)**:
   - Laminates top/bottom flex-PCB skins onto the pouch cell core (`14.85 g` Tier-1 COTS-hybrid target / `11.40 g` Tier-2 custom-silicon target).

---

## 2. Reconciled Fixed-Duct Mass, Power & Endurance Baseline Table (Without Superseded Credits)

Removing the superseded `-9.2%` wake-surfing power credit and accounting for non-ideal coaxial interference and profile drag shifts the `SCARAB Ω²` electrical hover power targets from `4.12 W / 2.78 W` to the **reconciled conservative targets of `4.54–4.85 W` (`Tier-1`) and `3.06–3.35 W` (`Tier-2`)**:

| Subsystem / Metric | `Arch 3A` (Vanes + Servos) | `SCARAB Ω` (Pass 1) | **`SCARAB Ω² Tier-1` (Reconciled COTS-Hybrid Target)** | **`SCARAB Ω² Tier-2` (Reconciled Custom-Silicon Target)** | Evidence Status & Reconciled Notes |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **1. Carapace & Hybrid Liner** | `2.60 g` | `1.75 g` | **`1.18 g`** | **`0.88 g`** | `UNVERIFIED TARGET` — 8 Necked-Helmholtz (`1.24 kHz`) + 8 $\lambda/4$ (`2.26–3.57 kHz`) cells. |
| **2. Deployable Elytra + Hinge** | `3.65 g` | `1.05 g` | **`0.77 g`** | **`0.56 g`** | `UNVERIFIED TARGET` — Tape-spring curved-crease shell (`85 → 28 µm`). |
| **3. Roll Control Mechanism** | `1.90 g` | `0.00 g` | **`0.00 g`** | **`0.00 g`** | `UNVERIFIED TARGET` — Chiral Coandă scroll + calibrated asymmetric matrix $\mathbf{B}_{\text{cal}}$. |
| **4. 4× Motors + Inter-Rotor X-Vanes** | `5.30 g` | `3.80 g` | **`3.48 g`** | **`2.42 g`** | `UNVERIFIED TARGET` — Stators mounted strictly at $z=0$ (between rotors) to preserve exit swirl. |
| **5. 4× Rotors (`Cand. R-A` vs `R-B`)** | `0.85 g` | `0.75 g` | **`0.68 g`** | **`0.48 g`** | `UNVERIFIED TARGET` — Tested separately: symmetric `3×5` (`R-A`) vs unequal `[0°,113°,238°]` (`R-B`). |
| **6. Avionics + ESC (I-Beam Skins)** | `2.85 g` | `1.55 g` | **`1.42 g`** | **`0.86 g`** | `UNVERIFIED TARGET` — Shared `47 µF` DC bus (`180 Hz` dither disabled in steady hover). |
| **7. Battery Web (Structural Core)** | `5.85 g` | `4.75 g` | **`4.42 g` (`0.84 Wh`)** | **`3.26 g` (`0.84 Wh`)** | `UNVERIFIED TARGET` — Requires cell discharge curve verification at `4.5–4.9 W` load. |
| **8. AI Camera + ToF + Flow + Perch** | `1.80 g` | `1.80 g` | **`1.68 g`** | **`1.14 g`** | `UNVERIFIED TARGET` — Windowed CMOS sensor + ToF + magnetic wrist/wall dock. |
| **9. Fasteners, Glue & Coating** | `1.40 g` | `0.95 g` | **`1.22 g`** | **`1.80 g`** | `8.2–15.8%` adhesive, solder & parylene integration allowance. |
| **TOTAL FLYING MASS (AUW)** | **`23.60 g`** | `16.40 g` | **`14.85 g` (`TARGET`)** | **`11.40 g` (`TARGET`)** | Arithmetic sum verified; physical hardware mass unmeasured. |
| **Reconciled Hover Power (No Wake-Surf Credit)** | `9.10 W` | `5.14 W` | **`4.54 – 4.85 W` (`TARGET`)** | **`3.06 – 3.35 W` (`TARGET`)** | Superseded `-9.2%` wake-surfing credit removed from dynamic hover baseline. |
| **Reconciled Hover Endurance (`80%` DoD)** | `4.2 min` | `7.8 min` | **`8.3 – 8.9 min` (`TARGET`)** | **`12.0 – 13.1 min` (`TARGET`)** | Recalculated at `0.84 Wh × 0.80 usable` divided by reconciled hover power. |

---

## 3. Reclassified Practical Design Trade-Off Knees (Replacing "Universal Physical Floors")

The four scaling limits encountered in the `17.5 mm` fixed-duct topology are **practical design trade-off knees (steep-penalty regimes)** for this specific geometry rather than immutable floors of nature:
1. **Battery Mass Knee (`~3.2–4.4 g` for `0.84 Wh`)**: Set by practical current-collector foil, separator, and pouch packaging overhead at high C-rates.
2. **Low-Reynolds Profile Drag Knee ($Re_c < 8,000$)**: Micro-propellers can and do operate below $Re = 8,000$ (e.g., at $Re = 6,500$ in `arXiv:2306.17087`), but laminar separation increases profile drag power—which is precisely why expanding the rotor to `Ø 64 mm` in `SCARAB Ω³-CAM` is advantageous.
3. **Stator Magnetic Saturation Knee (`B_sat ≈ 2.1–2.3 T`)**: Shrinking stator iron below `~0.45 g/motor` at fixed torque increases winding $I^2R$ and core losses.
4. **Acoustic Channel Viscothermal Attenuation Knee ($w_{\text{ch}} \approx 0.75\text{ mm}$)**: Narrower channels suffer higher Stinson boundary-layer resistance $R_s$, reducing resonator Q-factor.

---

## 6. Interactive 3D Build Mockup, Live Scale Simulation & Deployment Links

All interactive 3D visualizations and specifications are live on GitHub Pages (`HTTP 200` verified) and synced 2-way to Google Drive:
- **Live Interactive 3D Build & Multi-Scale Concept Explorer (`SCARAB Ω / Ω²` Wrist Scale + `62 mm` Pro + `95 mm` Scout + Exploded 4-Layer Stack)**:
  - 🌐 **Web App**: https://portalstest.github.io/photogenik-scarab/omega-scale.html
  - 📄 **Local Artifact**: [scarab_omega_build_and_live_scale_3d.html](file:///Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_omega_build_and_live_scale_3d.html)
- **Live Chiral Coandă & Hybrid Acoustic Liner Concept Animation**:
  - 🌐 **Web App**: https://portalstest.github.io/photogenik-scarab/omega.html
  - 📄 **Local Artifact**: [scarab_omega_navier_stokes_3d_sim.html](file:///Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_omega_navier_stokes_3d_sim.html)
- **Arch 3 Step-by-Step MVP Baseline Viewer**:
  - 🌐 **Web App**: https://portalstest.github.io/photogenik-scarab/arch3-mvp.html
  - 📄 **Local Artifact**: [scarab_arch3_mvp_step_by_step_3d.html](file:///Users/harshagopalakrishnan/.gemini/antigravity/brain/5ab20869-3c32-47e8-8bc0-420f77058afb/scarab_arch3_mvp_step_by_step_3d.html)

---

## 7. 3-Model Triad Disposition of Codex `SCARAB Ω²` Plausibility Review (Nov 6, 2026)

### 7.1 Point-by-Point Disposition (`AGREE` on All 6 Audit Points & Implemented Corrections)

1. **Point 1 — Public Simulators (`omega.html` & `omega-scale.html`) Are Concept Animations, Not CFD/FFT Solver Outputs (`AGREE — FIXED`)**:
   - **Disposition**: Strongly agree. `omega.html` (lines 230–243, 448–470) and `omega-scale.html` are parametric JavaScript concept animations and analytical target explorers, not Navier–Stokes mesh solutions or measured microphone FFT traces.
   - **Correction Applied**: Both web apps (`omega.html` and `omega-scale.html`) and all documentation headers have been updated to explicitly read: **`INTERACTIVE CONCEPT ANIMATION & ANALYTICAL TARGET EXPLORER (⚠️ UNVERIFIED DESIGN TARGETS — NOT MEASURED FFT OR CFD SOLVER OUTPUT)`**. All language implying "solved physics", "proven floors", or "completed optimization" ahead of physical bench data is retired in favor of **analytical concept targets pending bench validation**.

2. **Point 2 — Acoustic Proof Corrections: Tyler–Sofrin Selection Rule, Quarter-Wave vs. Helmholtz Frequency & Complex Wall Impedance (`AGREE — CORRECTED`)**:
   - **Correction 2A (Tyler–Sofrin $m = 3n_1 - 5k$ Selection Rule & Unequal Azimuth Spacing)**:
     - For equal-spaced coprime rotors ($B_1 = 3, B_2 = 5$), $m = 3n_1 - 5k = 0$ is **not** forbidden for all harmonic integers—it occurs at the lowest common multiple **$n_1 = 5, k = 3$ ($15\Omega \approx 6.25\text{ kHz}$)**, while blocking lower-order plane-wave coincidences ($n_1 < 5, k < 3$).
     - Furthermore, introducing unequal azimuthal blade spacing (`[0°, 113°, 238°]`) on the upper rotor breaks strict $3\Omega$ azimuthal periodicity, spreading energy into all shaft harmonics $n\Omega$ ($n = 1, 2, 3\dots$), which invalidates the simple symmetric selection rule $m = 3n_1 - 5k$. Therefore, we separate these into two distinct bench test candidates: **Candidate R-A** (Symmetric Coprime `3×5`) vs. **Candidate R-B** (Unequal-Azimuth `[0°, 113°, 238°]` Upper + `5`-Blade Lower) rather than claiming both rules hold simultaneously.
   - **Correction 2B (Quarter-Wave Path Length $L_{\text{eff}} = 24–38\text{ mm}$ vs. `1.25 kHz` Fundamental BPF)**:
     - In standard air ($c_0 = 343\text{ m/s}$), a pure open-ended quarter-wave resonator of length $L_{\text{eff}} \in [24, 38]\text{ mm}$ resonates at:
       $$f_{\lambda/4} = \frac{c_0}{4 L_{\text{eff}}} \in [2.26\text{ kHz}, 3.57\text{ kHz}]$$
       which targets the **2nd and 3rd BPF harmonics (`2.50 kHz` and `3.75 kHz`)**, **not** the `1.25 kHz` fundamental BPF (which would require $L_{\lambda/4} = 68.6\text{ mm}$ in a pure quarter-wave tube).
     - To target the **`1.25 kHz` fundamental BPF** within a `2.1–2.2 mm` shell wall without a `71.5 mm` channel, half of the 16 azimuthal cells must be configured as **lumped-element Necked Helmholtz Resonators** ($f_H = \frac{c_0}{2\pi}\sqrt{\frac{A_{\text{neck}}}{V_{\text{cav}}(l_{\text{neck}} + \Delta l_{\text{end}})}}$, using a `0.35 mm` slit neck opening into a `42 mm³` coiled backing volume), while the remaining cells act as **`24–38 mm` quarter-wave tubes** for the `2.26–3.57 kHz` harmonics.
   - **Correction 2C (Complex Acoustic Impedance $Z_s = R_s + i X_s$)**:
     - Resonance ($\text{Im}(Z_s) = X_s = 0$) does **not** mean $Z_s = 0$; the real viscothermal resistance $R_s = \text{Re}(Z_s) > 0$ remains finite and essential. For a grazing-incidence duct liner, maximum acoustic power absorption requires **critical resistance matching** ($R_s \approx \rho_0 c_0\,\theta_{\text{opt}}$), not zero impedance.

3. **Point 3 — Asymmetric Coaxial Control Matrix & Empirical Calibration (`AGREE — CORRECTED`)**:
   - **Disposition**: Because the upper 3-loop rotor ($B_1 = 3$, clean inflow) and lower 5-blade rotor ($B_2 = 5$, operating in the upper rotor's contracted slipstream) have **unequal thrust and torque coefficients ($k_{T1} \ne k_{T2}, k_{Q1} \ne k_{Q2}$)**, a symmetric motor command $\Delta(\omega_1^2) = -\Delta(\omega_2^2)$ will produce **parasitic yaw torque and vertical thrust droop**.
   - **Correction Applied**: Replace the idealized symmetric Walsh-Hadamard matrix with a **Calibrated Asymmetric Allocation Matrix $\mathbf{B}_{\text{cal}}$**:
     $$\begin{bmatrix} T_z \\ \tau_{\text{roll}} \\ \tau_{\text{pitch}} \\ \tau_{\text{yaw}} \end{bmatrix} = \begin{bmatrix} k_{T,A1} & k_{T,A2} & k_{T,B1} & k_{T,B2} \\ +\gamma_{y,A1} & -\gamma_{y,A2} & -\gamma_{y,B1} & +\gamma_{y,B2} \\ +x_A k_{T,A1} & +x_A k_{T,A2} & -x_A k_{T,B1} & -x_A k_{T,B2} \\ +k_{Q,A1}+\beta_{A1} & -k_{Q,A2}-\beta_{A2} & -k_{Q,B1}+\beta_{B1} & +k_{Q,B2}-\beta_{B2} \end{bmatrix} \begin{bmatrix} \omega_{A1}^2 \\ \omega_{A2}^2 \\ \omega_{B1}^2 \\ \omega_{B2}^2 \end{bmatrix}$$
     where all 16 coefficients (and their saturation nonlinearity) are measured directly on a 6-axis force/torque load cell before flight.

4. **Point 4 — Negative Subsystem Interactions (`AGREE — ARCHITECTURAL FIXES APPLIED`)**:
   - **Interaction 4A (De-Swirl Vanes vs. Swirl-Driven Coandă Roll)**: If stator support vanes sit *below* the lower rotor and straighten the exit flow to recover axial thrust, they remove the residual swirl $S$ required by the Coandă exit scroll to generate lateral roll force!
     - **Architectural Fix**: Move all 4 motor stators onto a **Single Inter-Rotor X-Vane Hub at $z = 0$ (strictly between Upper Rotor 1 and Lower Rotor 2)**, mounting the upper and lower stators back-to-back on the central hub. This conditions inter-rotor swirl while leaving the **lower rotor's exit wake 100% unobstructed** into the ventral Coandă scroll.
   - **Interaction 4B (Phase-Locked Wake Surfing vs. Differential-RPM Roll Control)**: Any differential RPM command ($\omega_1 \ne \omega_2$) for Coandă roll or yaw continuously sweeps the relative blade phase angle, breaking fixed-phase wake synchronization ($\Delta z/D = 0.215$).
     - **Architectural Fix**: Remove the `+8.4%` wake-surfing lift and `-9.2%` power credit from the dynamic flight budget; evaluate phase-locking only as an isolated steady-hover bench experiment.
   - **Interaction 4C (`180 Hz` AC Rotor Dither vs. `81%` Regenerative Bus)**: Driving continuous `180 Hz` speed modulation incurs continuous $I^2 R$ winding losses ($19\%$ unrecovered per half-cycle = net electrical power penalty in steady hover).
     - **Architectural Fix**: Disable `180 Hz` dither in steady hover; trigger it **only on-demand during high-angle roll bursts (`>15°`)** if bench testing confirms boundary-layer attachment gains outweigh the transient watt cost.

5. **Point 5 — Literature Scope & Practical Steep-Penalty Regimes (`AGREE — TERMINOLOGY CORRECTED`)**:
   - **Disposition**: Reclassify the 4 "Hard Physical Floors" as **Practical Design Trade-Off Knees (Steep-Penalty Regimes)** for this specific `0.84 Wh` / `17.5 mm` coaxial topology rather than universal laws of nature (noting that micro-rotors operate below $Re = 8,000$, e.g., at $Re = 6,500$ in `arXiv:2306.17087`, at the cost of higher profile drag power, and that `arXiv:2509.14185` on unstable fluid singularities is conceptual inspiration for non-intuitive boundary shaping rather than a duct optimization proof).

6. **Point 6 — Bench Instrumentation Upgrade (`HX711` `10/80 SPS` Replaced with `20–30 kSPS` High-Bandwidth DAQ)**:
   - **Disposition**: Codex caught a critical instrumentation error: the `HX711` (`10` or `80 SPS`, `12.5–100 ms` sample period) cannot resolve a `2–3 ms` transient step or `180 Hz` modulation.
   - **Instrumentation Fix**: Replace `HX711` with an **analog instrumentation bridge (`INA125P` / `AD620`, `>10 kHz` `-3 dB` bandwidth) sampled by an `ADS1256` (`30 kSPS` 24-bit SPI ADC) or `STM32G4` internal `12-bit` DMA ADC (`20 kSPS` per channel)** across a **6-DOF force/torque balance ($F_x, F_y, F_z, \tau_x, \tau_y, \tau_z$)** + optical/Hall shaft tachometers (`100 kHz` timer capture).

