// In order to fit the backband, this piece needs to be cylindrically
// deformed before printing.
// I do this in MeshLab using
//  Filters->Smoothing, Fairing and Deformation->Geometric Function
// and then entering in z+sqrt(80^2-(x-35)^2)-80 for the z function

union() {
        difference() {
            cube([26,17,4.5]);
            union() {
                //strap track
                translate([0,3.75,1.75]) cube([48,9.5,3]);
                
                //flex gap
                translate([15,0,1]) cube([7,17,4]);
                
                //flap flexer base
                translate([22,0,3]) cube([7,17,2]);
            }   
        }
        
        //flap flexers
        translate([24,3.75,3]) rotate([90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
        translate([24,13.25,3]) rotate([-90,0,0]) cylinder(r=1, h=3.75,$fn = 20);
        
        //stopper
        translate([13,0,1.75]) cube([0.75,17,0.75]);
        
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
}