// ============================================================================
// SCARAB OMEGA-3 (CHAMELEON-HALO): MONOLITHIC 3D-PRINTED INTERLOCKING ROTOR
// Architecture: Pangolin-Iris Cartwheel Flexure + 3-Start Helical Zipper-Spline
//               + Kesel (2000) 120-um Dragonfly Micro-Corrugated Airfoils
// Stowed Envelope : D = 25.0 mm x H = 2.40 mm (43.7x volumetric compression)
// Flight Envelope : D = 64.0 mm x H = 16.0 mm (32.17 cm^2 swept area)
// ============================================================================

$fn = 96;

/* [Deployment State (0.0 = Stowed 25x2.4mm Wafer, 1.0 = Deployed 64x16mm Flight)] */
deploy        = 1.0;   // [0.0:0.05:1.0]
show_upper    = true;
show_lower    = true;
show_shaft    = true;
print_bridges = false; // Enable 0.15mm breakaway bridges for SLA printing

/* [Primary Rotor Geometry] */
D_stowed      = 25.0;  // Stowed outer diameter (mm)
D_flight      = 64.0;  // Deployed tip-to-tip diameter (mm)
H_stowed      = 2.40;  // Stowed total axial height (mm)
H_flight      = 16.0;  // Deployed total axial height (mm)
N_blades      = 6;     // Blades per rotor (12 total coaxial)
D_hub_outer   = 12.4;  // Hub outer diameter (mm)
D_shaft_bore  = 6.4;   // Hollow central camera-gimbal bore (mm)

/* [Dragonfly Corrugation & Flexure Parameters] */
t_wall        = 0.14;  // Airfoil wall thickness (0.12-0.15 mm SLA/SLS)
h_pleat       = 0.45;  // Corrugation peak-to-valley envelope (mm)
n_pleats      = 4;     // Spanwise trapezoidal pleats per blade
t_flexure     = 0.10;  // Cartwheel flexure leaf thickness (mm)
l_flexure     = 1.40;  // Flexure active length (mm)
pitch_flight  = 14.5;  // Collective pitch at full deployment (deg)
fold_angle    = 72.0;  // Inward lag sweep angle when stowed (deg)

// Derived kinematics
R_hub    = D_hub_outer / 2;
R_tip    = D_flight / 2;
L_blade  = R_tip - R_hub;
z_zipper = deploy * (H_flight - H_stowed - 2.0);
phi_zip  = deploy * 120; // 3-start helical rotation during axial unzip

// ----------------------------------------------------------------------------
// 1. Dragonfly Micro-Corrugated Blade Profile (Kesel 2000 Trapezoidal Pleats)
// ----------------------------------------------------------------------------
module dragonfly_blade(chirality = 1) {
    cur_fold  = (1.0 - deploy) * fold_angle * chirality;
    cur_pitch = deploy * pitch_flight * chirality;

    rotate([0, 0, cur_fold])
    translate([R_hub, 0, 0])
    rotate([cur_pitch, 0, 0]) {
        // Crossed-leaf cartwheel flexure root (monolithic compliant hinge)
        color([0.95, 0.75, 0.25])
        translate([-l_flexure/2, 0, 0]) {
            rotate([0, 0,  38 * chirality]) cube([l_flexure, t_flexure, 0.95], center=true);
            rotate([0, 0, -38 * chirality]) cube([l_flexure, t_flexure, 0.95], center=true);
        }

        // Curved sickle blade with 4 spanwise trapezoidal corrugations
        color(chirality > 0 ? [0.15, 0.85, 0.72] : [0.38, 0.58, 0.98])
        for (i = [0 : n_pleats - 1]) {
            y_off = (i - (n_pleats - 1)/2) * 1.35;
            z_off = ((i % 2 == 0) ? 1 : -1) * (h_pleat / 2);
            hull() {
                translate([0, y_off * 0.65, z_off * 0.6])
                    cube([0.4, 1.45, t_wall], center=true);
                translate([L_blade * 0.55, y_off * 1.15 + chirality * 2.2, z_off])
                    cube([0.4, 1.65, t_wall], center=true);
                translate([L_blade, y_off * 0.45 + chirality * 4.8, 0])
                    cube([0.2, 0.75, t_wall], center=true);
            }
        }

        // Leading-edge shingle rabbet step (forms 100% light-tight camera shutter when stowed)
        color([0.12, 0.16, 0.22])
        hull() {
            translate([0.5, chirality * 2.4, 0.18]) cube([0.5, 0.55, 0.22], center=true);
            translate([L_blade * 0.92, chirality * 5.2, 0.10]) cube([0.3, 0.35, 0.18], center=true);
        }
    }
}

// ----------------------------------------------------------------------------
// 2. Single 6-Blade Pangolin-Iris Rotor Assembly
// ----------------------------------------------------------------------------
module pangolin_iris_rotor(chirality = 1) {
    difference() {
        union() {
            // Central hub ring
            color([0.18, 0.22, 0.28])
            cylinder(h = 1.15, d = D_hub_outer, center = true);

            // 6 interlocking dragonfly blades
            for (b = [0 : N_blades - 1]) {
                rotate([0, 0, b * (360 / N_blades)])
                    dragonfly_blade(chirality);
            }
        }
        // Central bore for hollow camera-gimbal shaft + 3-start helical spline grooves
        cylinder(h = 4.0, d = D_shaft_bore + 0.3, center = true);
        for (s = [0 : 2]) {
            rotate([0, 0, s * 120])
            translate([D_shaft_bore/2 + 0.15, 0, 0])
                cube([0.75, 0.75, 4.0], center = true);
        }
    }
}

// ----------------------------------------------------------------------------
// 3. Complete Coaxial Zipper-Nested Assembly (Upper + Lower + Helical Shaft)
// ----------------------------------------------------------------------------
union() {
    // Lower Counter-Rotating Rotor (z = 0.60 mm)
    if (show_lower) {
        translate([0, 0, 0.60])
            pangolin_iris_rotor(chirality = -1);
    }

    // Upper Rotor (Unzips from z = 1.80 mm stowed -> z = 13.70 mm deployed)
    if (show_upper) {
        translate([0, 0, 1.80 + z_zipper])
        rotate([0, 0, 30 + phi_zip]) // 30-deg phase offset nests blades into lower valleys
            pangolin_iris_rotor(chirality = 1);
    }

    // Central Hollow Camera-Gimbal Shaft with 3-Start 56.5-deg Helical Zipper Spline
    if (show_shaft) {
        color([0.28, 0.32, 0.38])
        difference() {
            union() {
                cylinder(h = 2.40 + z_zipper, d = D_shaft_bore);
                linear_extrude(height = 2.40 + z_zipper, twist = -120 * (0.2 + 0.8*deploy), slices = 60)
                for (s = [0 : 2]) {
                    rotate([0, 0, s * 120])
                    translate([D_shaft_bore/2, -0.3, 0])
                        square([0.55, 0.60]);
                }
            }
            translate([0, 0, -0.5])
                cylinder(h = H_flight + 2.0, d = D_shaft_bore - 1.2);
        }
    }
}
