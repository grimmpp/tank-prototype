
//battery box dimensions
bb_length=75;
bb_width=40;
bb_height=20;

platform_l = 165;
platform_w = 36;
/* both motor platforms
    motorPlatforms();
//*/

/* battery box - sits between both platforms
    translate([-platform_l/2 - bb_length/2, platform_w , -bb_height])  batteryBox();
//*/

arduino_l = 75;
arduino_w = 55;
arduino_h = 25;
/*
translate([-platform_l/2- arduino_l/2, (platform_w*2+40)/2-arduino_w/2 ,4]) arduino();
//*/

unoHoles = [
    [  2.54, 15.24, 0 ],
    [  17.78, 66.04, 0 ],
    [  45.72, 66.04, 0 ],
    [  50.8, 13.97, 0 ]
];
        
// distance in the center btw. the two platforms
width_c = 50;
width = width_c+2*22;
length = 130;
h = 4;

translate([-length/2 -platform_l/2, platform_w-22,0]) {
difference() {
    union() {
    
    //side bars
    sw = 22; //12
    cube([length,sw,h]);
    translate([0,width-sw,0]) cube([length,sw,h]);
    
    cube([26,width,h]);
    translate([length-26,0,0]) cube([26,width,h]);
    
    //battery mount corss bar
    // cross bars
    translate([length/2-10/2,0,0]) cube([10,width,h]);
    
    
    // uno support
    //translate([78,12,0]) cube([12,60,4]);
    //translate([0,27,0]) cube([60,12,4]);
    offSetX_arduino = (width - abs(unoHoles[0][0] - unoHoles[3][0]))/2 -2.5;
    offSetY_arduino = length - (length - arduino_l)/2 -4; //-32
    translate([offSetY_arduino,offSetX_arduino,-4]) rotate([0,0,90]) {
        hull(){
            translate(unoHoles[0]+[0,0,4]) cylinder($fn=42, d=12, h=h);
            translate(unoHoles[0]+[-offSetX_arduino,-5,4]) cube([4,10,h]);
        }
        hull(){
            translate(unoHoles[0]+[0,0,4]) cylinder($fn=42, d=12, h=h);
            translate(unoHoles[3]+[0,0,4]) cylinder($fn=42, d=12, h=h);
        }
        hull(){
            translate(unoHoles[3]+[0,0,4]) cylinder($fn=42, d=12, h=h);
            translate(unoHoles[3]+[offSetX_arduino-10,-6,4]) cube([12,12,h]);
        }
        hull() {
            translate(unoHoles[2]+[0,0,4]) cylinder($fn=42, d=12, h=h);
            translate(unoHoles[2]+[-6,length-12-offSetY_arduino,4]) cube([12,12,h]);
        }
        hull() {
            translate(unoHoles[1]+[0,0,4]) cylinder($fn=42, d=12, h=h);
            translate(unoHoles[1]+[-6,length-12-offSetY_arduino,4]) cube([12,12,h]);
        }
    }
    
    // center bottom cant
    hull(){
        translate([0,22,0]) cube([10,width_c,h]);
        translate([26-4,22,-8]) cube([4,width_c,8+h]);
    }
    hull(){
        translate([length-10,22,0]) cube([10,width_c,h]);
        translate([length-26,22,-8]) cube([4,width_c,8+h]);
    }
}//union
    
    //holes
    color("red") {
        translate([5,17,-12]) {
            hole();
            translate([10,0,0]) hole();
            translate([length-20,0,0]) hole();
            translate([length-10,0,0]) hole();
        }
        translate([5,27+width_c,-12]) {
            hole();
            translate([10,0,0]) hole();
            translate([length-20,0,0]) hole();
            translate([length-10,0,0]) hole();
        }
        
        //battery box holes
        translate([length/2,width/2 + 10,0]){
            translate([0,0,-10]) cylinder($fn=32, d=3.2, h=20);
            translate([0,0,h-3]) rotate([0,0,30]) cylinder($fn=6, h=3,r=3.3);
        }
        translate([length/2,width/2 - 10,0]){
            translate([0,0,-10]) cylinder($fn=32, d=3.2, h=20);
            translate([0,0,h-3]) rotate([0,0,30]) cylinder($fn=6, h=3,r=3.3);
        }
        
        test = (width-2*22-8 - (unoHoles[0][1] - unoHoles[3][1]))/2; //15
        //uno
        translate([length-32,test,-4]) rotate([0,0,90]) {
            for(i = unoHoles) {
                translate(i) {
                    cylinder($fn=32, d=3.2, h=12);
                    translate([0,0,4]) cylinder($fn=6, h=3,r=3.3);
                }
            }
        }
        //cable
        hull() {
            translate([length/2-2,8,-10]) cylinder($fn=32, d=5, h=20);
            translate([length/2+2,8,-10]) cylinder($fn=32, d=5, h=20);
        }
        hull() {
            translate([length/2-2,width-8,-10]) cylinder($fn=32, d=5, h=20);
            translate([length/2+2,width-8,-10]) cylinder($fn=32, d=5, h=20);
        }
    }
    
    hull() {
        translate([-2,0,0]) cube([2,width,1]);
        translate([0,0,h]) cube([2,width,1]);
    }
    hull() {
        translate([length,0,0]) cube([2,width,1]);
        translate([length-2,0,h]) cube([2,width,1]);
    }
    
}//difference
}//translate

module hole(){
    cylinder($fn=32, d=3.2, h=20);
    translate([0,0,13]) cylinder($fn=32, d=5.6, h=4);
}


module motorPlatforms() {
    color("lightblue") {
        
        translate([-165/2,0,-20])
        rotate([270,0,0]) import("ProtoTank_trackinnerFrame2.stl");

        translate([-165/2,36*2+width_c,-20])
        mirror([0,1,0]) rotate([270,0,0]) import("ProtoTank_trackinnerFrame2.stl");
    }//color
}

module arduino() {
    color("lightgreen") {
        cube([arduino_l,arduino_w,arduino_h]);
    }
}

module batteryBox(){
    
    //difference(){
        color("lightgreen") cube([bb_length,bb_width,bb_height]);
        
        batteryBoxHoles();
    //}
}

module batteryBoxHoles() {
    color("red")
    translate([bb_length/2,10,-1]) {
        cylinder($fn=32, d=3.2, h=bb_height+10);
        translate([0,0,16]) rotate([0,0,30]) cylinder($fn=6, h=3,r=3.3);
    }
    color("red")
    translate([bb_length/2,30,-1]) {
        cylinder($fn=32, d=3.2, h=bb_height+10);
        translate([0,0,16]) rotate([0,0,30]) cylinder($fn=6, h=3,r=3.3);
    }
}