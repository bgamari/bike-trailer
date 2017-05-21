inch = 25.4;

h_offset = 9;
width = 25;
well_depth = 0.65 * width;
well_depth2 = -0.50 * width;
length = 86;

axle_diam = 3/8 * inch + 0.2;

module mount() {
difference() {
     rotate([90,0,0])
     linear_extrude(width, center=true)
     difference() {
          union() {
               thickness = 12;
               translate([0, h_offset]) circle(r=(axle_diam + 20)/2);
               polygon([[-length/2, -thickness/2],
                        [-length/2, +thickness/2],
                        [0, 20],
                        [+length/2, +thickness/2],
                        [+length/2, -thickness/2],
                        [-length/2, -thickness/2]]);
          }
          translate([0, h_offset]) circle(r=axle_diam/2);
     }

     translate([0, well_depth+0.01, h_offset]) rotate([90,0,0]) cylinder(r=22.5 / 2, h=width, center=true);
     translate([0, well_depth2+0.01, h_offset]) rotate([90,0,0]) cylinder(r=22.5 / 2, h=width, center=true);

     // bolt holes
     for (i=[-1,1]) translate([i*30, 0, 0]) {
           cylinder(r=11/2, h=30);
           cylinder(r=6.6/2, h=70, center=true);
     }
}
}

mount();
translate([0, 30, 0]) mirror([0,-1,0]) mount();
