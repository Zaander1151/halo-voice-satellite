// ============================================
// HALO VOICE SATELLITE - FRONT PANEL V8
// ============================================
// NO LED RECESS - keeps everything connected
// Author: Halo Project  
// License: MIT
// Date: 2025-11-27

// ============================================
// PARAMETERS
// ============================================

// Overall dimensions
panel_width = 90;           // mm
panel_height = 65;          // mm
base_thickness = 3;         // mm (structural edge thickness)
mesh_thickness = 1.5;       // mm (thin mesh area)
curve_height = 2;           // mm (subtle dome height in center)

// Mesh pattern
mesh_hole_diameter = 2;     // mm
mesh_hole_spacing = 3;      // mm (center to center)
mesh_rings = 8;             // number of concentric rings
holes_per_ring_base = 12;   // holes in innermost ring
min_radius = 10;            // start radius

// Component cutouts
mic_hole_diameter = 6;      // mm (INMP441 opening)

// Mounting clips (on back)
clip_width = 4;
clip_depth = 2;
clip_height = 3;
clip_offset = 10;           // mm from edges

// ============================================
// MODULES
// ============================================

// Base flat panel with edge frame
module base_panel() {
    difference() {
        // Solid base
        cube([panel_width, panel_height, base_thickness]);
        
        // Hollow out center, leaving structural edges
        translate([base_thickness, base_thickness, mesh_thickness])
            cube([
                panel_width - 2*base_thickness, 
                panel_height - 2*base_thickness, 
                base_thickness
            ]);
    }
}

// Subtle curved top surface
module curved_surface() {
    intersection() {
        // Large radius sphere for subtle curve
        translate([panel_width/2, panel_height/2, -200 + curve_height])
            sphere(r=200, $fn=100);
        
        // Only take the top part
        translate([0, 0, 0])
            cube([panel_width, panel_height, curve_height + 0.1]);
    }
}

// Concentric mesh pattern
module mesh_pattern() {
    center_x = panel_width / 2;
    center_y = panel_height / 2;
    
    for (ring = [0:mesh_rings-1]) {
        ring_radius = min_radius + (ring * mesh_hole_spacing);
        holes_in_ring = holes_per_ring_base + (ring * 4);
        
        for (hole = [0:holes_in_ring-1]) {
            angle = (hole * 360 / holes_in_ring);
            x = center_x + ring_radius * cos(angle);
            y = center_y + ring_radius * sin(angle);
            
            // Only check if within panel bounds
            if (x > base_thickness + 2 && 
                x < panel_width - base_thickness - 2 && 
                y > base_thickness + 2 && 
                y < panel_height - base_thickness - 2) {
                translate([x, y, -1])
                    cylinder(h=base_thickness + curve_height + 2, d=mesh_hole_diameter, $fn=20);
            }
        }
    }
}

// Microphone hole (center, through everything)
module mic_hole() {
    translate([panel_width/2, panel_height/2, -1])
        cylinder(h=base_thickness + curve_height + 2, d=mic_hole_diameter, $fn=30);
}

// Mounting clips on back (4 corners)
module mounting_clips() {
    // Bottom-left
    translate([clip_offset, clip_offset, -clip_height])
        cube([clip_width, clip_depth, clip_height]);
    
    // Bottom-right
    translate([panel_width - clip_offset - clip_width, clip_offset, -clip_height])
        cube([clip_width, clip_depth, clip_height]);
    
    // Top-left
    translate([clip_offset, panel_height - clip_offset - clip_depth, -clip_height])
        cube([clip_width, clip_depth, clip_height]);
    
    // Top-right
    translate([panel_width - clip_offset - clip_width, panel_height - clip_offset - clip_depth, -clip_height])
        cube([clip_width, clip_depth, clip_height]);
}

// ============================================
// ASSEMBLY
// ============================================

difference() {
    union() {
        // Base panel with edges
        base_panel();
        
        // Add subtle curve on top
        curved_surface();
        
        // Add mounting clips on bottom
        mounting_clips();
    }
    
    // Cut mesh pattern holes
    mesh_pattern();
    
    // NO LED RECESS - this was creating the disconnected ring!
    
    // Cut microphone hole
    mic_hole();
}

// ============================================
// PRINT NOTES
// ============================================
// - Dimensions: 90mm × 65mm × ~6mm tall
// - Print face-up (clips on bed)
// - LED ring sits flat on back (no recess needed)
// - Everything connected - no floating parts!
// - Supports: Minimal (only for clips if needed)
// - Layer height: 0.2mm
// - Infill: 20%
// - Material: PLA or PETG
// - Print time: ~2-3 hours
// - Weight: ~20-25g
