// In order to fit the backband, this piece needs to be cylindrically
// deformed before printing.
// I do this in MeshLab using
//  Filters->Smoothing, Fairing and Deformation->Geometric Function
// and then entering in z+sqrt(80^2-(x-35)^2)-80 for the z function

union() {
        difference() {
            cube([26,17,2]);
            union() {
                //strap track
                translate([0,3.75,0.75]) cube([48,9.5,3]);
                
                //flex gap
                translate([15,0,1]) cube([7,17,2]);
            }   
        }
        
        //mounting pads
        translate([3,0,0]) {
            cube([10,3.75,3.5]);
        }
        translate([3,13.25,0]) {
            cube([10,3.75,3.5]);
        }
        
        //flap flexers
        translate([24,3.75,2]) rotate([90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
        translate([24,13.25,2]) rotate([-90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
        
        //stopper
        translate([7,0,0.75]) cube([0.75,17,0.75]);
        
        //mounting posts
        translate([8,2,0]) {
            cylinder(r=0.875,h=5.5,$fn=20);
        }
        translate([8,15,0]) {
            cylinder(r=0.875,h=5.5,$fn=20);
        }
}