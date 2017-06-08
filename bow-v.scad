inch = 25.4;
vee_angle = 45;
vee_thickness = 0.5*inch;
vee_length = 3*inch;
vee_offset = 0.35*inch;

module cross_section() {
     h=2.4*inch;
     difference() {
          union() {
               circle(r=1.5*inch/2);
               x = 2.2 * vee_offset;
               translate([0, x/2]) square([1.5*inch, x], center=true);

               // vee
               translate([0, vee_offset])
                    for (i = [+1,-1]) {
                         rotate(i*vee_angle)
                              rotate(90) {
                              translate([0, -vee_thickness/2])
                                   square([vee_length, vee_thickness]);
                              translate([vee_length, 0]) circle(r=vee_thickness/2);
                         }
                    }
          }
          circle(r=1*inch/2 + 0.4);
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

//rotate([0,90,0]) cylinder(r=4/2, h=45, center=true);
