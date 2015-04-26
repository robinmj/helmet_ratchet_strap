// In order to fit the backband, this piece needs to be cylindrically
// deformed before printing.
// I do this in MeshLab using
//  Filters->Smoothing, Fairing and Deformation->Geometric Function
// and then entering in z-sqrt(80^2-x^2)+80 for the z function

union() {
        difference() {
            union() {
                hull() {
                    cube([15,17,4.5]);
                    polyhedron(points=[[-14.5,-3.5,4.5],
                    [-14.5,2.5,2.5],
                    [-14.5,14.5,2.5],
                    [-14.5,20.5,4.5],
                    [-4.5,22,4.5],
                    [15,22,4.5],
                    [15,-5,4.5],
                    [-4.5,-5,4.5]],
                        faces=[[0,1,2,3],[3,4,5,6,7,0]]);
                }
                
                //flex gap
                translate([15,0,0]) cube([7,17,1]);
                //flap flexer base
                translate([22,0,0]) cube([4,17,3]);
            }
            union() {
                //backband track
                translate([-9,3.75,1.75]) {
                    cube([57,9.5,3]);
                    rotate([-90,0,0]) linear_extrude(height=9.5) {
                        polygon(points=[[0,-3],[0,0],[-5,-3]]);
                    }
                }
            }   
        }
        
        //flap flexers
        translate([24,3.75,3]) rotate([90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
        translate([24,13.25,3]) rotate([-90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
        
        //stopper
        translate([13,0,1.75]) cube([2,17,0.75]);
        
        //mounting posts
        translate([2,2,0]) {
            cylinder(r=0.85,h=6.5,$fn=20);
        }
        translate([2,15,0]) {
            cylinder(r=0.85,h=6.5,$fn=20);
        }
        translate([13.5,2,0]) {
            cylinder(r=0.8,h=6.5,$fn=20);
        }
        translate([13.5,15,0]) {
            cylinder(r=0.8,h=6.5,$fn=20);
        }
        
        //flap flexer button
        translate([24,0,-2]) {
            translate([0,8.5,0])
            difference() {
                hull() {
                    translate([0,0,0.5]) cylinder(r=9,h=1.5);
                    cylinder(r=8.5,h=2);
                }
                translate([0,0,-18.5]) sphere(r=20);
            }
            translate([3.5,1.5,0]) cube([1,14,2]);
            translate([-0.5,0,0]) cube([1,17,2]);
            translate([-4.5,1.5,0]) cube([1,14,2]);
        }
}