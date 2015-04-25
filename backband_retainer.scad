difference() {
    hull() {
        translate([0,6.5,0]) cube([4,17,3.5]);
        linear_extrude(height=0.1) {
            polygon(points=[[0,30],[4,30],[6,28],
            [6,2],[4,0],[0,0]]);
        }
    }
    translate([0,10.25,0]) cube([10,9.5,2]);
}

//mounting posts
        translate([2,8.5,-3]) {
            cylinder(r=0.85,h=6.5,$fn=20);
        }
        translate([2,21.5,-3]) {
            cylinder(r=0.85,h=6.5,$fn=20);
        }