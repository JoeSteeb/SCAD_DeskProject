detail = 300;
postWidth = 89;
wallThickness = 20;
cornerRadius = 10;
boardHeight = 89;

coneHeight = 70;
coneBoar = 15;
coneWallThickness = 10;

thickRadius = coneBoar+coneWallThickness+10;
thinRadius = coneBoar+coneWallThickness;

sphereAccuracy = 100;
deflection = coneHeight/sqrt(2);
centerToCorner = (postWidth * sqrt(2))/2;
bottomPlate = 5;
coneRotation = 90;
height = 240;
coneDist = ((height - (boardHeight+bottomPlate)) / 2) + boardHeight+bottomPlate;


module block() {
    difference(){
        minkowski(){
            translate([-(postWidth + wallThickness) / 2, -(postWidth + wallThickness) / 2, 0])
                cube([postWidth + wallThickness, postWidth + wallThickness, height]);
            sphere(10);
        }
        translate([-(postWidth + wallThickness + cornerRadius*2) / 2, -(postWidth + wallThickness+ cornerRadius*2) / 2, -cornerRadius])
                cube([postWidth + wallThickness + cornerRadius*2, postWidth + wallThickness + cornerRadius*2, cornerRadius]);
    }
}

module cone() {
    cylinder(coneHeight, thinRadius, thickRadius, $fn = sphereAccuracy);
}

module tappedCone(){
    difference(){
        cone();
        translate([0,0,-1])
        cylinder(coneHeight, coneBoar, coneBoar, sphereAccuracy);
    }
}


difference() {
    block();

    // First slot (Y-axis)
    translate([-thickRadius / 2, -thinRadius, -1])
        cube([thickRadius, 900, boardHeight+1]);

    // Second slot (X-axis)
    translate([-thickRadius/2, -thinRadius, -1])
        cube([900, thinRadius, boardHeight+1]);
    
    translate([-postWidth / 2, -postWidth / 2, boardHeight+bottomPlate])
    color("red", 0.3)
        cube([postWidth , postWidth, 178]);
     translate([-deflection - centerToCorner + (thickRadius * tan(45)),
                -deflection - centerToCorner + (thickRadius * tan(45)),
            coneDist])
        rotate([coneRotation,0,135])
        cylinder(coneHeight, coneBoar, coneBoar, sphereAccuracy);

}
difference(){
 translate([-deflection - centerToCorner + (thickRadius * tan(45)),
            -deflection - centerToCorner + (thickRadius * tan(45)),
            coneDist])
        rotate([coneRotation,0,135])
        tappedCone();
    block();
}

//block();

//translate([-postWidth / 2, -postWidth / 2, boardHeight+bottomPlate])
//    color("red", 0.3)
//        cube([postWidth , postWidth, 178]);
//translate([-(postWidth + wallThickness) / 2, -(postWidth + wallThickness) / 2, -cornerRadius])
//    color("red", 0.3)
//    cube([postWidth + wallThickness, postWidth + wallThickness, cornerRadius]);