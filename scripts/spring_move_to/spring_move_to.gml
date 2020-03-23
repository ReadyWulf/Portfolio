/// @desc changes the position of the spring anchor
/// @func spring_anchor_relocate(spring_array, x, y)
/// @arg  spring_array the spring to relocate
/// @arg  x the x position to relocate to
/// @arg  y the y position to relocate to

spr = argument0;
var _x = argument1;
var _y = argument2;

spr[@ 9] = _x;
spr[@ 10] = _y;