/// @desc Sets the angle to lock the spring to. spring_set_angle_lock() should be ran first and set to true.
/// @func spring_set_angle(spring_array, angle, invert)
/// @arg spring_array   : The spring array to modify
/// @arg angle          : the angle to lock to
/// @arg inversion      : whether the spring is allowed to invert - 0 or 1 ONLY

var spr = argument0;
var _sang = argument1;
var _sinv = argument2;

spr[@ 25] = 1;
spr[@ 26] = _sang;
spr[@ 31] = _sinv;