/*intersection() {
	linear_extrude(height=9) {
		polygon(points = [[0,78], [78,0], [200,200]]);
	}
	
	difference() {
		cylinder(r=80,h=9,$fn=200);
		cylinder(r=78,h=9,$fn=200);
	}
}*/

radius = 80;
height = 9;
toothWidth = 2;
toothDepth = 1.75;
toothSectionDepth = 2;
rimHeight = 1;

module tooth() {
	difference() {
		cube([toothWidth,toothSectionDepth,height]);
		translate([0,0,rimHeight]) {
			linear_extrude(height=height-(2 * rimHeight)) {
				polygon(points = [[0,0], [toothWidth,toothDepth], [toothWidth,0]]);
			}
		}
	}
}

module side() {
	for(i = [0:27]) {
		rotate(i * (2 * asin((toothWidth / 2) / (radius + toothSectionDepth))),[0,0,-1]) {
			translate([0,radius,0]) {
				if(i < 9) {
					cube([toothWidth,toothSectionDepth,height]);
				} else {
					tooth();
				}
			}
		}
	}
	
	//end piece
	rotate(28 * (2 * asin((toothWidth / 2) / (radius + toothSectionDepth))),[0,0,-1]) {
		translate([0,radius,0]) {
			linear_extrude(height=height) {
				polygon(points = [[0,0], [0,1 + toothSectionDepth], [1 + toothSectionDepth,0]]);
			}
		}
	}
}

translate([0,-radius,0])
union() {
	side();
	
	mirror([1,0,0]) side();
}