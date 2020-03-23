/*

		                                ////////////////
		                                //Introduction//
	                                	////////////////
		
                            ========================================
				
			First: Thank you for purchasing this spring simulation asset. I belive that you will be
			very pleased by its simplicity and function. It is designed to be suitable for all types
			of projects. Every aspect of the simulation is self contained, meaning
			that there is no hassel when integrating the springs into your physics systems. the calculate
			scripts take care of all of the physics and there are several scripts to set the parameters that
			you may want to tweak to achieve your desired effect. The bottom line is that Every 
			project is different therefore I belive that these assets should be as close to one size
			fits all as they can be.
			 
			
			Anatomy of a basic spring:
			A basic spring has three parts; The Anchor, The Spring, and The Bob. the anchor is the location
			where the spring is mounted. The anchor can have a dynamic position which is often essential for
			proper use(this will be covered later). The Spring is the length of space that attaches the anchor
			to the bob. The spring will have two seperate strength parameters: Dampener Strength and Spring Strength.
			The dampener will control the amount of time it takes to slow the wiggle of the spring to a stop. 
			The Spring strength will control the elasticity of the spring; Higher strength less wiggle(essentially);
			The bob is the end of the spring. It is the position that "boing-boings" around(if you will). The bob has
			a mass parameter and a gravity parameter. These two parameters affect the "droop" of the spring. higher mass
			or higher gravity will "droop" the bob in the direction of the gravity. 
			All of the parameters outlined above should be played with to achieve the desired effect.
			
			Encouragement:
			The hardest part is over. You decided to put your faith and money into this asset
			and now it is time put it to good use. The only problem now is that the stupid guy who put it together
			decided to write an ungodly wall of text that seems to ramble on forever. I understand completely.
			So, for those of you who have a general understanding of springs and know exactly what you want to use it for,
			you can jump ahead to Section 2 for a quick explanation of how to use this asset(Or the quick_start_guide for
			an even quicker explanation). If that doesn't provide you with the knoledge you need to get your use out of 
			springs you can skim through the documentation in Section 3; all of the scripts are outlined there. For those
			of you who want to get to know the possibilities of springs, you should read from top to bottom. however know 
			that I do not go over absolutly everything but it will help you to understand best use practices and the limitations
			of this asset.It is highly recommended to at least skim through all of this, I promise it is worth it.
			
			In the following sections I will outline some suggested use cases, Provide an in depth 
			"how to get started" section, and I will also list each script and provide a basic rundown
			of what that script does.
			
			Let's get started :)
			
			----------------===========================================--------------------
			Section 1: Use Cases and Spring Types													*/#region
/*			----------------===========================================--------------------
			
			Springs are everywhere. From a swaying tree branch to a lock of hair.
			The movement of these things can be calculated using springs. springs can also help
			to stabalise or secure. if you have an object stuck in slime and you pull on it a simple
			spring can make sure that that object snaps back to its original position. these are just
			a few simple examples of places where springs can be used.
			
			This asset covers two types of important springs: point springs and Support springs
			
			Point:
			This set of scripts was originally designed to make the proper calculations for mesh deformation
			of melee objects. specifically sticks. the vertices of the mesh are attached to the springs and 
			therefor when the stick is swung the vertices are left behind for a moment only to quickly snap
			back and catch up to their proper positions relative to the base of the stick. this type of 
			spring is a point spring. Point springs are very useful and are only limited to your imagination.
			Ideas: Idle bounce; the position of a floating droid; securing an unstable hat.
			
			Support:
			Support springs are a byproduct of my research. This asset was originally only designed to 
			calculate point springs but as I researched the eqautions for hook's law I found that adding this
			feature would require minimum extra coding. in fact I think that I only had to add one or two lines
			to the calculation scripts and add a function to initialise length. A support spring is a spring with a
			set length to which it will always return; Think the suspension on a car. these springs can be set to an
			initial length when creating the spring and left that way for the duration of their life for use as noted
			before(car suspension and what not) or adjusted dynamically for many other situations(Like maybe a speed
			racer type deal where the car goes up and down to avoid obstacles).
			Ideas: bouncy bridges, enemy aim raycast, Bouncy sprite deformation, *ah hem*car suspension.
			
			These outlined use cases and ideas are only a few ways these cool scripts can be used. 
			
			I hope that you have as much fun as I have had coming up with exciting ways to use this asset.
																										*/#endregion
/*			----------------===========================================--------------------
			Section 2: How to get started															*/#region
/*			----------------===========================================--------------------
			
			Note: there is a streamlined version of this Section called quick_start_reference in the documentation folder.
			
			First things first, these scripts essentially create an array of the variables used to calculate
			a spring. Then, each step, the array is passed into a calculation script. Now that you
			have a (very) basic idea of how I structured this asset, we can move on.
			
			1--Step One: Initialise the spring:--1
			
			This is done by calling the spring_initialise() script. this must be done for all springs!
			This script takes two arguments: the desired initial x and y position of the anchor. this script
			returns the array that it creates.This script should be called in the create event of the object
			that will use the spring. The proper way to call this scripts is:
			
				spring_name = spring_initialise(x, y);
			
			where spring_name is a variable in which to store the spring array and 'x' and 'y' are the position to assign 
			the Anchor. This array will be used when calling scripts to change parameters, to calculate the spring, or 
			to draw the spring. If you need to retrive any steady variables or dynamic variables
			from the spring array this array name will also be passed to those scripts.
			
			2--Step Two: Adjust Spring Parameters:--2
			
			This is done after spring initialisation and can either be done in the Creation code right after 
			spring_initialise() or every step(if you need to change the behavior of the spring dynamically).
			There are many scripts provided (in the "Set" folder) to streamline the setting of each parameter.
			For this example I will use the garvity parameter. The proper way to set the parameters of the spring is:
			
				spring_set_gravity_y(spring_name, 0.5);
			
			where spring_name is the variable that you assigned your spring array to in step one and '0.5' is the new 
			value to set garvity in the x plane. There is a set script for every 'steady' parameter as these are the 
			only parameters that have an initial value. All other ('dynamic') parameters are adjusted by the calculation
			script. If the need arises it is possible to manually set any dynamic variable. I may include a full set of 
			scripts for this in the future if there are requests.  
			
			Note: There are two gravity parameters; an 'x' and a 'y'. this is to accomodate those of you who would need to 
			be able to set the gravity of a spring to any direction. Any direction is achievable using a combination of 
			these two parameters. more on this in Section 3 (**NOT STEP 3**).
			
			3--Step Three: Calculate Your Spring--3
			
			This is done by calling the spring_calculate() script. This should always be done in a step event. The 
			spring_calculate script accepts the spring array(spring_name) and then plugs the 'steady' parameters into
			the equations that calculate the correct position of the bob of the spring for each step.The proper way to call
			this script is:
			
				spring_calculate(spring_name);
			
			where spring name is your spring array created in step one. Each step this script will reevaluate the bob
			position based on the residual data from the previous step.
			
			4--Step Four: Assign something to Bob Positon--4
			
			This is done with two scripts from the 'Get' group; spring_get_bob_x() and spring_get_bob_y(); 
			Each script accepts the spring array created in step one and returns the x and y position of each
			respectivly at each step. Then you can assign your object(or whatever you want) to the positions.
			the object which is assigned will then bounce around like it is attached to the spring.The proper way
			to do this is:
				
				_x = spring_get_bob_x(spring_name);
				_y = spring_get_bob_y(spring_name);
				
				object_x = _x;
				object_y = _y;
				
			where spring name is the spring array created in step one and object_x/object_y are the x/y positions of
			whichever object you would like to make bounce.
			
			5--Step Five: Visualise your spring--5
			
			This is done by calling one or both of the debug scripts; spring_draw() and spring_debug().
			spring_draw() draws a representation of your spring and spring_debug() draws a small box where specified
			that displays all of the numerical data being calculated by the spring. these scripts should only
			 be called in the draw event. the proper way to call these is:
			
				spring_draw(spring_name);
				spring_debug(spring_name);
				
			where spring_name is the spring array created in step one.
			
			That is the basic rundown of how to use this asset. there are many other ways in which this asset can be
			used so have fun tinkering and messing around with the parameters.
			                                                                                                            */#endregion
/*			----------------===========================================--------------------
			Section 3: Script Documentation															*/#region
/*			----------------===========================================--------------------
			===============================================================================
			
										--Group One: General--                                      */#region
			
/*			===============================================================================
			-------------------------------------------------------------------------------
			spring_initialise(anchor_x, anchor_y);
			-------------------------------------------------------------------------------
			Description:
			
				Returns spring array.
			
			Arguments:
			
				anchor_x : the place where you would like your spring to initialise.
			
				anchor_y : the place where you would like your spring to initialise.
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_initialise_ext(anchor_x, anchor_y, r_len, t_step, mass, strength, damp, x_grav, y_grav);
			-------------------------------------------------------------------------------
			Description:
			
				Returns spring array with all parameters modified by the arguments passed. 
			
			Arguments:
				
				anchor_x : the place where you would like your spring to initialise.
			
				anchor_y : the place where you would like your spring to initialise.
				
				r_len    : the desired rest length of the spring
				
				t_step   : the timestep of the spring
				
				mass     : the mass of the bob
				
				strength : the strength of the spring
				
				damp     : the dampener strength of the spring
				
				x_grav   : gravity strength in the x plane
				
				y_grav   : garvity strength in the y plane
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_relocate(my_spring, new_anchor_x, new_anchor_y);
			-------------------------------------------------------------------------------
			
			Description:
			
				Relocates the position of the anchor.
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
			
				new_anchor_x : the new x position of the anchor.
			
				new_anchor_y : the new y position of the anchor.
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_calculate(my_spring);
			-------------------------------------------------------------------------------
			Description:
			
				Calculates and modifies the spring array.
				
			Arguments:
				
				my_spring    : The spring to modify(created by spring_initialise())
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_draw(my_spring, debug_opt);
			-------------------------------------------------------------------------------
			Description:
			
				Draws a representation of the spring array to the screen. The spring is color
				coded, a green spring means that it is at its proper length, a red spring means
				that is is under pressure, a white spring is under negative pressure. can show debug
				information in (blue). It is reccomended that you use spring_set_debug_mode() to 
				turn on debug mode (before setting the debug option in this script to 1) as 
				you will not see the information if the spring is calculating its angular limit.
				(debug mode turns that off)
			
			Arguments:
			
				my_spring    : The spring to draw(created by spring_initialise())
				
				debug_opt    : Three options: 0 = bypass - 1 = scalar Projection - 2 = length limits.
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_debug(my_spring);
			-------------------------------------------------------------------------------
			Description:
			
				Draws a box next to the spring that displays all of the numerical data
				associated with the spring.
			
			Arguments:
			
				my_spring    : The spring to display info from(created by spring_initialise())
				
			===============================================================================         */#endregion
			
/*			===============================================================================
			
										--Group Two: Get--                                          */#region
										
/*			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_anchor_x(my_spring);
			-------------------------------------------------------------------------------
			Description:
			
				Returns the x position of the anchor of spring array.
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_anchor_y(my_spring);
			-------------------------------------------------------------------------------
			Description:
			
				Returns the y position of the anchor of spring array.
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_bob_x();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the x position of the bob of spring array.			
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())

			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_bob_y();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the y position of the bob of spring array.			
			
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_velocity_x();
			-------------------------------------------------------------------------------
			Description:
				
				Returns the x velocity of the bob of the spring array.
				
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())			
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_velocity_y();
			-------------------------------------------------------------------------------
			Description:
				
				Returns the y velocity of the bob of the spring array.			
				
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())			
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_acceleration_x();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the x acceleration of the bob of the spring array.			
			
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_acceleration_y();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the y acceleration of the bob of the spring array.		
			
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_spring_force_x();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the x spring force of the spring of the spring array.
			
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_spring_force_y();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the y spring force of the spring of the spring array.		
			
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_dampener_force_x();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the x dampener force of the spring of the spring array.		
			
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())	
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_dampener_force_y();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the y dampener force of the spring of the spring array.		
			
			Arguments:			

				my_spring    : The spring to retrieve from(created by spring_initialise())			
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_total_force_x();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the total force in the x direction of the spring array.
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_total_force_y();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the total force in the y direction of the spring array.
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_length_sub_x();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the number that is applied to the equation to set the rest length
				in the x direction.
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_length_sub_y();
			-------------------------------------------------------------------------------
			Description:
				
				Returns the number that is applied to the equation to set the rest length
				in the y direction.
				
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_angle();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the current angle of the spring from anchor to bob.
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================
			-------------------------------------------------------------------------------
			spring_get_length();
			-------------------------------------------------------------------------------
			Description:
			
				Returns the current length in pixels of the spring from anchor to bob.
			
			Arguments:
			
				my_spring    : The spring to retrieve from(created by spring_initialise())
				
			===============================================================================         */#endregion
										
/*			===============================================================================
			
										--Goup Three: Set--                                         */#region
										
/*			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_gravity_x();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set the gravity strength in the x direction. can be used in
				conjunction with spring_set_gravity_y() to adjust the direction the 
				spring gravitates towards. The number provided will act as a coordinate
				that is relative to the anchor (anchor is 0,0) of the spring. The spring
				will be pulled toward that coordinate.
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				grav         : the number to set the gravity to
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_gravity_y();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set the gravity strength in the y direction. can be used in
				conjunction with spring_set_gravity_x() to adjust the direction the 
				spring gravitates towards. The number provided will act as a coordinate
				that is relative to the anchor (anchor is 0,0) of the spring. The spring
				will be pulled toward that coordinate.			
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				grav         : The number to set the gravity to.			
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_dampener();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set the dampener strength of the spring. Higher dampeners will 
				wiggle less.
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				damp         : The number to set the dampener to.					
						
			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_rest_length();
			-------------------------------------------------------------------------------
			Description:
			
				The number to set the rest length of the spring in pixels. High gravities
				will appear to affect the rest length of a spring.
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				r_len        : The number (in pixels) to set the rest length of the
							   spring
						
			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_time_step();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set the timestep of the simulation. (how many steps the 
				simulation moves forward each frame). Adjust to your needs. 
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				t_step       : The speed to set the simulation.			
						
			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_mass();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set the mass of the bob. The higher the mass the more gravity will 
				affect the spring.
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				mass         : The mass to set the bob to.
						
			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_spring_strength();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set the strength of the spring. Higher strengths will be more solid.
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				strength     : The strength to set the spring to.

			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_angle();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set whether the spring should be constrained to a set angle. It
				accepts the angle in degrees and a bool describing whether or not the spring
				should be allowed to invert. the script automatically tells the calculate script
				to calculate for set angle. it is important to remove this function call
				if you would no longer like the spring to be constrained. 
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				angle        : The angle in degrees to set the spring to.
				
				inversion    : whether the spring should be allowed to invert or not.
						
			===============================================================================
			-------------------------------------------------------------------------------
			spring_set_debug_mode();
			-------------------------------------------------------------------------------
			Description:
			
				Used to set the debug mode of the spring. Can either be on(1) or off(0).
				Turning on debug mode tells the calculate script not to calculate special
				properties such as angle locks and length limits. This script was used
				for the creation of those systems and has no real value other than to 
				test their accuracy. If you set this to on(1) and set the debug argument of
				spring_draw() to one(1) it will show how the angle lock is calculated
				but will not calculate and lock to the angle. This is necessary as if
				you are calculating for the angle lock there is no way to see the information.
			
			Arguments:
			
				my_spring    : The spring to modify(created by spring_initialise())
				
				d_mode       : bool - turn debug mode off(0) or on(1);
						
			===============================================================================         */#endregion
										
/*			===============================================================================         
			
										--Group Four: Beta--                                        */#region
										
						//Note: These scripts aren't entirely useful   //
						//	    or well flushed out. use at own risk.  //
									  
/*			===============================================================================
			-------------------------------------------------------------------------------
			spring_calculate_1d_x();
			-------------------------------------------------------------------------------
			===============================================================================
			-------------------------------------------------------------------------------
			spring_calculate_1d_y();
			-------------------------------------------------------------------------------
			===============================================================================
			-------------------------------------------------------------------------------
			spring_apply_velocity();
			-------------------------------------------------------------------------------
			
			Description:
			
				Applies manual velocity to the spring.
			
			Arguments:
			
			Reason it is in Beta:
				
				I created this Script to try to add wind to tree branches and hair. I have not
				had enough time to refine it. It is fun to play with.
			
			===============================================================================
			-------------------------------------------------------------------------------
			spring_move_to(my_spring, new_bob_x, new_bob_y);                 *experimental*                
			-------------------------------------------------------------------------------
			Description:
			
				Changes location of spring array bob.
			
			Arguments:
			
			Reason it is in Beta:
				
				Adjusting the loaction of the bob manually is only useful in specific situations.
				Once the bob's location is set, the simulation can no longer adjust its location. 
				Calling this script before the calculate script will cause undesirable effects.
				I've included the script as I have found a few uses for it.(i.e. clicking and dragging
				the spring, upon release the simulation takes over again, think a certain game about 
				ornary birds and the method with which they take to the air).
			
			===============================================================================         */#endregion
										
/*			===============================================================================
																									*/#endregion
/*			----------------===========================================--------------------
			Section 4: End Note																		*/#region
/*			----------------===========================================--------------------
			For questions, comments, complaints, or suggestions please contact me at:
			
				DasWulfmanDev@gmail.com
			
			Also bug reporting! Any bugs and or oversights on my part should be reported in
			this way. I will always try to fix any problems that you may be having as soon 
			as I possibly can. Thank you.
																									*/#endregion
/*			----------------===========================================--------------------