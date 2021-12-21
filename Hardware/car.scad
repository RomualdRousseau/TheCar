use<global.scad>
use<steering_front.scad>
use<steering_back.scad>
use<chassis.scad>

module car(parts = true)
{
    steering_front(parts);
    translate([25, 0, 0.7]) steering_back(parts);
    chassis(parts);
    bumper_front();
    bumper_back();
}

car();
