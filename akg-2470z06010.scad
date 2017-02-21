module washer() {
	difference(){
		union(){
			cylinder(h=2.8, d1=18.2, d2=18.0, $fn=100);
			translate([0,0,2.8])
				cylinder(h=0.8, d1=18.0, d2=8.0, $fn=100);
		};

		// Top groove
		translate([0,0,2.0])
			cylinder(h=2.1, d=4.5, $fn=100);

		// Center hole
		cylinder(h=2.0, d=2.4, $fn=100);

		// Bottom groove
		translate([0,0,-0.1])
			cylinder(h=1.0, d=5.3, $fn=100);
	}
}

module finger() {
	translate([18.2/2 - 1.6,0,1.25])
		rotate([0,90,0])
			linear_extrude(height = 8.2, scale = [1,0.3])
				square([2.5,10], center = true);
}

module carve() {
	translate([0,0,-2.5])
	scale([0.85,0.85,0.85])
	difference() {
		union(){
			cylinder(h=3.8, d1=18.2, d2=18.0, $fn=100);
			translate([0,0,3.8])
				cylinder(h=0.8, d1=18.0, d2=8.0, $fn=100);
		};

		// Center hole
		cylinder(h=5.0, d=9.0, $fn=100);
	}
}

difference(){
	union(){
		washer();
		finger();
	}
	carve();
}