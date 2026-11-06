// ============================================================================
// SCARAB OMEGA-3 (CHAMELEON-HALO): KINEMATIC CONCEPT COUPON CAD (REV 2.0)
// Status: ANALYTICAL & KINEMATIC CONCEPT MODEL (Pending Gate 1 Bench Coupon)
// Reconciled with Codex Engineering Review:
//   1. Fixes root-hinge transform order: pivots AT [R_hub, 0, 0], not [0, 0, 0].
//   2. Resolves Euclidean triangle-inequality bound (a 1-hinge 25.8mm blade
//      cannot fold below R = 25.8 - 6.2 = 19.6mm / D = 39.2mm) by implementing
//      a 2-Hinge Bi-Fold Articulated Blade (Proximal L1 = 13.0mm @ -118 deg +
//      Distal L2 = 12.8mm @ -102 deg relative knee fold):
//        • Deployed (deploy = 1.0): R_min = 6.20 mm -> R_max = 32.00 mm (D = 64.00 mm)
//        • Stowed   (deploy = 0.0): R_min = 6.20 mm -> R_max = 12.38 mm (D = 24.76 mm <= 25.0 mm)
//   3. Implements Paulos-Yim Antisymmetric Dipole Hinge Coupling:
//        delta3_b = atan(tan(38 deg) * cos(phi_b))
//      so a common 1/rev motor torque pulse produces opposite pitch responses
//      on opposing blades (cyclic roll/pitch) instead of canceling by symmetry.
//   4. Includes mated internal/external 3-start helical spline sleeve (0.20mm
//      radial clearance) and 25-um NiTi flexure spine slots.
// ============================================================================

$fn = 72;

/* [Deployment State (0.0 = Stowed Ø24.8x2.6mm Wafer, 1.0 = Deployed Ø64.0x16.0mm)] */
deploy        = 1.0;   // [0.0:0.05:1.0]
fold_mode     = 2;     // [2:2-Hinge Bi-Fold (Stows to Ø24.8mm), 1:1-Hinge Single-Arc (Stows to Ø39.2mm)]
wing_mode     = 1;     // [0:Stowed Carapace, 1:Hover Vertical Coanda Vanes (0 Servos), 2:Cruise Lifting Elytra + 120mm Hindwings]
show_upper    = true;
show_lower    = true;
show_shaft    = true;
show_elytra   = true;

/* [Primary Rotor & Hub Geometry] */
D_stowed_target = 25.0; // Target stowed outer diameter (mm)
D_flight        = 64.0; // Deployed tip-to-tip diameter (mm)
H_stowed        = 2.60; // Stowed rotor stack axial height (mm)
H_flight        = 16.0; // Deployed rotor stack axial height (mm)
N_blades        = 6;    // Blades per rotor (with m=1 dipole delta3 skew)
R_hub           = 6.20; // Hub root hinge radius (mm; D_hub = 12.40 mm)
D_shaft_bore    = 8.80; // Stationary hollow optical/stator shaft OD (mm)
spline_clear    = 0.20; // Radial clearance between shaft spline and hub sleeve (mm)

/* [2-Hinge Bi-Fold & Dragonfly Pleat Parameters] */
L1_prox         = 13.0; // Proximal blade link chord (mm: 6.2 -> 19.2 mm)
L2_dist         = 12.8; // Distal blade link chord (mm: 19.2 -> 32.0 mm)
th1_stowed      = -118.0; // Root fold angle when stowed (deg)
th2_rel_stowed  = -102.0; // Knee relative fold angle when stowed (deg)
th_1hinge_stowed= -172.0; // 1-hinge mode fold angle (stows to Ø39.2mm minimum)
pitch_flight    = 14.0; // Collective pitch angle at deploy = 1.0 (deg)
delta3_max      = 38.0; // Max Paulos-Yim pitch-lag skew angle (deg)
t_wall          = 0.16; // Blade corrugated web thickness (mm)
h_pleat         = 0.42; // Trapezoidal corrugation depth (mm)

// Derived axial zipper translation & 3-start helical rotation
z_zipper = deploy * (H_flight - H_stowed - 2.2);
phi_zip  = deploy * 90.0; // 90-deg helical rotation over 11.2mm stroke (Lead = 44.8mm)

// ----------------------------------------------------------------------------
// Helper: Corrugated Curved Segment of chord L and arc sagitta h_arc
// ----------------------------------------------------------------------------
module corrugated_segment(L_seg, h_arc, w_chord, chirality = 1, is_distal = false) {
    steps = 8;
    for (i = [0 : steps - 1]) {
        s0 = i / steps;
        s1 = (i + 1) / steps;
        x0 = s0 * L_seg;
        x1 = s1 * L_seg;
        y0 = chirality * h_arc * sin(180 * s0);
        y1 = chirality * h_arc * sin(180 * s1);
        w0 = w_chord * (is_distal ? (1.0 - 0.35 * s0) : 1.0);
        w1 = w_chord * (is_distal ? (1.0 - 0.35 * s1) : 1.0);

        // 3 spanwise dragonfly pleats across chord width
        for (p = [-1 : 1]) {
            z_p = (p == 0) ? (h_pleat / 2) : (-h_pleat / 2);
            hull() {
                translate([x0, y0 + p * (w0 * 0.32), z_p * deploy])
                    cube([0.25, w0 * 0.36, t_wall], center = true);
                translate([x1, y1 + p * (w1 * 0.32), z_p * deploy])
                    cube([0.25, w1 * 0.36, t_wall], center = true);
            }
        }
    }
}

// ----------------------------------------------------------------------------
// 1. Single Blade with Root Pivot AT [R_hub, 0, 0] + Paulos-Yim Dipole Skew
// ----------------------------------------------------------------------------
module bifold_dipole_blade(blade_idx, chirality = 1) {
    phi_b = blade_idx * (360.0 / N_blades);
    // Paulos-Yim antisymmetric dipole law: opposite blades have opposite delta3 skew!
    delta3_b = atan(tan(delta3_max) * cos(phi_b));

    cur_pitch = deploy * pitch_flight * chirality;
    cur_th1   = (1.0 - deploy) * ((fold_mode == 2) ? th1_stowed : th_1hinge_stowed) * chirality;
    cur_th2   = (1.0 - deploy) * ((fold_mode == 2) ? th2_rel_stowed : 0.0) * chirality;

    rotate([0, 0, phi_b])
    // CRITICAL FIX: Translate to hub perimeter R_hub FIRST, then rotate about root hinge!
    translate([R_hub, 0, 0])
    rotate([0, 0, cur_th1])
    rotate([cur_pitch, 0, 0]) {
        // Root Cartwheel Flexure + 25-um NiTi Spine Slot (skewed by dipole delta3_b)
        color([0.95, 0.75, 0.25])
        rotate([0, delta3_b, 0])
        translate([0.55, 0, 0])
            cube([1.10, 0.22, 0.75], center = true);

        // Proximal Blade Segment (L1 = 13.0 mm)
        color(chirality > 0 ? [0.15, 0.85, 0.72] : [0.38, 0.58, 0.98])
        corrugated_segment(L1_prox, 1.8, 1.75, chirality, false);

        // Mid-Span Compliant Knee Hinge at x = L1_prox (13.0 mm from root hinge)
        translate([L1_prox, 0, 0])
        rotate([0, 0, cur_th2]) {
            // Knee NiTi ribbon flexure + centrifugal hard-stop tab at 0 deg
            color([0.95, 0.75, 0.25])
            cube([0.70, 0.24, 0.65], center = true);

            // Distal Blade Segment (L2 = 12.8 mm -> reaches R = 32.00 mm at deploy = 1.0)
            color(chirality > 0 ? [0.10, 0.75, 0.62] : [0.28, 0.48, 0.88])
            corrugated_segment(L2_dist, 1.8, 1.65, chirality, true);
        }
    }
}

// ----------------------------------------------------------------------------
// 2. Complete Rotor Hub with Mated Female 3-Start Helical Spline Nut
// ----------------------------------------------------------------------------
module zipper_iris_rotor(chirality = 1, is_upper = true) {
    difference() {
        union() {
            // Annular hub ring (OD = 2*R_hub = 12.40 mm)
            color([0.18, 0.22, 0.28])
            cylinder(h = 1.15, r = R_hub, center = true);

            // Blades with antisymmetric dipole hinge skew
            for (b = [0 : N_blades - 1]) {
                bifold_dipole_blade(b, chirality);
            }
        }
        // Central bore with mated 3-start helical spline grooves (with spline_clear)
        if (is_upper) {
            translate([0, 0, -1.5])
            linear_extrude(height = 3.0, twist = -90.0 * (3.0 / 11.2), slices = 24)
            offset(r = spline_clear)
            shaft_spline_profile();
        } else {
            cylinder(h = 3.0, d = D_shaft_bore + 2 * spline_clear, center = true);
        }
    }
}

// 2D cross-section of the 3-start helical spline shaft
module shaft_spline_profile() {
    union() {
        circle(d = D_shaft_bore);
        for (s = [0 : 2]) {
            rotate([0, 0, s * 120])
            translate([D_shaft_bore / 2 - 0.1, -0.35])
                square([0.65, 0.70]);
        }
    }
}

// ----------------------------------------------------------------------------
// 3. Coaxial Assembly (Stowed: Ø24.76 x 2.60 mm | Deployed: Ø64.00 x 16.00 mm)
// ----------------------------------------------------------------------------
union() {
    // Lower Rotor (z = 0.65 mm)
    if (show_lower) {
        translate([0, 0, 0.65])
            zipper_iris_rotor(chirality = -1, is_upper = false);
    }

    // Upper Rotor (z = 1.95 mm stowed -> z = 13.15 mm deployed, clocked 30 deg)
    if (show_upper) {
        translate([0, 0, 1.95 + z_zipper])
        rotate([0, 0, 30.0 + phi_zip])
            zipper_iris_rotor(chirality = 1, is_upper = true);
    }

    // Central Hollow Optical/Stator Shaft with Male 3-Start Helical Spline
    if (show_shaft) {
        color([0.28, 0.32, 0.38])
        difference() {
            linear_extrude(height = H_stowed + z_zipper, twist = -phi_zip, slices = 48)
                shaft_spline_profile();
            // Internal Ø7.2mm clear bore for stationary camera / OIS pod
            translate([0, 0, -0.5])
                cylinder(h = H_flight + 2.0, d = D_shaft_bore - 1.6);
        }
    }

    // 4. Functional Structural-Battery + Solar Split Elytra (+1.60g curved Si-C cell + 0.40g skin)
    //    Driven passively by the 3-start helical spline via a 4-bar scissor-cam linkage (0 servos):
    //    • wing_mode == 0 (or deploy == 0): Stowed Ø32.5 mm IP52 beetle carapace over folded rotor
    //    • wing_mode == 1: Vertical Edge-On Coanda Slipstream Vanes at R = 26.5 mm (0% wake blockage)
    //    • wing_mode == 2: Horizontal Cambered Lifting Elytra + Unfolded 120 mm Origami Hindwings
    if (show_elytra) {
        for (side = [-1, 1]) {
            eff_dep = (wing_mode == 0) ? 0.0 : deploy;
            piv_x   = side * (8.0 + eff_dep * 18.5);
            piv_z   = (wing_mode == 1) ? (3.0 - eff_dep * 7.2) : (3.0 + eff_dep * 0.5);
            roll_deg = (wing_mode == 1) ? (side * eff_dep * 88.0) : (side * eff_dep * 9.0);

            // Passive 4-Bar Scissor-Cam Struts
            color([0.58, 0.64, 0.72])
            hull() {
                translate([side * 10.5, -3.5, 0.5]) sphere(r = 0.35);
                translate([piv_x,       -3.5, piv_z]) sphere(r = 0.35);
            }

            translate([piv_x, 0, piv_z])
            rotate([0, roll_deg, 0]) {
                // Curved Structural-Battery Elytra Shell (26 mm chord x 11 mm width x 0.65 mm thick)
                color([0.08, 0.72, 0.52, 0.85])
                scale([0.45, 1.0, 0.14])
                difference() {
                    sphere(r = 13.0);
                    translate([0, 0, -4.0]) sphere(r = 12.2);
                    translate([-side * 14.0, -15.0, -15.0]) cube([14.0, 30.0, 30.0]);
                }

                // Unfolding 120 mm Origami Hindwing Membrane (Active in Forward Cruise wing_mode == 2)
                if (wing_mode == 2 && eff_dep > 0.25) {
                    color([0.22, 0.74, 0.97, 0.55])
                    translate([side * 16.0 * eff_dep, 0, -0.2])
                        cube([34.0 * eff_dep, 22.0, 0.12], center = true);
                }
            }
        }
    }
}
