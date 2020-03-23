/// @desc Draws the spring to the screen for debugging
/// @func spring_draw(spring_array)
/// @arg  spring_array : The array of the spring to be drawn
/// @arg  debug_opt    : A set of optional draws for the debugging of angles and limits - 0 is bypass - 1 is scalar projection - 2 is bob limits -

var spr = argument0;
var opt = argument1;

//debugging options
switch(opt){
	//bypass
	case 0: break;
	//scalar projection
	case 1: draw_set_color(c_blue);
			draw_line(spr[32], spr[33], spr[34], spr[35]);
			draw_line(spr[32], spr[33], spr[9], spr[10]);
			draw_line(spr[9], spr[10], spr[42], spr[43]);
			draw_circle(spr[32], spr[33],3,1);
			draw_circle(spr[32]+(spr[39]*spr[36]), spr[33]+(spr[40]*spr[36]),3,1);
			draw_circle(spr[42], spr[43],3,1);
			break;
	//length limits
	case 2:	draw_set_color(c_red);
			draw_circle(spr[44], spr[45], 3, 1);
			draw_circle(spr[46], spr[47], 3, 1);
			break;
}

//draw anchor
draw_set_color(c_white);
draw_rectangle(spr[2]-2,spr[3]+2,spr[2]+2,spr[3]-2,1);

//draw line if not broken
if(!spr[@ 29]){
	if(point_distance(spr[2],spr[3],spr[9],spr[10]) < spr[0]-5)draw_set_color(c_red);
	else if(point_distance(spr[2],spr[3],spr[9],spr[10]) < spr[0]+5 && point_distance(spr[2],spr[3],spr[9],spr[10]) > spr[0]-5)draw_set_color(c_green); 
	else draw_set_color(c_white);
	draw_line(spr[9],spr[10],spr[2],spr[3]);
}

//draw bob
draw_set_color(c_white);
draw_circle(spr[9],spr[10],2,1);
