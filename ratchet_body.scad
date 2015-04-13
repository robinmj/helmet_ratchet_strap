// In order to fit the backband, this piece needs to be cylindrically
// deformed before printing.
// I do this in MeshLab using
//  Filters->Smoothing, Fairing and Deformation->Geometric Function
// and then entering in z+sqrt(80^2-(x-35)^2)-80 for the z function

bodyPolygon = [[0,10],[0,20],[10,24],[20,27],[30,28.5],[40,29.5],[50,30],[68,30],[70,28],
[70,2],[68,0],[50,0],[40,0.5],[30,1.5],[20,3],[10,6],
[56,7],[63,7],[63,7.5],[58.5,7.5],[56.5,9.5],[56.5,22.5],[58.5,24.5],[63,24.5],[63,25],[56,25]];

union() {
    difference() {
        union() {
            //body
            linear_extrude(height=2) {
                polygon(points = bodyPolygon, paths = [[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19,20,21,22,23,24,25]],convexity=6);
            }
        }
        union() {
            //mounting holes
            translate([43,9.5,0]) {
                cylinder(r=0.75,h=3,$fn=20);
            }
            translate([43,22.5,0]) {
                cylinder(r=0.75,h=3,$fn=20);
            }
            //strap track
            translate([35,11.25,1.75]) cube([48,9.5,2]);
            //flex gap
            translate([60.5,7.5,1]) cube([2.5,17,2]);
        }
    }
    
    translate([58.5,9.25,2]) sphere(r=2,$fn=20);
    translate([58.5,22.75,2]) sphere(r=2,$fn=20);
    
    //teeth (dz should be 3.75, reduced slightly to eliminate warning
    translate([56.5,12.5,3.749])
    rotate([-90,0,0]) {
        linear_extrude(height=7) {
            polygon(points = [[0,0],[0,2],[2,2]]);
        }
        linear_extrude(height=7) {
            polygon(points = [[2,0],[2,2],[4,2]]);
        }
    }
}