base_dia = 22;
base_h = 2;

eye_od = 18;
eye_id = 13;
eye_depth = 3;
eye_offset = 7;

module hook() {
     difference() {
          minkowski() {
               union() {
                    scale([1,1.1,1])
                         cylinder(r=base_dia/2, h=base_h, $fn=$fn*4);

                    // eye
                    scale([1,1,1.5])
                         translate([0, eye_offset, base_h]) rotate([90,0,0]) linear_extrude(eye_depth) difference() {
                         // eye body
                         circle(r=eye_od/2);

                         // eye hole
                         circle(r=eye_id/2);
                         translate([0, -eye_od]) square([eye_od, eye_od*2], center=true);
                    }
               }
               sphere(r=1);
          }

          // screw hole
          translate([0,-3,0])
          cylinder(r=6.1/2, h=10, center=true);

          // flatten bottom
          rotate([180,0,0]) cylinder(r=base_dia, h=base_h);
     }
}


hook($fn=16);
//hook();

//translate([0,-3,5])cylinder(r=11/2, h=1);
