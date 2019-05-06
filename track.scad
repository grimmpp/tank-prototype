
translate([5.6,0,0]) cube([4,35,2.4]);

difference(){
hull() {
translate([5.6,0,-0.2]) cube([4,35,1.6]);
translate([3.5,0,-0.2]) cube([9.6,35,0.2]);
}
translate([5.6+4,12,-1]) cube([4,11,5]);
}

hull(){
translate([5.6,12.5,-0.2]) cube([4,10,1.6]);
translate([0,12.5,-0.2]) cube([3.5,10,0.2]);
}

color("lightgreen") rotate([0,180,180]) import("track_1_5.stl");


//translate([0,0,-5]) rotate([0,90,90]) cylinder($fn=50, d=3, h=35);
//translate([13.1,0,-5]) rotate([0,90,90]) cylinder($fn=50, d=2.4, h=35);