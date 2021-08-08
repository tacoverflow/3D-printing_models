$fn=30;

module bone_end(thickness, bone_end_radius){
    translate([0, bone_end_radius*0.6,0])
    cylinder(h=thickness, r=bone_end_radius, center=true);
    translate([0,-bone_end_radius*0.6,0])
    cylinder(h=thickness, r=bone_end_radius, center=true);
}


thickness=3;
bone_end_radius=12;
bone_lenght=bone_end_radius*2;
difference(){
    union(){
        // bone shape
        translate([-bone_lenght, 0, 0])
        bone_end(thickness, bone_end_radius);
        translate([bone_lenght, 0, 0])
        bone_end(thickness, bone_end_radius);
        cube([bone_lenght*1.5, bone_end_radius*2, thickness], center=true);
        // hole section
        translate([0, bone_end_radius, 0])
        cylinder(h=thickness, r=5, center=true);
    }

    // dog name
    translate([0, 0, thickness*0.4])
    linear_extrude(height = thickness*2) {
    text("Hershey", size=8, halign="center", valign="center");
    }

    // phone number
    translate([0, 0, -thickness*0.4])
    rotate([0,180,0])
    linear_extrude(height = thickness*2) {
    text("555 555 5555", size=8, halign="center", valign="center");
    }
    // hole
    translate([0, bone_end_radius, 0])
    cylinder(h=thickness*1.1, r=2.5, center=true);
}


