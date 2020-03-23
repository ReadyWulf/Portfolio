/// @desc Sets the Debug mode of the spring 0 is off 1 is on. If debug mode is on no special features(i.e. angle locks or limit locks) will calculate.
/// @func spring_set_debug_mode(spring_array, d_mode)
/// @arg spring_array   : The spring array to modify
/// @arg d_mode         : whether to set debug mode or not


var spr = argument0;
var _mode = argument1;

spr[@ 48] = _mode;
