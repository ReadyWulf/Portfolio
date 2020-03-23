/// @desc Sets the time step of the spring provided
/// @func spring_set_time_step(spring_array, t_step)
/// @arg spring_array : The spring array to modify
/// @arg t_step         : The value to set time step to

var spr = argument0;
var _tstep = argument1;

spr[@ 1] = _tstep;