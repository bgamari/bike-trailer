inch = 25.4;

module tongue_adapter() {
     difference() {
          cube([2.8*inch, 1.2*inch, 1.1*inch], center=true);

          rotate([0, 90, 0]) cylinder(r=1.02*inch/2, h=100, center=true);

          translate([0, 0, 40-2]) cube([100, 100, 80], center=true);

          translate([-30, 0, 0])
               #for (i = [0:2])
               translate([i*inch, 0, 0]) cylinder(r=4/2, h=30, center=true);
     }
}

module spacer() {
     difference() {
          cube([4*25, 25, 0.075*inch]);
          translate([25/2, 25/2, 0])
               for (i = [0:25:75])
               translate([i, 0, 0]) cylinder(r=6.5/2, h=30, center=true);

     }
}

//spacer();
tongue_adapter();
