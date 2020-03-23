/// @desc Used to manually apply force to the bob of the spring provided
/// @func spring_apply_force()
/// @arg spring_array : the spring provided 
/// @arg x            : force to apply on the x plane
/// @arg y            : force to apply on the y plane

var spring = argument0;

var f_x = argument1;
var f_y = argument2;

spring[@ 11] = f_x;
spring[@ 12] = f_y;