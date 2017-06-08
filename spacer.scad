// M5 in M6 hole
big_hole_diam = 6.38;
small_hole_diam = 5.5;

// M6 in M6 hole
big_hole_diam = 6.38;
small_hole_diam = 6.38;

//thickness = 1.5;
thickness = 5;
length = 24;
width = 20;

spine_width = 5.2;
spine_height = 1.5;

module spacer() {
     difference() {
          union() {
               cube([length, width, thickness], center=true);
               if (big_hole_diam > small_hole_diam)
                    cylinder(r=big_hole_diam/2, h=thickness+2.5);

               // bottom "spine"
               if (spine_height > 0) {
                    translate([0,0,-spine_height/2 - thickness/2]) cube([length, spine_width, spine_height], center=true);
               }
          }
          cylinder(r=small_hole_diam/2, h=10*thickness, center=true);
     }
}

rotate([180,0,0]) spacer($fn=50);
