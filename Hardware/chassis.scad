use<global.scad>
use<hardware.scad>
use<parts.scad>

module chassis_top()
{
    color("DarkSlateGray") difference()
    {
        union()
        {
            hull()
            {
                translate([18, 3, 0]) cylinder(d = 1, h = 0.3);
                translate([14, 3, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([14, 3, 0]) cylinder(d = 1, h = 0.3);
                translate([6, 1.25, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([6, 1.25, 0]) cylinder(d = 1, h = 0.3);
                translate([2.5, 1.25, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([18, -3, 0]) cylinder(d = 1, h = 0.3);
                translate([14, -3, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([14, -3, 0]) cylinder(d = 1, h = 0.3);
                translate([6, -1.25, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([6, -1.25, 0]) cylinder(d = 1, h = 0.3);
                translate([2.5, -1.25, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([6, 1.25, 0]) cylinder(d = 1, h = 0.3);
                translate([6, -1.25, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([14, 3, 0]) cylinder(d = 1, h = 0.3);
                translate([14, -3, 0]) cylinder(d = 1, h = 0.3);
            }
        }
        translate([18, 3, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([18, -3, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([14, 3, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([14, 2.3, -0.1]) cylinder(d = 0.4, h = 0.5);
        translate([14, 0, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([14, -3, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([2.5, 1.25, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([2.5, -1.25, -0.1]) cylinder(d = 0.3, h = 0.5);
    }
}

module chassis_bottom()
{
    color("DarkSlateGray") difference()
    {
        union()
        {
            hull()
            {
                translate([0, 1.5, 0]) cylinder(d = 1, h = 0.3);
                translate([0, -1.5, 0]) cylinder(d = 1, h = 0.3);
                translate([4, 1.5, 0]) cylinder(d = 1, h = 0.3);
                translate([4, -1.5, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([4, 1.5, 0]) cylinder(d = 1, h = 0.3);
                translate([4, -1.5, 0]) cylinder(d = 1, h = 0.3);
                translate([6, 3.7, 0]) cylinder(d = 1, h = 0.3);
                translate([6, -3.7, 0]) cylinder(d = 1, h = 0.3);
            }
            hull()
            {
                translate([6, 3.7, 0]) cylinder(d = 1, h = 0.3);
                translate([6, -3.7, 0]) cylinder(d = 1, h = 0.3);
                translate([20, 3.7, 0]) cylinder(d = 1, h = 0.3);
                translate([20, -3.7, 0]) cylinder(d = 1, h = 0.3);
            }
        }
        // pivots
        translate([17.5, -3.9, -0.1]) cube([2, 0.3, 0.5]);
        translate([17.5, 3.6, -0.1]) cube([2, 0.3, 0.5]);
        // chassis top
        translate([19.5, 3, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([19.5, -3, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([15.5, 3, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([15.5, -3, -0.1]) cylinder(d = 0.3, h = 0.5);
        // steering front
        translate([4, 1.25, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([4, -1.25, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([1.5, 1.25, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([1.5, -1.25, -0.1]) cylinder(d = 0.3, h = 0.5);
        //translate([5.4, -1.75, -0.1]) rcube([1.5, 3.5, 0.5], 1);
        // bumper front
        translate([0, 1.5, -0.1]) cylinder(d = 0.3, h = 0.5);
        translate([0, -1.5, -0.1]) cylinder(d = 0.3, h = 0.5);
        // esc switch
        translate([18.35, 1.8, -0.1]) cube([1.2, 0.5, 0.5]);
        translate([19.9, 2.05, -0.1]) cylinder(d = 0.2, h = 0.5);
        translate([18, 2.05, -0.1]) cylinder(d = 0.2, h = 0.5);
    }
}

module chassis_pivot() 
{
    color("DarkSlateGray") difference()
    {
        union()
        {
            cube([2, 0.3, 0.3]);
            hull()
            {
                translate([0, 0, 0.3]) cube([2, 0.3, 0.1]);
                translate([2, 0, 0.3]) cube([1, 0.3, 1]);
                translate([3, 0.3, 0.8]) rotate([90, 0, 0]) cylinder(d = 1, h = 0.3);   
            }
        }
        translate([3, 0.4, 0.8]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 0.5);   
    }
}

module chassis(parts = true, $fn = 40)
{
    translate([0, 0, 2]) chassis_top();    
    translate([-1.5, 0, -0.3]) chassis_bottom();
    translate([16, -3.9, -0.3]) chassis_pivot(); 
    translate([16, 3.6, -0.3]) chassis_pivot();
   
    if(parts)
    {
        translate([13.5, 0, 4.3]) suspension();
        
        translate([18, 3, 2]) nut(2, 0.3);
        translate([18, -3, 2]) nut(2, 0.3);
        translate([14, 3, 2]) nut(2, 0.3);
        translate([14, -3, 2]) nut(2, 0.3);
        
        translate([8, -1, 0]) battery();
        translate([12.7, -1, 0]) rotate([0, 0, 180]) receiver();
        translate([18.8, -2.6, 0]) rotate([0, 0, 90]) esc();
        translate([18.8, 1.5, 1.5]) rotate([0, 180, 0]) esc_switch();
    }
}

module chassis_bp($fn = 40)
{
    chassis_bottom();
    translate([22, 9, 0]) rotate([0, 0, 180]) chassis_top();
    translate([21, 7, 0]) rotate([90, 0, 0]) chassis_pivot(); 
    translate([21, 9, 0]) rotate([90, 0, 0]) chassis_pivot();  
}

module bumper_front($fn = 40)
{
    color("DarkSlateGray") translate([-2, 0, 0]) difference() {
        hull() {
            translate([0, -2, 0]) cube([1.5, 4, 1.5]);
            translate([-1, -8, 0]) rcube([1, 16, 1.5], 0.5);
            translate([-2, -7, 0]) rcube([1, 14, 1.5], 0.5);
        }
        translate([0.5, 1.5, -0.1]) cylinder(d = 0.6, h = 2);
        translate([0.5, -1.5, -0.1]) cylinder(d = 0.6, h = 2);
    }
}

module bumper_back($fn = 40)
{
    color("DarkSlateGray") translate([26.5, 0, 0]) difference() {
        union() {
            translate([-0.3, -3.9, 0]) cube([2.8, 7.8, 1.5]);
            hull() {
                translate([2, -7, 0]) rcube([1, 14, 1.5], 0.5);
                translate([3, -6, 0]) rcube([1, 12, 1.5], 0.5);
            }
        }
        translate([-0.4, -4, 1]) cube([0.4, 8, 1.1]);
        translate([0.7, 1.5, -0.1]) cylinder(d = 0.6, h = 2);
        translate([0.7, -1.5, -0.1]) cylinder(d = 0.6, h = 2);
    }
}

chassis();
bumper_front();
bumper_back();
