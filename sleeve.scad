detail = 300;
postWidth = 89;
wallThickness = 20;
boardHeight = 89;
thickWidth = 38;
thinWidth = 19;

module block() {
    translate([-(postWidth + wallThickness) / 2, -(postWidth + wallThickness) / 2, 0])
        cube([postWidth + wallThickness, postWidth + wallThickness, 178]);
}

difference() {
    block();

    // First slot (Y-axis)
    translate([-thickWidth / 2, -thinWidth, -1])
        cube([thickWidth, 900, boardHeight+1]);

    // Second slot (X-axis)
    translate([-thickWidth/2, -thinWidth, -1])
        cube([900, thinWidth, boardHeight+1]);
    
    translate([-postWidth / 2, -postWidth / 2, boardHeight+5])
    color("red", 0.3)
        cube([postWidth , postWidth, 178]);
}


// Highlight first cutter in red
//color("red", 0.3)
//translate([-thickWidth / 2, 0, -1])
//cube([thickWidth, 900, boardHeight]);

// Highlight second cutter in red
//color("blue", 0.3)
//translate([0, -thinWidth, 0])
//cube([900, thinWidth, boardHeight]);
