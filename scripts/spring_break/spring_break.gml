/// @desc Sets the broken value of the spring
/// @func spring_break(spring_array, broken)
/// @arg spring_array : The spring array to modify
/// @arg broken       : The value to set broken to

var spr = argument0;
var _brk = argument1;

spr[@ 29] = _brk;