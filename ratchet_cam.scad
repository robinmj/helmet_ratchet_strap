// In order to fit the backband, this piece needs to be cylindrically
// deformed before printing.
// I do this in MeshLab using
//  Filters->Smoothing, Fairing and Deformation->Geometric Function
// and then entering in z-sqrt(90^2-x^2)+73.5 for the z function

union() {
        difference() {
            union() {
                hull() {
                    cube([15,17,4.5]);
                    polyhedron(points=[[-14.5,-3.5,4.5],
                    [-16.5,2.5,1.35],
                    [-16.5,2.5,4.5],
                    [-16.5,14.5,1.35],
                    [-16.5,14.5,4.5],
                    [-14.5,20.5,4.5],
                    [-4.5,22,4.5],
                    [15,22,4.5],
                    [15,-5,4.5],
                    [-4.5,-5,4.5]],
                        faces=[[0,1,2],[2,1,3,4],[4,3,5],[0,2,4,5,6,7,8]]);
                }
                
                //flex gap
                translate([15,0,0]) cube([7,17,1]);
            }
            union() {
                //backband track
                translate([-12,3.75,1.75]) {
                    cube([57,9.5,3]);
                }
            }   
        }
        
        //flap flexers
        translate([24,3.75,3]) rotate([90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
		  translate([22,0,0]) cube([4,3.75,3]);
        translate([24,13.25,3]) rotate([-90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
		  translate([22,13.25,0]) cube([4,3.75,3]);
        
        //stopper
        translate([13,0,1.75]) cube([2,17,0.75]);
        
        //mounting posts
        translate([2,2,0]) {
            cylinder(r=0.85,h=7,$fn=20);
        }
        translate([2,15,0]) {
            cylinder(r=0.85,h=7,$fn=20);
        }
        translate([13.5,2,0]) {
            cylinder(r=0.8,h=7,$fn=20);
        }
        translate([13.5,15,0]) {
            cylinder(r=0.8,h=7,$fn=20);
        }
        
        //flap flexer button
        translate([22,0,-1]) {
				difference() {
					minkowski() {
          			cube([6,17,1]);
						cylinder(h=1,r=1,$fn=10);
					}
					hull() {
						translate([0,0,-1]) cube([6,17,1]);
						translate([0.5,0.5,0]) cube([5,16,1]);
					}
				}
        }
}