translate([0,4,0]) cylinder(h=1.25,r=4);
translate([86,-40,0]) cylinder(h=1.25,r=4);
translate([0,4,0]) cylinder(h=3.5,r=1.25,$fn=10);
translate([86,-40,0]) cylinder(h=3.5,r=1.25,$fn=10);
translate([0,4,3]) sphere(h=3,r=2,$fn=10);
translate([86,-40,3]) sphere(h=3,r=2,$fn=10);
//cube([185,8,1]);
//translate([185,5,0]) rotate(-10) cube([70,3,1]);

strap_width = 8;

//end point
epx = 135;
epy = strap_width;

linear_extrude(height=1.25)
    polygon(points = [[0,0], [71,0],[82,-41],[90,-42],[125,0],[epx,0],[epx,epy],[0,strap_width],[80,0],[88,-32],[115,0]], paths=[[0,1,2,3,4,5,6,7],[8,9,10]]);
    
translate([epx,0])
rotate([-90,0,0])
linear_extrude(height=strap_width)
    polygon(points = [[0,0],[-1.25,0],[-0.75,-2],[0.5,-2]]);