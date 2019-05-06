

d1 = 32.72;
d2 = 15;
points = [[d1,d2,0], [d1,-d2,0], [-d1,-d2,0], [-d1,d2,0]];

difference() {
union() {
    import("ProtoTank_TrackOuterFrame.stl");
    for(i = points) {
        translate(i) cylinder($fn=32, d=6, h=15);
    }
}//union

for(i = points) {
    color("red") {
        translate(i) cylinder($fn=32, d=3, h=15);
        translate(i) cylinder($fn=32, d=5.6, h=3.2);
    }
}
}
//translate([0,0,15]) import("ProtoTank_trackinnerFrame.stl");

