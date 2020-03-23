/// @desc Sets the gravity of the spring provided
/// @func spring_set_gravity_x(spring_array, grav)
/// @arg spring_array : The spring array to modify
/// @arg grav_x_1     : The value to set x gravity to
/// @arg grav_y_1     : The value to set y gravity to
/// @arg grav_x_2     : The value to set x gravity to
/// @arg grav_y_2     : The value to set y gravity to

var spr = argument[0];
var _grav_x_1 = argument[1];
var _grav_y_1 = argument[2];
var opt = 0;
var g_pos;

if(argument_count > 3){
	var _grav_x_2 = argument[3];
	var _grav_y_2 = argument[4];
	opt = 1;
}
	
if(!opt){
	var dis_1 = point_distance(spr[@ 2], spr[@ 3], _grav_x_1, _grav_y_1);
	var dir_1 = point_direction(spr[@ 2], spr[@ 3], _grav_x_1, _grav_y_1);
	
	var gx_t = lengthdir_x(dis_1, dir_1);
	var gy_t = lengthdir_y(dis_1, dir_1);
}else{
	var dis_1 = point_distance(spr[@ 2], spr[@ 3], _grav_x_1, _grav_y_1);
	var dir_1 = point_direction(spr[@ 2], spr[@ 3], _grav_x_1, _grav_y_1);
	
	var gx_1 = lengthdir_x(dis_1, dir_1);
	var gy_1 = lengthdir_y(dis_1, dir_1);
	
	var dis_2 = point_distance(spr[@ 2], spr[@ 3], _grav_x_2, _grav_y_2);
	var dir_2 = point_direction(spr[@ 2], spr[@ 3], _grav_x_2, _grav_y_2);
	
	var gx_2 = lengthdir_x(dis_2, dir_2);
	var gy_2 = lengthdir_y(dis_2, dir_2);
	
	gx_t = gx_1 + gx_2;
	gy_t = gy_1 + gy_2;
}
	
spr[@ 7] = gx_t;
spr[@ 8] = gy_t;

g_pos[0] = gx_t;
g_pos[1] = gy_t;

return g_pos;