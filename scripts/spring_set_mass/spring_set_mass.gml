/// @desc Sets the Mass of the spring provided
/// @func spring_set_mass(spring_array, mass)
/// @arg spring_array : The spring array to modify
/// @arg mass         : The value to set the mass of the bob to

var spr = argument0;
var _mass = argument1;

spr[@ 4] = _mass;