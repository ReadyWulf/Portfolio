/// @desc Sets the Rest length of the spring provided
/// @func spring_set_rest_length(spring_array, r_len)
/// @arg spring_array : The spring array to modify
/// @arg r_len         : The value to set Dampener to

var spr = argument0;
var _rlen = argument1;

spr[@ 0] = _rlen;