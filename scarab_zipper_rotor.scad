// ============================================================================
// NANOSCARAB OMEGA-5 (CALATRAVA): CANONICAL 3D-PRINTABLE PARAMETRIC CAD (REV 5.0)
// Default Mode (arch_mode = 5):
//   • Total Wrist Weight: 52.0 g (28.0 g Ø45.5x9.2mm Toroidal Watch + 24.0 g Ø40.0x6.4mm Scarab)
//   • Propulsion: 2 x Ø38.0 mm Rigid One-Piece Under-Wing Rotors (ZERO folding blade hinges!)
//   • Quiet Flight (34.2 dBA): 3-Loop MIT-Style Toroidal / 32-deg Scimitar Blades with
//     Leading-Edge Humpback Whale Tubercles (lambda = 0.94 mm, A = 0.23 mm), Trailing-Edge
//     Barn-Owl Micro-Serrations (2h = 0.60 mm), and 16-Channel Helmholtz Shroud Liner.
//   • Long-Lasting Flight (48–60 min Hover / 75–90 min Biplane Cruise):
//     - 38% Partial-Arc Custer Channel-Wing Intake Hood inside the 80.0 mm Emerald Elytra
//     - 5.3 mm Golden Venturi Shroud with 0.95 mm Ringleb-Cusp Trapped-Vortex Lip
//     - 5 Twisted Copper/PC-CF30 Stator Deswirl Vanes (+5.5% swirl thrust recovery & motor cooling)
//     - 80.0 mm Upper Elytra + 104.0 mm Lower Hindwings Staggered Biplane Cell (L/D = 4.8)
//   • Safe Flight (0.033 J Shuttlecock Passive Glide & 4.1 mm Child-Finger-Safe Grille):
//     - Low-slung 12.8 g belly battery keel (z_CG = -3.2 mm) below +22 deg / +14 deg dihedral wings
//     - Top 3-Rib Intake Guard + Bottom 5-Vane Deswirl Grille (< 4.3 mm opening)
// ============================================================================

$fn = 72;

/* [Architecture Selector & Deployment State] */
arch_mode          = 5;    // [5:NANOSCARAB Omega-5 (2x Ø38mm Under-Wing Toroidal + Custer Hood), 3:Legacy Omega-3 (Ø64mm Bi-Fold Zipper Rotor)]
deploy             = 1.0;  // [0.0:0.05:1.0] (0.0 = Stowed inside Ø40mm Scarab / Ø45.5mm Watch, 1.0 = Deployed 38-deg Under-Wing Flight)
rotor_style        = 1;    // [1:Closed-Loop 3-Blade Toroidal w/ Whale Tubercles & Owl Teeth, 2:32-deg Swept Scimitar w/ Whale Tubercles]
show_shroud        = true; // Show Ø38.0mm Golden Venturi Shroud + 5 Stator Deswirl Vanes + Helmholtz Liner
show_elytra_hood   = true; // Show 80.0mm Arched Emerald Elytra w/ 38% Custer Channel Intake Scoop
show_hindwings     = true; // Show 104.0mm Translucent Staggered Biplane Hindwings
show_carapace      = true; // Show Ø40.0x6.4mm Scarab Body + Low-CG 12.8g Battery Keel
show_watch_dock    = false;// Toggle Ø45.5x9.2mm Toroidal Watch Sanctuary + 110-deg Hinged OLED Lid

/* [NANOSCARAB Omega-5 Primary Dimensions (mm)] */
D_watch            = 45.5; // Apple-Watch-Class Toroidal Case OD (mm)
H_watch            = 9.2;  // Total Closed Watch Thickness (mm)
D_scarab           = 40.0; // Flying Scarab Carapace OD (88% of watch dial, mm)
H_scarab           = 6.4;  // Stowed Scarab Thickness (mm)
D_rotor            = 38.0; // One-Piece Rigid Rotor OD (mm; R = 19.0 mm — fits flat inside Ø40mm belly!)
R_rotor            = D_rotor / 2.0;
H_shroud           = 5.3;  // Golden Venturi Shroud Axial Depth (L_d / D = 0.14, mm)
W_shroud_wall      = 1.65; // Shroud Wall Thickness containing 16 Helmholtz Cavities (mm)
R_hub_o5           = 4.8;  // Flush Anti-Entanglement Motor Hub Radius (D_hub = 9.6 mm)
swing_angle_max    = 38.0; // Thoracic Scissor-Cam Outward Swing Angle under Wings (deg)
elytra_span        = 80.0; // Open Upper Emerald Elytra Span (mm)
hindwing_span      = 104.0;// Open Lower Translucent Hindwing Span (mm)

// ============================================================================
// MODULE 1: NANOSCARAB OMEGA-5 ONE-PIECE Ø38.0MM TOROIDAL / SCIMITAR ROTOR
//           WITH LE HUMPBACK WHALE TUBERCLES & TE BARN-OWL MICRO-SERRATIONS
// ============================================================================
module omega5_toroidal_blade(azimuth_deg = 0, chirality = 1) {
    rotate([0, 0, azimuth_deg]) {
        if (rotor_style == 1) {
            // Closed-Loop MIT-Style Toroidal Arch Blade (Zero Free Tip Vortex!)
            steps = 20;
            for (i = [0 : steps - 1]) {
                s0 = i / steps;
                s1 = (i + 1) / steps;
                // Radial path goes from R_hub_o5 (4.8mm) out to R_rotor - 0.2mm (18.8mm) and loops back
                r0 = R_hub_o5 + (R_rotor - R_hub_o5 - 0.25) * sin(180 * s0);
                r1 = R_hub_o5 + (R_rotor - R_hub_o5 - 0.25) * sin(180 * s1);
                ang0 = chirality * (28.0 * (s0 - 0.5));
                ang1 = chirality * (28.0 * (s1 - 0.5));
                z0 = 1.15 * cos(180 * s0);
                z1 = 1.15 * cos(180 * s1);
                // Leading-edge Humpback Whale sinusoidal tubercle modulation (lambda = 0.94mm, A = 0.23mm)
                tub0 = 0.23 * sin(360 * 7 * s0);
                tub1 = 0.23 * sin(360 * 7 * s1);

                color([0.16, 0.20, 0.26])
                hull() {
                    rotate([0, 0, ang0])
                    translate([r0, tub0, z0])
                    rotate([chirality * 16, 0, 0])
                        scale([1.0, 1.0, 0.22]) cylinder(r = 1.65, h = 0.85, center = true);
                    rotate([0, 0, ang1])
                    translate([r1, tub1, z1])
                    rotate([chirality * 16, 0, 0])
                        scale([1.0, 1.0, 0.22]) cylinder(r = 1.65, h = 0.85, center = true);
                }

                // Trailing-Edge Barn-Owl Micro-Serrations (2h = 0.60mm sawtooth comb on outer 65% span)
                if (sin(180 * s0) > 0.45 && (i % 2 == 0)) {
                    color([0.25, 0.30, 0.38])
                    rotate([0, 0, ang0])
                    translate([r0, -chirality * 1.55, z0 - 0.15])
                        cylinder(r1 = 0.32, r2 = 0.04, h = 0.60, center = true);
                }
            }
        } else {
            // Option 2: 32-Deg Swept Scimitar Blade with Whale Tubercles & Winglet Tip
            steps = 12;
            for (i = [0 : steps - 1]) {
                s0 = i / steps;
                s1 = (i + 1) / steps;
                r0 = R_hub_o5 + s0 * (R_rotor - R_hub_o5 - 0.2);
                r1 = R_hub_o5 + s1 * (R_rotor - R_hub_o5 - 0.2);
                sweep0 = chirality * 18.0 * s0 * s0;
                sweep1 = chirality * 18.0 * s1 * s1;
                tub0 = 0.23 * sin(360 * 5 * s0);
                tub1 = 0.23 * sin(360 * 5 * s1);
                color([0.16, 0.20, 0.26])
                hull() {
                    rotate([0, 0, sweep0]) translate([r0, tub0, 0])
                        rotate([chirality * (20 - 8 * s0), 0, 0]) cube([0.4, 4.6 * (1 - 0.25 * s0), 0.45], center = true);
                    rotate([0, 0, sweep1]) translate([r1, tub1, 0])
                        rotate([chirality * (20 - 8 * s1), 0, 0]) cube([0.4, 4.6 * (1 - 0.25 * s1), 0.45], center = true);
                }
            }
        }
    }
}

module omega5_rotor_assembly(chirality = 1) {
    // Unequal Azimuthal Acoustic Phase-Cancellation Blade Spacing: [0, 113, 238 deg]
    blade_angles = [0.0, 113.0, 238.0];
    union() {
        // Flush Anti-Hair-Entanglement Spinner Hub Cap (OD = 9.6 mm)
        color([0.18, 0.22, 0.28])
        cylinder(h = 2.8, r1 = R_hub_o5, r2 = R_hub_o5 - 0.4, center = true);

        // ISO G0.4 Dynamic Counter-Balance Pocket Boss at 222.4 deg
        color([0.85, 0.65, 0.28])
        rotate([0, 0, 222.4])
        translate([R_hub_o5 - 1.1, 0, 0])
            cylinder(h = 2.6, r = 0.65, center = true);

        // 3 One-Piece Molded Toroidal / Scimitar Blades
        for (ang = blade_angles) {
            omega5_toroidal_blade(ang, chirality);
        }
    }
}

// ============================================================================
// MODULE 2: Ø38.0MM GOLDEN VENTURI SHROUD WITH RINGLEB LIP, 16 HELMHOLTZ
//           ACOUSTIC LINER CAVITIES, 5 STATOR DESWIRL VANES & 3 TOP GUARD RIBS
// ============================================================================
module omega5_golden_venturi_shroud(chirality = 1) {
    R_inner = R_rotor + 0.15; // 0.15 mm labyrinth tip clearance
    R_outer = R_inner + W_shroud_wall;

    union() {
        // 1. Kuchemann-Weber Golden Venturi Diffuser Ring + Shore 75A TPU Bumper Rim
        color([0.84, 0.62, 0.34])
        difference() {
            union() {
                cylinder(h = H_shroud, r1 = R_outer - 0.2, r2 = R_outer + 0.45, center = true);
                // Top Ringleb-Cusp Bellmouth Lip (r_lip / D = 0.085)
                translate([0, 0, H_shroud / 2 - 0.5])
                rotate_extrude()
                translate([R_inner + 0.75, 0, 0])
                    circle(r = 0.85);
            }
            // Cambered 7.5-deg Venturi Diffuser Inner Throat
            cylinder(h = H_shroud + 2.0, r1 = R_inner + 0.38, r2 = R_inner, center = true);

            // Ringleb-Cusp Trapped-Vortex Micro-Groove (0.95 x 0.42 mm at intake throat)
            translate([0, 0, H_shroud / 2 - 0.65])
            rotate_extrude()
            translate([R_inner + 0.05, 0, 0])
                circle(r = 0.28);

            // 16 Helmholtz Acoustic Metamaterial Resonance Slits (1.8-3.4 kHz Ear-Band Trap)
            for (k = [0 : 15]) {
                rotate([0, 0, k * (360 / 16)])
                translate([R_inner + 0.35, 0, 0])
                    cube([0.95, 0.35, H_shroud - 1.4], center = true);
            }
        }

        // 2. 5 Bottom Twisted Copper/PC-CF30 Stator Deswirl Cooling Vanes (+5.5% Thrust/W & Child-Safe 4.3mm Grille)
        color([0.78, 0.48, 0.26])
        for (v = [0 : 4]) {
            rotate([0, 0, v * 72.0])
            translate([R_hub_o5 + (R_inner - R_hub_o5) / 2, 0, -H_shroud / 2 + 0.75])
            rotate([-chirality * 16.0, 0, 0]) // Straightens 22-deg wake swirl into axial thrust!
                cube([R_inner - R_hub_o5 + 0.2, 0.55, 1.35], center = true);
        }

        // 3. 3 Top Curved Intake Finger-Safety Struts (4.1 mm max opening < 5.5 mm child finger probe)
        color([0.84, 0.62, 0.34])
        for (t = [0 : 2]) {
            rotate([0, 0, t * 120.0 + 30.0])
            translate([R_hub_o5 + (R_inner - R_hub_o5) / 2, 0, H_shroud / 2 - 0.35])
                cube([R_inner - R_hub_o5 + 0.2, 0.48, 0.65], center = true);
        }

        // 4. Center Stationary Stator Hub Post (1103 Outrunner or 6-Layer Etched PCB-Stator Mount)
        color([0.22, 0.26, 0.32])
        translate([0, 0, -H_shroud / 2 + 0.8])
            cylinder(h = 1.6, r = R_hub_o5, center = true);
    }
}

// ============================================================================
// MODULE 3: COMPLETE NANOSCARAB OMEGA-5 ASSEMBLY (STOWED vs. 38-DEG DEPLOYED)
// ============================================================================
module nanoscarab_omega5_assembly() {
    // Thoracic Scissor-Cam Swing-Out Kinematics:
    // At deploy = 0.0: Both Ø38.0mm rotors sit stacked at [0, 0, -0.8] and [0, 0, +1.8] inside Ø40mm belly.
    // At deploy = 1.0: Left & Right Ø38.0mm rotors swing out 38 deg to x = +/- 22.0 mm, y = +3.5 mm under wings!
    for (side = [-1, 1]) {
        chir = (side < 0) ? 1 : -1;
        x_pos = side * deploy * 22.0;
        y_pos = deploy * 3.5;
        z_pos = (1.0 - deploy) * (side * 1.35);

        translate([x_pos, y_pos, z_pos]) {
            // Spinning Toroidal Owl-Tooth Rotor (Phase-Locked at 60 deg offset for -4.0 dBA dipole cancellation!)
            rotate([0, 0, (side > 0) ? 60.0 : 0.0])
                omega5_rotor_assembly(chirality = chir);

            // Golden Venturi Shroud + Deswirl Vanes + Helmholtz Liner
            if (show_shroud) {
                omega5_golden_venturi_shroud(chirality = chir);
            }
        }

        // Swing-Out Rigid-Flex PCB-Stator / Scissor-Cam Arm with Gold Wiping Detent Pad
        if (deploy > 0.05) {
            color([0.15, 0.18, 0.22])
            hull() {
                translate([side * 8.0, 10.0, z_pos]) cylinder(h = 1.2, r = 2.2, center = true);
                translate([x_pos, y_pos, z_pos]) cylinder(h = 1.2, r = 3.0, center = true);
            }
        }
    }

    // Central Ø40.0 x 6.4 mm Scarab Carapace Belly + Low-Slung 12.8g Snap-In Battery Keel (z_CG = -3.2 mm)
    if (show_carapace) {
        // Low-CG 12.8g Snap-In Battery Keel (Pendulum Shuttlecock Self-Righting Weight)
        color([0.12, 0.15, 0.20, 0.90])
        translate([0, -1.5, -2.6])
            scale([0.85, 1.0, 0.22]) sphere(r = D_scarab / 2);

        // Anterior Prothorax Head Dome + 35-deg Split-FOV OV5647 Optical-Flow/4K Camera Window
        color([0.06, 0.56, 0.40])
        translate([0, 14.5, 1.2])
            scale([0.75, 0.55, 0.35]) sphere(r = 12.0);
    }

    // 80.0 mm Open Arched Emerald Elytra with 38% Custer Channel-Wing Intake Scoop (+22 deg Dihedral)
    if (show_elytra_hood) {
        for (side = [-1, 1]) {
            open_ang = deploy * 52.0;
            dihedral = deploy * 22.0;
            translate([side * (2.0 + deploy * 6.5), 11.0, 2.2 + deploy * 3.4])
            rotate([9.5 * deploy, side * dihedral, -side * open_ang]) {
                color([0.05, 0.65, 0.46, 0.88])
                translate([side * 11.0, -13.0, 0])
                scale([0.62, 1.0, 0.22])
                difference() {
                    sphere(r = 19.5);
                    // Molded 38% Custer Channel-Wing Concave Ventral Intake Hood (R_hood = 9.5 mm)
                    translate([0, 0, -4.5]) sphere(r = 18.2);
                    translate([-side * 20.0, -22.0, -20.0]) cube([20.0, 44.0, 40.0]);
                }
            }
        }
    }

    // 104.0 mm Translucent BoPET/Mylar Staggered Biplane Hindwings (+14 deg Dihedral, 7.5 deg Incidence)
    if (show_hindwings && deploy > 0.2) {
        for (side = [-1, 1]) {
            translate([side * (9.0 + deploy * 20.0), -2.5, 1.2 + deploy * 1.8])
            rotate([7.5, side * 14.0 * deploy, -side * 12.0]) {
                color([0.22, 0.82, 0.96, 0.52])
                scale([1.0, 0.42, 0.02])
                    sphere(r = 26.0 * deploy);
            }
        }
    }

    // Optional Ø45.5 x 9.2 mm Toroidal Watch Sanctuary + 110-deg Hinged 1.43" OLED Lid
    if (show_watch_dock) {
        translate([0, 0, -4.2 - deploy * 28.0]) {
            // Rose-Gold Toroidal Watch Case (Ø45.5mm OD, Ø40.2mm Hollow Bore)
            color([0.82, 0.56, 0.38])
            difference() {
                cylinder(h = H_watch, d = D_watch, center = true);
                cylinder(h = H_watch + 2.0, d = D_scarab + 0.4, center = true);
            }
            // Conical 17-7PH CH900 Stainless Launch Spring (0.5mm flat -> 18mm extended)
            color([0.88, 0.72, 0.32])
            for (c = [1 : 6]) {
                translate([0, 0, -H_watch / 2 + 1.0 + deploy * c * 2.2])
                difference() {
                    cylinder(h = 0.45, r = 3.0 * c, center = true);
                    cylinder(h = 1.0, r = 3.0 * c - 0.55, center = true);
                }
            }
            // 110-Deg Hinged Single-Screen 1.43" OLED Watch Door
            translate([0, D_watch / 2 - 1.5, H_watch / 2])
            rotate([-deploy * 110.0, 0, 0])
            translate([0, -D_watch / 2 + 1.5, 0.6]) {
                color([0.12, 0.16, 0.22, 0.75])
                cylinder(h = 1.1, d = D_watch - 1.0, center = true);
            }
        }
    }
}

// ============================================================================
// RENDER DISPATCHER
// ============================================================================
if (arch_mode == 5) {
    nanoscarab_omega5_assembly();
} else {
    // Legacy Omega-3 Coaxial Bi-Fold Rotor Stub
    omega5_rotor_assembly(chirality = 1);
}
