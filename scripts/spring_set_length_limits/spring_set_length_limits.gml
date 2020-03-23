/// @desc Sets the min and max values for the length of the spring. once set the spring will get no longer than max and no shorter than min.
/// @func spring_set_length_limits(spring_array, min, max);
/// @arg spring_array   : The spring array to modify
/// @arg min            : the minimum length
/// @arg max            : the maximum length

var spr = argument0;
var _min = argument1;
var _max = argument2;

spr[@ 30] = 1;
spr[@ 27] = _min;
spr[@ 28] = _max;