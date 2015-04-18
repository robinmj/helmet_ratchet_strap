// In order to fit the backband, this piece needs to be cylindrically
// deformed before printing.
// I do this in MeshLab using
//  Filters->Smoothing, Fairing and Deformation->Geometric Function
// and then entering in z+sqrt(80^2-(x-35)^2)-80 for the z function

bodyPolygon = [[0,10],[0,20],[10,24],[20,27],[30,28.5],[40,29.5],[50,30],[68,30],[70,28],
[70,2],[68,0],[50,0],[40,0.5],[30,1.5],[20,3],[10,6],
[55.5,7],[58,5],[64,4],[58.5,6.5],[56.5,8.5],[56.5,21.5],[58.5,23.5],[64,26],[58,25],[55.5,23]];

union() {
    difference() {
        union() {
            //body
            linear_extrude(height=2) {
                polygon(points = bodyPolygon, paths = [[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19,20,21,22,23,24,25]],convexity=6);
            }
            
            polyhedron(points = [[bodyPolygon[0][0],bodyPolygon[0][1],2],
                [bodyPolygon[1][0],bodyPolygon[1][1],2],
                [bodyPolygon[2][0],bodyPolygon[2][1],2],
                [bodyPolygon[3][0],bodyPolygon[3][1],2],
                [bodyPolygon[14][0],bodyPolygon[14][1],2],
                [bodyPolygon[15][0],bodyPolygon[15][1],2],
                [bodyPolygon[0][0],bodyPolygon[0][1],3.5],
                [bodyPolygon[1][0],bodyPolygon[1][1],3.5],
                [bodyPolygon[2][0],bodyPolygon[2][1],4.5],
                [bodyPolygon[15][0],bodyPolygon[15][1],4.5]],
                faces = [[5,4,3,2,1,0],[0,6,9,5],[5,9,4],[4,9,8,3],[3,8,2],[2,8,7,1],[1,7,6,0],[6,7,8,9]]);
            
        }
        union() {
            //strap slot
            translate([0,11,1]) cube([10,20,1.5]);
            translate([8,11,1]) cube([2,20,2.5]);
            
            //mounting holes
            translate([43,8.5,0]) {
                cylinder(r=1,h=3,$fn=20);
            }
            translate([43,21.5,0]) {
                cylinder(r=1,h=3,$fn=20);
            }
            //backband track
            translate([35,10.25,1.75]) cube([48,9.5,2]);
            //flex gap
            translate([0,0,0.75])
            linear_extrude(height=2) {
                polygon(points = [[bodyPolygon[18][0],bodyPolygon[18][1]],
                [bodyPolygon[19][0]+2,bodyPolygon[17][1]],
                [bodyPolygon[22][0]+2,bodyPolygon[24][1]],
                [bodyPolygon[23][0],bodyPolygon[23][1]]],
                paths = [[0,1,2,3]],
                convexity=6);
            }
        }
    }
    
    //strap retainer
    translate([0,19.5,2.7]) rotate([0,90,0]) cylinder(r=0.5,h=8,$fn=8);
    
    //flap buttons
    translate([58.5,8.25,2]) sphere(r=1.75,$fn=20);
    translate([58.5,21.75,2]) sphere(r=1.75,$fn=20);
    
    //teeth
    translate([56.5,11.5,3.5])
    difference() {
        rotate([-90,0,0]) {
            linear_extrude(height=7) {
                polygon(points = [[0,0],[0,2],[2,2]]);
            }
            linear_extrude(height=7) {
                polygon(points = [[2,0],[2,2],[4,2]]);
            }
        }
        translate([-1,0,0])
        rotate([0,90,0]) {
            linear_extrude(height=8) {
                polygon(points = [[-0.1,5],[-0.1,7.1],[2,7.1]]);
            }
            linear_extrude(height=8) {
                polygon(points = [[-0.1,-0.1],[-0.1,2],[2,-0.1]]);
            }
        }
    }
}