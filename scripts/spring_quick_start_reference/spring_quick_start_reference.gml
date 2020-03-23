/*

**This should be used for a quick reference -- Full version in READ ME Section 2**

--Step 1:

Call this in the create event:

	spring_name = spring_initialise(x,y);
	
--Step 2:

Set desired parameters using the scripts from the 'Set' Folder

	Note: These parameters (except special params like length limits and angle lock) can 
		  also be set at the time of initialsation using the spring_initialise_ext(); script

--Step 3:

Call this in the step event:

	spring_calculate(spring_name);
	
--Step 4:

Assign something to the location of the bob.

	Note: This can be done using the spring_get_bob_x() and the
		  spring_get_bob_y() functions. Like this:
				
				_x = spring_get_bob_x(spring_name);
				_y = spring_get_bob_y(spring_name);
				
--Step 5:

If you would like to see what your spring is doing call spring_draw() or spring_debug() in the Draw event.

	Note: spring_draw()  draws a representation of the spring. square is anchor; circle is bob;
		  spring_debug() draws a box next to the spring that 
						 displays the numbers that are going on inside the calculations. 



Remember: you can create as many springs as you need in as many objects as you need them but each spring
		  is an array that contains several variables. That said (even though I've never properly benchmarked it)
		  I've had dozens of them running on many objects in one screen and saw no noticeable performance hit.

*/