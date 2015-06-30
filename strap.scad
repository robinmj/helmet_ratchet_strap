translate([0,4,0]) cylinder(h=1.25,r=4);
translate([86,-40,0]) cylinder(h=1.25,r=4);
translate([0,4,0]) cylinder(h=3.5,r=1.25,$fn=10);
translate([86,-40,0]) cylinder(h=3.5,r=1.25,$fn=10);
translate([0,4,3]) sphere(h=3,r=2,$fn=10);
translate([86,-40,3]) sphere(h=3,r=2,$fn=10);
//cube([185,8,1]);
//translate([185,5,0]) rotate(-10) cube([70,3,1]);

strap_width = 8.5;

//bend point
bpx = 125;
bpy = strap_width;

//end point
epx = 135;
epy = strap_width;

epy2 = epy - sqrt((pow(strap_width,2) * pow(epx - bpx,2)) / (pow(epy - bpy,2) + pow(epx - bpx,2)));
epx2 = epx - sqrt(pow(strap_width,2) - pow(epy2-epy, 2));

bpy2 = 0;
bpx2 = epx2 - ((epx-bpx) * (epy2-bpy2)) / (epy - bpy);

echo(bpx2=bpx2,epx2=epx2,epy2=epy2);

linear_extrude(height=1.25)
    polygon(points = [[0,0], [71,0],[82,-41],[90,-42],[125,0],[bpx2,bpy2],[epx2,epy2],[epx,epy],[bpx,bpy],[0,8],[80,0],[88,-32],[115,0]], paths=[[0,1,2,3,4,5,6,7,8,9],[10,11,12]]);
    

translate([epx,epy])
rotate([0,0,180-asin((bpy-epy)/(epx-bpy))]){
    cube([1.75,8.5,2.25]);
}