/// @desc Takes the array created by spring_initialise and does the calculations for the spring
/// @func spring_calculate
/// @arg  spring_array

var spring = argument0;

//if the spring is not broken calculate the spring
if(!spring[@ 29]){
	
	//Angle
	spring[@ 23] = point_direction(spring[@ 2], spring[@ 3], spring[@ 9],spring[@ 10]);

	//rest length
	spring[@ 21] = lengthdir_x(spring[@ 0],spring[@ 23]) * spring[@ 5];
	spring[@ 22] = lengthdir_y(spring[@ 0],spring[@ 23]) * spring[@ 5];

	//spring force
	spring[@ 15] = -spring[@ 5]*(spring[@ 9] - spring[@ 2]);
	spring[@ 16] = -spring[@ 5]*(spring[@ 10] - spring[@ 3]);

	//damping force
	spring[@ 17] = spring[@ 6] * spring[@ 11];
	spring[@ 18] = spring[@ 6] * spring[@ 12];

	//Total force
	spring[@ 19] = spring[@ 15] + spring[@ 4] * (spring[@ 7]*0.1) - spring[@ 17] + spring[@ 21];
	spring[@ 20] = spring[@ 16] + spring[@ 4] * (spring[@ 8]*0.1) - spring[@ 18] + spring[@ 22];

	//accelaration
	spring[@ 13] = spring[@ 19]/spring[@ 4];
	spring[@ 14] = spring[@ 20]/spring[@ 4];

	//velocity
	spring[@ 11] += spring[@ 1] * spring[@ 13];
	spring[@ 12] += spring[@ 1] * spring[@ 14];

	//apply force
	spring[@ 9] += spring[@ 11] * spring[@ 1] + spring[@ 19]/spring[@ 4]/2*spring[@ 1]*spring[@ 1];
	spring[@ 10] += spring[@ 12] * spring[@ 1] + spring[@ 19]/spring[@ 4]/2*spring[@ 1]*spring[@ 1];
	
	//read length
	spring[@ 24] = point_distance(spring[@ 9],spring[@ 10], spring[@ 2], spring[@ 3]);
	
	//read Angle
	spring[@ 23] = point_direction(spring[@ 2], spring[@ 3], spring[@ 9],spring[@ 10]);

	//if the spring is confined to a set angle make sure the bob is on that angle
	if(spring[@ 25]){
		//if the spring is allowed inversion
		if(spring[@ 31]){
			
			//use Scalar projection algorithm
			//create plane extension
			var pos_x = lengthdir_x(spring[@ 24],spring[@ 26]);
			var pos_y = lengthdir_y(spring[@ 24],spring[@ 26]);
	
			//set plane length
			var plane_x_length = lengthdir_x(spring[@ 24],spring[@ 26]);
			var plane_y_length = lengthdir_y(spring[@ 24],spring[@ 26]);
	
			//plane origin point
			spring[@ 32] = (spring[@ 2]) - plane_x_length;
			spring[@ 33] = (spring[@ 3]) - plane_y_length;
		
			//plane termination point
			spring[@ 34] = (spring[@ 2]) + plane_x_length;
			spring[@ 35] = (spring[@ 3]) + plane_y_length;
	
			//angle and distance from plane origin to bob
			var neg_ang = point_direction(spring[@ 32], spring[@ 33], spring[@ 9], spring[@ 10]);
			spring[@ 36] = point_distance(spring[@ 32], spring[@ 33], spring[@ 9], spring[@ 10]);
			
			
			//the unit vector of the plane(uv) and the unit vector of the vector from origin to bob(sp)
			var uv = dot_product_normalised(spring[@ 32],spring[@ 33],spring[@ 34],spring[@ 35]);
			var sp = dot_product_normalized(spring[@ 32],spring[@ 33],spring[@ 9], spring[@ 10]);
	
			//(uv) split into coordinates
			spring[@ 37] = lengthdir_x(uv,spring[@ 26]);
			spring[@ 38] = lengthdir_y(uv,spring[@ 26]);
	
			//(sp) split into coordinates
			spring[@ 39] = lengthdir_x(sp, neg_ang);
			spring[@ 40] = lengthdir_y(sp, neg_ang);
	
			// The Vector of projection
			var fv = dot_product(spring[@ 39]*spring[@ 36], spring[@ 40]*spring[@ 36], spring[@ 37], spring[@ 38]);

			// projection vector
			spring[@ 42] = spring[@ 32]+(spring[@ 37]*fv);
			spring[@ 43] = spring[@ 33]+(spring[@ 38]*fv);
			
			//dis and ang from bob to projection
			var fv_ang = point_direction(spring[@ 9], spring[@ 10], spring[@ 42], spring[@ 43]); 
			spring[@ 41] = point_distance(spring[@ 9], spring[@ 10], spring[@ 42], spring[@ 43]);
			
			//where to move the bob to keep it at the angle 
			var __x = lengthdir_x(spring[@ 41], fv_ang);
			var __y = lengthdir_y(spring[@ 41], fv_ang);
			
			//if debugging is not on
			if(!spring[@ 48]){
				//apply projected vector to bob
				spring[@ 9] += __x;
				spring[@ 10] += __y;
			}
			
		//else - if the spring is not allowed inversion	
		}else{
			var o_x = lengthdir_x(spring[@ 24], spring[@ 26]);
			var o_y = lengthdir_y(spring[@ 24], spring[@ 26]);
			
			var n_x = spring[@ 2] + o_x;
			var n_y = spring[@ 3] + o_y;
			
			spring[@ 9] = n_x;
			spring[@ 10] = n_y;
			}
		
		}

	}

	//read angle
	spring[@ 23] = point_direction(spring[@ 2], spring[@ 3], spring[@ 9],spring[@ 10]);

	//read length
	spring[@ 24] = point_distance(spring[@ 9],spring[@ 10], spring[@ 2], spring[@ 3]);
	
	//if the spring has length limits bring the bob back within those limits
	if(spring[@ 30]){
		
		//define limit positions
		var bob_min_x = lengthdir_x(spring[@ 27], spring[@ 23]);
		var bob_min_y = lengthdir_y(spring[@ 27], spring[@ 23]);
		
		spring[@ 44] = spring[@ 2] + bob_min_x;
		spring[@ 45] = spring[@ 3] + bob_min_y;
		
		var bob_max_x = lengthdir_x(spring[@ 28], spring[@ 23]);
		var bob_max_y = lengthdir_y(spring[@ 28], spring[@ 23]);
		
		spring[@ 46] = spring[@ 2] + bob_max_x;
		spring[@ 47] = spring[@ 3] + bob_max_y;
		
		//if debugging is not on
		if(!spring[@ 48]){
			//min limit
			if(spring[@ 24] < spring[@ 27]){
				var dis_min = point_distance(spring[@ 9], spring[@ 10], spring[@ 44], spring[@ 45]);
				var x_min = lengthdir_x(dis_min,spring[@ 23]);
				var y_min = lengthdir_y(dis_min,spring[@ 23]);
		
				spring[@ 9] += x_min;
				spring[@ 10] += y_min;		
			}
		
			//max limit
			if(spring[@ 24] > spring[@ 28]){
				var dis_max = point_distance(spring[@ 9], spring[@ 10], spring[@ 46], spring[@ 47]);
				var x_max = lengthdir_x(dis_max,spring[@ 23]);
				var y_max = lengthdir_y(dis_max,spring[@ 23]);
		
				spring[@ 9] -= x_max;
				spring[@ 10] -= y_max;		
			}
		}
}