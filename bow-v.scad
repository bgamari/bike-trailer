inch = 25.4;
module cross_section() {
     h=2.4*inch;
     difference() {
          union() {
               circle(r=1.5*inch/2);
               translate([0, h]) rotate(45) square([3, 3]*inch, center=true);
               translate([0, 1]*inch) square([1.5, 2]*inch, center=true);
          }
          circle(r=1*inch/2);
          translate([0, 0.5*inch+h]) rotate(45) square([3,3]*inch, center=true);
     }
}

module vee() {
     difference() {
          linear_extrude(3*inch, center=true) cross_section();
          for (z = [-1, 0, 1]*inch) {
               translate([0,0,z]) rotate([0,90,0]) cylinder(r=4/2, h=3*inch, center=true);
          }
     }
}

vee($fn=32);
rotate([0,90,0]) cylinder(r=4/2, h=45, center=true);
