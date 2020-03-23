/// @desc Used to get all data from a given spring and draw it to the screen
/// @func spring_debug()
/// @arg spring_array : the spring provided 
/// @arg x            : where to draw the list of data
/// @arg y            : where to draw the list of data
/// @arg scale        : how much to scale the debug panel

var _spr = argument0;
var _x = argument1;
var _y = argument2;
var scale = argument3;

var num = 0.4
var size = num*scale;
var sep = (num*scale)*10;


var vel_x,vel_y,acc_x,acc_y,sf_x,sf_y,df_x,df_y,tf_x,tf_y,ls_x,ls_y,_ang,_len;

vel_x = spring_get_velocity_x(_spr);
vel_y = spring_get_velocity_y(_spr);
acc_x = spring_get_acceleration_x(_spr);
acc_y = spring_get_acceleration_y(_spr);
sf_x = spring_get_spring_force_x(_spr);
sf_y = spring_get_spring_force_y(_spr);
df_x = spring_get_dampener_force_x(_spr);
df_y = spring_get_dampener_force_y(_spr);
tf_x = spring_get_total_force_x(_spr);
tf_y = spring_get_total_force_y(_spr);
ls_x = spring_get_length_sub_x(_spr);
ls_y = spring_get_length_sub_y(_spr);
_ang = spring_get_angle(_spr);
_len = spring_get_length(_spr);

draw_line_color(_x, _y, _spr[@ 9], _spr[@ 10], c_gray, c_black);

draw_rectangle_color(_x-5, _y-5, _x + (100*scale), _y+(75*scale), c_gray, c_gray, c_gray, c_gray, false);
draw_rectangle_color(_x-3, _y-3, _x + (97*scale), _y+(72*scale), c_black, c_black, c_black, c_black, true);

draw_text_transformed(_x,_y,           "velocity x:     " + string(vel_x), size, size, 0);
draw_text_transformed(_x,_y+(5*scale), "velocity y:     " + string(vel_y), size, size, 0);
draw_text_transformed(_x,_y+(10*scale),"acceleration x: " + string(acc_x), size, size, 0);
draw_text_transformed(_x,_y+(15*scale),"acceleration y: " + string(acc_y), size, size, 0);
draw_text_transformed(_x,_y+(20*scale),"spring x:       " + string(sf_x), size, size, 0);
draw_text_transformed(_x,_y+(25*scale),"spring y:       " + string(sf_y), size, size, 0);
draw_text_transformed(_x,_y+(30*scale),"damp x:         " + string(df_x), size, size, 0);
draw_text_transformed(_x,_y+(35*scale),"damp y:         " + string(df_y), size, size, 0);
draw_text_transformed(_x,_y+(40*scale),"total force x:  " + string(tf_x), size, size, 0);
draw_text_transformed(_x,_y+(45*scale),"total force y:  " + string(tf_y), size, size, 0);
draw_text_transformed(_x,_y+(50*scale),"len sub x:      " + string(ls_x), size, size, 0);
draw_text_transformed(_x,_y+(55*scale),"len sub y:      " + string(ls_y), size, size, 0);
draw_text_transformed(_x,_y+(60*scale),"angle:          " + string(_ang), size, size, 0);
draw_text_transformed(_x,_y+(65*scale),"length:         " + string(_len), size, size, 0);
