$fn=30;

// TCL 10L dimentions
raw_phone_size = [162.2, 75.6, 8.4];
thickness = 2;
corner_radius = 2;
corner_diff = [1, 1, 1] * corner_radius * 2;

case_thickness = thickness * 2 * [1, 1, 0.5];
case_size = raw_phone_size + case_thickness;
translate_factor=[0, 0, thickness * 0.5 + 0.1];
charger_size = [thickness*2, 9, 4];
mic_size = [thickness*2, 14, 2];
right_buttons_size=[39, thickness*2, 4];
left_buttons_size=[12, thickness*2, 4];
camera_hole_size=[56, 11, thickness*2];
finger_print_hole=[10, 10, thickness*2];

difference() {
    // phone case
    minkowski(){
        cube(raw_phone_size - corner_diff + thickness * 2 * [1, 1, 0.5], center=true);
        sphere(r=corner_radius);
    }
    
    // phone body
    translate(translate_factor)
    minkowski(){
        cube(raw_phone_size - corner_diff, center=true);
        sphere(r=corner_radius);
    }
    // audio jack hole
    translate([-case_size[0]*0.492, -19, translate_factor[2]])
    rotate([0, 90, 0])
    cylinder(r=2.5,h=thickness*2, center=true);
    // small top right hole
    translate([-case_size[0]*0.492, raw_phone_size[1]*0.5-19, translate_factor[2]])
    rotate([0, 90, 0])
    cylinder(r=2,h=thickness*2, center=true);
    // charger hole
    translate([case_size[0]*0.49, 0, translate_factor[2]])
    minkowski(){
        cube(charger_size - [0, 1, 1] * 2, center=true);

        rotate([0,90,0])
            cylinder(r=2,h=0.001, center=true);
    }
    // mic hole 1
    translate([case_size[0]*0.49, 18, translate_factor[2]])
    minkowski(){
        cube(mic_size - [0, 1, 1], center=true);
        rotate([0,90,0])
            cylinder(r=1,h=0.001, center=true);
    }
    // mic hole 2
    translate([case_size[0]*0.49, -18, translate_factor[2]])
    minkowski(){
        cube(mic_size - [0, 1, 1], center=true);
        rotate([0,90,0])
            cylinder(r=1,h=0.001, center=true);
    }
    // right buttons hole
    translate([-case_size[0]*0.5 + right_buttons_size[0]*0.5 + 32, case_size[1]*0.49, translate_factor[2]])
    minkowski(){
        cube(right_buttons_size - [1, 0, 2.5], center=true);
        rotate([0,90,90])
            cylinder(r=1,h=0.001, center=true);
    }
    // left button hole
    translate([-case_size[0]*0.5 + left_buttons_size[0]*0.5 + 52, -case_size[1]*0.49, translate_factor[2]])
    minkowski(){
        cube(left_buttons_size - [1, 0, 2.5], center=true);
        rotate([0,90,90])
            cylinder(r=1,h=0.001, center=true);
    }
    // camera hole
    color([1, 0, 0, 1])
    translate([-case_size[0]*0.5 + camera_hole_size[1]*0.5 + 17,0,-case_size[2]*0.5 + camera_hole_size[2]*0.4])
    rotate([0,0,90])
    minkowski(){
        cube(camera_hole_size - [1, 1, 0], center=true);
        cylinder(r=1,h=0.001, center=true);
    }
    // fingerprint reader
    color([1, 0, 0, 1])
    translate([-case_size[0]*0.5 + finger_print_hole[1]*0.5 + 39,0,-case_size[2]*0.5 + finger_print_hole[2]*0.4])
    rotate([0,0,90])
    minkowski(){
    cube(finger_print_hole - [1, 1, 0], center=true);
    cylinder(r=1,h=0.001, center=true);
    }
}

