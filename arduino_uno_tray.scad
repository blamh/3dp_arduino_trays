$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

hole_list = [[24.15,-17.15], [-24.15,-15.88], [-8.9,34.93], [19.05,34.93]];
z_offset = 1;

difference() {
    union() {
        translate([0,3,(10/2)-1.5]) difference() {
            translate([0,0,-(3/2)+(z_offset/2)]) cube([54+3,70+3,10-3+z_offset], center=true);
            translate([0,0,2]) cube([54,70,12], center=true);
            translate([-11.8,70/-2,(10/2)+z_offset]) cube([13,10,10], center=true);
            translate([18.5,70/-2,(10/2)+z_offset]) cube([9.5,10,10], center=true);
        }
        for (i=hole_list) translate([i[0],i[1],1+(z_offset/2)]) cylinder(d1=8.5, d2=5.5, h=3+z_offset, center=true);
    }
    for (i=hole_list) {
        translate([i[0],i[1],1]) cylinder(d=3.5, h=8, center=true);
        #translate([i[0],i[1],-((10/2)-1.5)+3.5]) cylinder(d=6, h=4, center=true);
    }
}
% import("arduino_uno.stl", convexity=3);
