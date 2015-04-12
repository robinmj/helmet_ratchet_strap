/*intersection() {
	linear_extrude(height=9) {
		polygon(points = [[0,87], [87,0], [200,200]]);
	}
	
	difference() {
		cylinder(r=90,h=9,$fn=200);
		cylinder(r=87,h=9,$fn=200);
	}
}*/

radius = 90;
height = 9;
toothWidth = 1;
toothDepth = 1;
toothSectionDepth = 3;
rimHeight = 1;

module tooth() {
	difference() {
		cube([toothWidth,toothSectionDepth,height]);
		translate([0,0,rimHeight]) {
			linear_extrude(height-(2 * rimHeight)) {
				polygon(points = [[0,0], [toothWidth,toothDepth], [toothWidth,0]]);
			}
		}
	}
}

module side() {
	for(i = [0:55]) {
		rotate(i * (2 * asin((toothWidth / 2) / (radius + toothSectionDepth))),[0,0,-1]) {
			translate([0,radius,0]) {
				if(i < 20) {
					cube([toothWidth,toothSectionDepth,height]);
				} else {
					tooth();
				}
			}
		}
	}
	
	//end piece
	rotate(56 * (2 * asin((toothWidth / 2) / (radius + toothSectionDepth))),[0,0,-1]) {
		translate([0,radius,0]) {
			linear_extrude(height) {
				polygon(points = [[0,0], [0,2 + toothSectionDepth], [2 + toothSectionDepth,0]]);
			}
		}
	}
}

translate([0,-radius,0])
union() {
	side();
	
	mirror([1,0,0]) side();
}