/// @desc Sets the Dampener of the spring provided
/// @func spring_set_dampener(spring_array, dampener)
/// @arg spring_array : The spring array to modify
/// @arg damp         : The value to set Dampener to

var spr = argument0;
var _damp = argument1;

spr[@ 6] = _damp;