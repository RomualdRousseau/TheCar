use<global.scad>
use<steering_front.scad>
use<steering_back.scad>
use<chassis.scad>

scale(10) projection()
{
    steering_front_bp();
    translate([0, 12, 0]) steering_back_bp();
    translate([0, 26, 0]) chassis_bp();
    translate([-1, 8, 0]) bumper_front();
    translate([-32, 30, 0]) bumper_back();
}
