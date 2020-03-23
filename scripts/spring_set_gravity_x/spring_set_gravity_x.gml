/// @desc Sets the gravity of the spring provided
/// @func spring_set_gravity_x(spring_array, grav)
/// @arg spring_array : The spring array to modify
/// @arg grav         : The value to set gravity to

spr = argument0;
var _grav = argument1;

spr[@ 7] = _grav;