#include "colors.inc" 
#include "textures.inc" 

global_settings {
  assumed_gamma 1.0
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

light_source { <9,10,-6> color 1.5}

plane
{
  y,-1 
  pigment {checker White Orange filter 0.4} 
  // simply the bacground floor
  finish {diffuse .7 ambient 0.5}
  // diffuse is the amount of direct light applied.
}

// create the dice object
#declare Dice = difference
{
    superellipsoid
    {
    <0.15,0.15> // the shape of the dice
    // x, y = how close it is to a sphere basically, use both to smooth edges
        texture
        {
         pigment {color White filter 0.4  }
      
        finish
        {
            ambient 0.2
            diffuse 0.7 // the light on the dice, how dark or light it looks
            specular 0.6
            roughness 0.01
      } 
    }
  }
union
{
    #local R = 0.15; // radius of the spheres
    #local D = 0.40; // distence between the spheres, on the faces  
    #local H = 1.00; // distence between the center of the sphere and the face
    #local S = 0.7;  // indenting the sphere
    
    sphere
    { // 1
        0,R*1.75 // center, radius
        scale <1,S,1>
        translate H*y  
        
        texture
        { // 1 is colored red
            pigment {Red}
            finish
            {
                specular 0.5
                roughness 0.1
            }
        }// end texture
    }// end sphere  
    union
    {  // 2                   <x,y,z>
        sphere {0,R translate <D,0,D>}
        sphere {0,R translate <-D,0,-D>}
        scale <1,S,1> // makes it like a squashed sphere, small over the y-axis(s)
        translate H*y
        rotate -90*x 
    } 
    union {  // 3
      sphere {0,R } // no translations as it is in the middle of the face
      sphere {0,R translate <D,0,D>}
      sphere {0,R translate <-D,0,-D>}
      scale <1,S,1>
      translate H*y
      rotate -90*z 
    } 
    union {  // 4
      sphere {0,R translate <D,0,D>}
      sphere {0,R translate <D,0,-D>}
      sphere {0,R translate <-D,0,D>}
      sphere {0,R translate <-D,0,-D>}
      scale <1,S,1>
      translate H*y
      rotate 90*z 
    } 
    union {  // 5
      sphere {0,R }
      sphere {0,R translate <D,0,D>}
      sphere {0,R translate <D,0,-D>}
      sphere {0,R translate <-D,0,D>}
      sphere {0,R translate <-D,0,-D>}
      scale <1,S,1>
      translate H*y
      rotate 90*x 
    } 
    union {  // 6
      sphere {0,R translate <D,0,D>}
      sphere {0,R translate <D,0,0>}
      sphere {0,R translate <D,0,-D>}
      sphere {0,R translate <-D,0,D>}
      sphere {0,R translate <-D,0,0>}
      sphere {0,R translate <-D,0,-D>}
      scale <1,S,1>
      translate H*y
      rotate 180*x 
    } 
    texture { // coloring it
      pigment {Black}
      finish {specular 0.5 roughness 0.1}
    }
  }  
}
// create the dice object
object {Dice
      
       rotate<0,-90*clock,0>    
    rotate <0, 1,-clock*360>
    translate <-pi, .5, .9>
    translate <.7, .35, .3>}

object {Dice 
  rotate<0,-90*clock,0>    
    rotate <0, 1,clock*360>
    translate <-.005, .35, -.4>
        }     
        object {Dice 
  rotate<0,-90*clock,0>    
    rotate <0, 1,-clock*360>
    translate <2, .35, 1.8>
        }

camera
{
    location  <3,5, -7>
    look_at <0,0,0>
    angle 45 // horizontal viewing angle 
}

                     