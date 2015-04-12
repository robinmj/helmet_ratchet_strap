bodyPolygon = [[0,10],[0,20],[10,24],[20,27],[30,28],[40,29],[50,30],[68,30],[70,28],
[70,2],[68,0],[50,0],[40,1],[30,2],[20,3],[10,6],
[56,10],[63,7],[63,25],[56,22]];

union() {
    difference() {
        union() {
            //body
            linear_extrude(2) {
                polygon(points = bodyPolygon, paths = [[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19]]);
            }
            //flap
            linear_extrude(3) {
                translate([0.5,0,0])
                offset(-0.5)
                polygon(points = [bodyPolygon[16],bodyPolygon[17],bodyPolygon[18],bodyPolygon[19]]);
            }
        }
        union() {
            //strap track
            translate([35,11.25,1.75]) cube([48,9.5,2]);
            //flex gap
            translate([61,7.5,1]) cube([2,17,2]);
        }
    }
    
    
    //mounting pads
    translate([35,7.25,0]) {
        cube([15,4,3.5]);
    }
    translate([35,20.75,0]) {
        cube([15,4,3.5]);
    }
    
    //mounting posts
    translate([43,9.5,0]) {
        cylinder(r=0.75,h=7,$fn=20);
    }
    translate([43,22.5,0]) {
        cylinder(r=0.75,h=7,$fn=20);
    }
    
    //teeth (z should be 2.75, reduced slightly to eliminate warning
    translate([57,12.5,2.749])
    rotate([-90,0,0]) {
        linear_extrude(7) {
            polygon(points = [[0,0],[0,1],[1,1]]);
        }
        linear_extrude(7) {
            polygon(points = [[1,0],[1,1],[2,1]]);
        }
    }
}