translate([0,4,0]) cylinder(h=1,r=4);
translate([86,-40,0]) cylinder(h=1,r=4);
//cube([185,8,1]);
//translate([185,5,0]) rotate(-10) cube([70,3,1]);

linear_extrude(height=1)
    polygon(points = [[0,0], [71,0],[82,-41],[90,-42],[125,0],[210,0],[255,-7],[256,-3],[186,8],[0,8]]);