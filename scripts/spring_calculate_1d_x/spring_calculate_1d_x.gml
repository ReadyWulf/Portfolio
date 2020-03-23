/// @desc Takes the array created by spring_initialise and does the calculations for the spring 
//**this script calculates a spring ignoring all of the 2d elements and the spring will only operate in the x plane**//
/// @func spring_calculate
/// @arg  spring_array

var spring = argument0;

//Angle
spring[@ 23] = point_direction(spring[@ 9],spring[@ 10],spring[@ 2], spring[@ 3]);

//Length
spring[@ 24] = point_distance(spring[@ 9],spring[@ 10], spring[@ 2], spring[@ 3]); 

//length subtractors
spring[@ 21] = lengthdir_x(spring[@ 0],spring[@ 23]);
//spring[@ 22] = lengthdir_y(spring[@ 0],spring[@ 23]);

//spring force
spring[@ 15] = -spring[@ 5]*(spring[@ 9] - spring[@ 2]);
//spring[@ 16] = -spring[@ 5]*(spring[@ 10] - spring[@ 3]);

//damping force
spring[@ 17] = spring[@ 6] * spring[@ 11];
//spring[@ 18] = spring[@ 6] * spring[@ 12];

//Total force
spring[@ 19] = spring[@ 15] + spring[@ 4] * spring[@ 7] - spring[@ 17] - spring[@ 21];
//spring[@ 20] = spring[@ 16] + spring[@ 4] * spring[@ 8] - spring[@ 18] - spring[@ 22];

//accelaration
spring[@ 13] = spring[@ 19]/spring[@ 4];
//spring[@ 14] = spring[@ 20]/spring[@ 4];

//velocity
spring[@ 11] += spring[@ 13] * spring[@ 1];
//spring[@ 12] += spring[@ 14] * spring[@ 1];

//apply force
spring[@ 9] += spring[@ 11] * spring[@ 1];
//spring[@ 10] += spring[@ 12] * spring[@ 1];