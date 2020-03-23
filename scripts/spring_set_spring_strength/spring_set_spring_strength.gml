/// @desc Sets the Spring strength of the spring provided
/// @func spring_set_spring_strength(spring_array, s_strn)
/// @arg spring_array : The spring array to modify
/// @arg s_strn         : The value to set spring strength (k) to

var spr = argument0;
var _sstrn = argument1;

spr[@ 5] = _sstrn;