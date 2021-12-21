use<global.scad>
use<hardware.scad>
use<parts.scad>

module steering_front_arm(w, d)
{ 
    color("Grey") difference()
    {
        union()
        {
            hull() {
                translate([d, w, 0]) cylinder(d = 1, h = 0.2);
                translate([2 * d / 3, w / 2, 0]) cylinder(d = 1, h = 0.2);
            }
            hull() {
                translate([2 * d / 3, w / 2, 0]) cylinder(d = 1, h = 0.2);
                translate([0, 0, 0]) cylinder(d = 1, h = 0.2);
            }
            hull() {
                translate([2 * d / 3, w / 2, 0]) cylinder(d = 0.8, h = 0.2);
                translate([d, 0, 0]) cylinder(d = 1, h = 0.2);
            }
        }
        translate([d, w, -0.1]) cylinder(d = 0.3, h = 0.4);
        translate([0, 0, -0.1]) cylinder(d = 0.3, h = 0.4);
        translate([d, 0, -0.1]) cylinder(d = 0.3, h = 0.4);
        translate([2 * d / 3, w / 2, -0.1]) cylinder(d = 0.3, h = 0.4);
    }
}

module servo_horn()
{
    color("Grey") difference()
    {
        hull()
        {
            cylinder(d = 0.7, h = 0.2);
            translate([1, 0.8, 0]) cylinder(d = 1, h = 0.2);
            translate([1, -0.8, 0]) cylinder(d = 1, h = 0.2);
        }
        %translate([0, 0, -0.1]) cylinder(d = 0.2, h = 0.4);
        %translate([0.4, 0, -0.1])  cylinder(d = 0.2, h = 0.4);
        translate([1, 0.8, -0.1]) cylinder(d = 0.3, h = 0.4);
        translate([1, -0.8, -0.1]) cylinder(d = 0.3, h = 0.4);
    }
}

module servo_mount(w = 3.5, d = 3.5)
{
    color("Grey")  difference()
    {
        rcube([w + 1.5, d, 0.2], 1);
        // arms
        translate([0.5, 0.5, -0.1]) cylinder(d = 0.3, h = 0.4);
        translate([w - 0.5, 0.5, -0.1]) cylinder(d = 0.3, h = 0.4);
        translate([w - 0.5, d - 0.5, -0.1]) cylinder(d = 0.3, h = 0.4);
        translate([0.5, d - 0.5, -0.1]) cylinder(d = 0.3, h = 0.4);
        // servo 
        translate([(w + 3 - 2.31) / 2, (d - 1.22) / 2, -0.1]) cube([2.31, 1.22, 0.4]);
        translate([(w + 3 - 2.31) / 2 - 0.23, d / 2, -0.1]) cylinder(d = 0.2, h = 0.4);
        translate([(w + 3 - 2.31) / 2 + 2.53, d / 2, -0.1]) cylinder(d = 0.2, h = 0.4);
    }
}

module servo_spacer()
{
    color("Grey")  difference()
    {
        union()
        {
            hull()
            {
                cylinder(d = 1, h = 0.3);
                translate([0, 2.5, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                cylinder(d = 1, h = 0.3);
                translate([2.5, 0, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([0, 2.5, 0]) cylinder(d = 1, h = 0.3);
                translate([2.5, 2.5, 0]) cylinder(d = 1, h = 0.3);
            }
        }
        translate([0, 0, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([0, 2.5, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([2.5, 0, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([2.5, 2.5, -0.1]) cylinder(d = 0.3, h = 0.5);
    }
}

module steering_front_arm_and_wheel(parts = true)
{
    steering_front_arm(6, 2.5);
    translate([0, 0, 1.3]) steering_front_arm(6, 2.5);
    
    if(parts)
    {
        translate([2.5, 5.95, 0]) rotate([90, 0, 180])
        {
            translate([-0.55, 0.7, -0.25]) steering_knuckle();
            translate([-0.55, 0.7, -0.05]) wheel();
        }

        translate([5.05, -0.45, 0.8]) steering_link(a = -6.3, l = 5.9);
        
        // spacers
        translate([0, 0, 1.3]) nut(1.1, 0.3);
        translate([2.5, 0, 1.3]) nut(1.1, 0.3);    
        translate([2 * 2.5 / 3, 6 / 2, 1.3]) nut(1.1, 0.3);
    }
}

module steering_front(parts = true, $fn = 40)
{
    translate([-0.5, -1.75, 1.8]) servo_mount();
    translate([0, -1.25, 1.5]) servo_spacer();
    translate([4.05, 0, 0.6]) servo_horn();
    translate([0, 1.25, 0]) steering_front_arm_and_wheel(parts);
    mirror([0, -1, 0]) translate([0, 1.25, 0]) steering_front_arm_and_wheel(parts);
    
    if(parts)
    {
        translate([3.9, -0.6, 3.8]) rotate([180, 0, 180]) servo(angle = 90);
    }
}

module steering_front_bp($fn = 40)
{
    translate([0, 0, 0]) steering_front_arm(6, 2.5);
    translate([6, 10, 0]) rotate([0, 0, 180]) steering_front_arm(6, 2.5);
    translate([4, 0, 0]) steering_front_arm(6, 2.5);
    translate([10,10, 0]) rotate([0, 0, 180]) steering_front_arm(6, 2.5);
    translate([15, 0, 0]) rotate([0, 0, 90]) servo_mount();
    translate([12, 8, 0]) servo_horn();
    translate([16, 7, 0]) servo_spacer();
}

steering_front();
