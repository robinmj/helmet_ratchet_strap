
radius = 80;
height = 9;
toothWidth = 2;
toothDepth = 1.75;
toothSectionDepth = 2;
rimHeight = 1;

module tooth() {
	cube([toothWidth,toothSectionDepth,rimHeight]);
	translate([0,toothDepth,0]) cube([toothWidth,toothSectionDepth - toothDepth,height]);
	translate([0,0,height-rimHeight]) cube([toothWidth,toothSectionDepth,rimHeight]);
	translate([0,0,rimHeight]) {
		linear_extrude(height=height-(2 * rimHeight)) {
			polygon(points = [[0,toothDepth - toothSectionDepth],
									 [0,toothDepth],
									 [toothWidth,toothDepth]]);
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
			cube([1,1+toothSectionDepth,height]);
		}
	}
}

translate([0,-radius,0])
union() {
	side();
	
	mirror([1,0,0]) side();
}