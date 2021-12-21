use<global.scad>
use<hardware.scad>
use<parts.scad>

module motor_base()
{
    color("DarkSlateGray")  difference()
    {
        rcube([9, 8.4, 0.3], 1);
        translate([1, 1, -0.1]) rcube([6, 6.4, 0.5], 1);
        translate([1, -0.1, -0.1]) cube([6, 0.4, 0.5]);
        translate([1, 8.1, -0.1]) cube([6, 0.4, 0.5]);
        // bumper back
        translate([8, 5.7, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([8, 2.7, -0.1]) cylinder(d = 0.3, h = 0.5);
    }
}

module motor_mount()
{
    color("DarkSlateGray") difference()
    {
        union()
        {
            hull()
            {
                translate([6, 0.3, 2]) rotate([90, 0, 0]) cylinder(d = 2, h = 0.3);
                translate([3.7, 0.3, 2]) rotate([90, 0, 0]) cylinder(d = 3.5, h = 0.3);
                translate([0, 0.3, 0.5]) rotate([90, 0, 0]) cylinder(d = 1, h = 0.3);
                translate([0.5, 0.3, 2.5]) rotate([90, 0, 0]) cylinder(d = 1, h = 0.3);
                translate([7, 0.3, 2.5]) rotate([90, 0, 0]) cylinder(d = 1, h = 0.3);
                translate([6.5, 0, 0]) cube([1, 0.3, 1]);
            }
            translate([1.2, 0, -0.3]) cube([6, 0.3, 0.3]);
        }
        translate([0, 0.4, 0.5]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 0.5);
        translate([0, 0.4, 0.5]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 0.5);
        translate([7.2, -0.1, 1]) cube([0.4, 0.5, 1]);
        translate([0.3, -0.1, 2.5]) cube([1, 0.5, 0.3]);
        translate([6, 0.4, 0.7]) rotate([90, 0, 0]) cylinder(d = 0.8, h = 0.5);
        translate([3.4, 0.4, 1.9]) rotate([90, 0, 0]) cylinder(d = 1.5, h = 0.5);
        hull()
        {
            translate([2.05, 0.4, 1.9]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 0.5);
            translate([2.25, 0.4, 1.9]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 0.5);
        }
        hull()
        {
            translate([4.55, 0.4, 1.9]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 0.5);
            translate([4.75, 0.4, 1.9]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 0.5);
        }
    }
}

module suspension_mount()
{
    color("DarkSlateGray") difference()
    {
        cube([1, 8.4, 0.3]);
        translate([0.5, 4.2, -0.1]) cylinder(d = 0.3, h = 0.5);
    }
}

module steering_back(parts = true, $fn = 40)
{
    translate([-6, 3.9, -0.7]) motor_mount();
    translate([-6, -4.2, -0.7]) motor_mount();
    translate([-5.8, -4.2, -1]) motor_base();
    translate([1.2, -4.2, 0.3]) color("DarkSlateGray") cube([0.3, 8.4, 1]);
    
    translate([-5.7, -4.2, 1.8]) suspension_mount();
    
    if(parts)
    {
        translate([0, 7, 0]) rotate([-90, 0, 0])
        {
            wheel_nut();
            translate([0, 0, 0.2]) wheel();
        }
        translate([0, -7, 0]) rotate([90, 0, 0])
        {
            wheel_nut();
            translate([0, 0, 0.2]) wheel();
        }
        
        translate([0, 4.7, 0]) rotate([-90, 0, 0])
        {
            bearing();
            translate([0, 0, 0]) gear_big();
        }  
        translate([0, -4.7, 0]) rotate([90, 0, 0])
        {
            bearing();
        }

        translate([-2.6, -1.1, 1.2]) rotate([-90, 0, 0])
        {
            motor();
            translate([0, 0, 5.8]) gear_small();
        }
    
        translate([0, -8, 0]) steering_shaft(16);
    }
}

module steering_back_bp($fn = 40)
{
    motor_base();
    translate([10, 3, 0]) rotate([90, 0, 0]) motor_mount();
    translate([10, 8, 0]) rotate([90, 0, 0]) motor_mount(); 
    translate([20, 0, 0]) suspension_mount();
    translate([22, 0, 0]) cube([1, 8.4, 0.3]);
}

steering_back();
