// ============================================
// HALO VOICE SATELLITE - FRONT PANEL
// ============================================
// Curved minimalist design with concentric mesh pattern
// Author: Halo Project
// License: MIT
// Date: 2025-11-27

// ============================================
// PARAMETERS (Adjust these to customize)
// ============================================

// Overall dimensions
panel_width = 90;           // mm
panel_height = 65;          // mm
panel_thickness = 3;        // mm (edges)
mesh_thickness = 1.5;       // mm (mesh area)
curve_radius = 40;          // mm (front curve)

// Mesh pattern
mesh_hole_diameter = 2;     // mm
mesh_hole_spacing = 3;      // mm (center to center)
mesh_rings = 8;             // number of concentric rings
holes_per_ring_base = 12;   // holes in innermost ring

// Component cutouts
led_ring_diameter = 37;     // mm (WS2812B ring)
led_ring_depth = 2;         // mm (recess depth)
mic_hole_diameter = 6;      // mm (INMP441 opening)

// Mounting
clip_positions = [
    [10, 10],               // Bottom-left
    [panel_width-10, 10],   // Bottom-right
    [10, panel_height-10],  // Top-left
    [panel_width-10, panel_height-10]  // Top-right
];
clip_width = 4;
clip_depth = 2;
clip_height = 3;

// ============================================
// MODULES
// ============================================

// Main panel body with curve
module curved_panel() {
    difference() {
        // Base panel
        translate([0, 0, -curve_radius + mesh_thickness])
            intersection() {
                // Curved surface
                translate([panel_width/2, panel_height/2, 0])
                    sphere(r=curve_radius, $fn=100);
                
                // Bounding box
                translate([0, 0, 0])
                    cube([panel_width, panel_height, curve_radius]);
            }
        
        // Hollow out back (leaving structural edges)
        translate([panel_thickness, panel_thickness, -curve_radius + mesh_thickness - 5])
            cube([
                panel_width - 2*panel_thickness, 
                panel_height - 2*panel_thickness, 
                10
            ]);
    }
}

// Concentric mesh pattern
module mesh_pattern() {
    center_x = panel_width / 2;
    center_y = panel_height / 2;
    
    for (ring = [0:mesh_rings-1]) {
        ring_radius = (ring + 1) * mesh_hole_spacing;
        holes_in_ring = holes_per_ring_base + (ring * 4);
        
        for (hole = [0:holes_in_ring-1]) {
            angle = (hole * 360 / holes_in_ring);
            x = center_x + ring_radius * cos(angle);
            y = center_y + ring_radius * sin(angle);
            
            // Only place holes within panel bounds
            if (x > 5 && x < panel_width-5 && y > 5 && y < panel_height-5) {
                translate([x, y, -curve_radius])
                    cylinder(h=curve_radius*2, d=mesh_hole_diameter, $fn=20);
            }
        }
    }
}

// LED ring recess
module led_recess() {
    translate([panel_width/2, panel_height/2, -curve_radius + mesh_thickness - led_ring_depth])
        cylinder(h=led_ring_depth + 0.1, d=led_ring_diameter, $fn=60);
}

// Microphone hole (center)
module mic_hole() {
    translate([panel_width/2, panel_height/2, -curve_radius])
        cylinder(h=curve_radius*2, d=mic_hole_diameter, $fn=30);
}

// Mounting clips on back
module mounting_clips() {
    for (pos = clip_positions) {
        translate([pos[0], pos[1], -curve_radius + mesh_thickness])
            cube([clip_width, clip_depth, clip_height]);
    }
}

// ============================================
// ASSEMBLY
// ============================================

difference() {
    union() {
        curved_panel();
        mounting_clips();
    }
    
    // Cut mesh pattern
    mesh_pattern();
    
    // Cut LED recess
    led_recess();
    
    // Cut mic hole
    mic_hole();
}

// ============================================
// PRINT NOTES
// ============================================
// - Print face-down (curved side on bed)
// - Enable supports (tree supports recommended)
// - Layer height: 0.2mm
// - Infill: 100% for structural edges, 20% for backing
// - Material: PLA or PETG
// - Print time: ~3-4 hours
// - Weight: ~25g
