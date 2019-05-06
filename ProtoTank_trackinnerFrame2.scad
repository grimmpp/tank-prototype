d1 = 32.72;
d2 = 15;
points = [[d1,d2,0], [d1,-d2,0], [-d1,-d2,0], [-d1,d2,0]];

e1 = 50;
e2 = 60;
points2 = [[e1,-11.5,31],[-e1,-11.5,31],[e2,-11.5,31],[-e2,-11.5,31]];

points3 = [[45.2,-8.8,0], [45.2,8.8,0], [-45.2,-8.8,0], [-45.2,8.8,0]];

//import("ProtoTank_trackinnerFrame.stl");

difference() {
union() {
    
    for(i = points) {
        translate(i) cylinder($fn=32, d=6, h=4);
    }
    for(i = points2) {
        translate(i) rotate([90,0,0]) cylinder($fn=32, d=6, h=8.5);
    }
    translate([39.5,-12,4]) cube([13,24,2]);
    translate([-39.5-13,-12,4]) cube([13,24,2]);
    
    import("ProtoTank_trackinnerFrame.stl");
}//union

color("red") {
    for(i = points) {
        translate(i) cylinder($fn=32, d=3, h=15);
        translate(i+[0,0,4-2.6]) cylinder($fn=6, d=6.4, h=3);
    }
    for(i = points2) {
        translate(i) rotate([90,0,0]) cylinder($fn=32, d=3, h=8.5);
        translate(i) rotate([90,30,0]) cylinder($fn=6, d=6.4, h=3);
    }
    //motor holes
    for(i = points3) {
        translate(i) cylinder($fn=100, d=3, h=28);
        translate(i) cylinder($fn=6, d=6.4, h=3);
    }
    } //red
}


//color("lightgreen") translate([12.5,-11.2,-4.8]) import("DC_Motor_20mm.STL");

/*
color("lightblue") translate([65.45,0,-5]) cylinder($fn=100, d=2, h=6);
color("lightblue") translate([-65.45,0,0]) cylinder($fn=100, d=21, h=6);
*/