/// @desc provides all of the necessary variables to add springs to any object
/// @func spring_initialise()
/// @arg anchor_x
/// @arg anchor_y


//List of variables:
//	[0] = Rest length
//	[1] = Time Step
//	[2] = X Anchor
//	[3] = Y Anchor
//	[4] = Mass of Bob (m)
//	[5] = Spring strength constant (k)
//	[6] = Dampener strength constant (b)
//	[7] = Gravity Strength in the x plane(g(x))
//	[8] = Gravity Strength in the y plane(g(y))
//	[9] = Current X position of Bob
//	[10] = Current Y position of Bob
//	[11] = Velocity X of bob
//	[12] = Velocity Y of bob
//  [13] = Acceleration X of bob
//  [14] = Acceleration Y of bob
//	[15] = Spring force X
//	[16] = Spring force Y
//	[17] = Dampener force X
//	[18] = Dampener force Y
//	[19] = Total force X
//	[20] = Total force Y
//	[21] = Length helper X 
//	[22] = Length helper Y
//	[23] = Angle of spring
//	[24] = Current length of spring
//  [25] = angle locked bool
//  [26] = angle locked angle
//  [27] = min spring length
//  [28] = max spring length
//  [29] = spring broken bool
//  [30] = whether to use length limits
//  [31] = whether to allow inversion

//  [48] = debug mode - on/off

// The rest of the entries are positional variables 
// only used in the spring_draw function for debugging 

var array;

		/////////////
		//Constants//
		/////////////
		
array[0] = 0;//Rest Length                              -- spring 
array[1] = 0.10;//Time step                             -- simulation
array[2] = argument0;// x equilibrium position(anchors) -- point mass
array[3] = argument1;// y                               -- point mass
array[4] = .10;//mass of bob                            -- point mass
array[5] = .01;//spring constant(k)                     -- spring
array[6] = .01;//damping constant                       -- spring
array[7] = 0;//x gravitaional constant(g(x))            -- simulation
array[8] = 0;//y gravitaional constant(g(y))            -- simulation

		/////////////
		//variables//
		/////////////
		
array[9] = argument0;//  x position of bob
array[10] = argument1;// y
array[11] = 0;//velocity
array[12] = 0;
array[13] = 0;//Acceleration
array[14] = 0;
array[15] = 0;//Spring force
array[16] = 0;
array[17] = 0;//Dampener force
array[18] = 0;
array[19] = 0;//Total force
array[20] = 0;
array[21] = 0;//Length variables
array[22] = 0;
array[23] = 0;//current angle
array[24] = 0;//current Length

		//////////////////////
		//Special Properties//
		//////////////////////
		
array[25] = 0;//if the angle is locked
array[26] = 0;//the angle to lock to
array[27] = 0;//min length
array[28] = 0;//max length
array[29] = 0;//spring broken
array[30] = 0;//use limits bool
array[31] = 0;//allow inversion of spring

		/////////////
		//Debugging//
		/////////////

array[32] = 0;// begin/begin
array[33] = 0;
array[34] = 0;// end/end
array[35] = 0;
array[36] = 0;// neg_dis
array[37] = 0;// uva
array[38] = 0;
array[39] = 0;// spa
array[40] = 0;
array[41] = 0;// fvdis
array[42] = 0;// fva
array[43] = 0;
array[44] = 0;// min x/y
array[45] = 0;
array[46] = 0;// max x/y
array[47] = 0;
array[48] = 0;// debug mode - 0 is off - 1 is on
array[49] = 0;// no anchor


return array;