inch = 25.4;

height = 20;
length = 80;

spine_width = 5.1;
spine_height = 1.8;
channel_offset = 2;

module mount(stand_angle) {
     difference() {
          scale([1.0, 1, 0.8]) rotate([90,0,0]) cylinder(h=height, r=length/2, center=true);

          // cut off bottom half
          rotate([180,0,0]) cylinder(r=2*length, h=length);

          // Channel
          rotate([0,0,stand_angle])
               translate([0,0,10 + channel_offset])
               rotate([90,0,0])
               linear_extrude(100, center=true) profile20();

          // mounting bolts
          for (x = [-30, 30]) translate([x, 0, 0]) {
               translate([0,0,4]) cylinder(r=11.5/2, h=30);
               cylinder(r=6.1/2, h=100, center=true);
          }

          // retention bolt
          translate([0,0,20]) cylinder(r=5.1/5, h=50);
          translate([0,0,channel_offset+20+3]) cylinder(r=11.5/5, h=50);

          // nut catch (M5)
          #translate([0, 0, channel_offset+20+4]) cube([8.05, 2*height, 4.8], center=true);

          // hex holder
          for (i = [-1,1])
               translate([25*i, 0, 18]) rotate([90,0,0]) cylinder(r=4.65/2, h=30, center=true);
     }
}

module profile20() {
     profile(channel_width = 5.1,
             channel_height = 1.8,
             size = 21);
}

module profile(size, channel_width, channel_height) {
     difference() {
          square([size, size], center=true);
          for (i = [0:90:360]) rotate(i) {
              translate([size/2, 0])
                   square([2*channel_height, channel_width], center=true);
          }
     }
}

//mount(stand_angle=30);

rotate([90,0,0]) mount(stand_angle=30, $fn=50);
translate([0, -35, 0])rotate([90,0,0]) mount(stand_angle=-30, $fn=50);
