/*
  This encapsulates noise circle logic.
*/
class Nircle
{
    
    // variables to hold default positions
    private float mX, mY;  
    
    // t - parameters for the perlin noise!
    private float t2 = 3;
    private float dt2 = 0.01;
  
  
    private final float C_AMPLITUDE = 80; // amplitude of radius noise
    private final float C_CURVE_INTENSITY = 6.5;
    
  /*
    Defines noise circle at position (0,0). 
    This constructor is to be used if you want to later draw NC via drawAt() method
  */
  Nircle(){
     // default values of mX and mY are (0,0) anyways.
  }
  
  Nircle(float vX, float vY){
     mX = vX;
     mY = vY;
  }
   
  void draw(){
     drawAt(mX, mY);
  } 

  void drawAt(float xx, float yy){
     drawNoiseCircle(t2, xx, yy);
     
     t2 += dt2;        
  }    
    
  private void drawNoiseCircle(float ttt, float x0, float y0) {
          float angle = 0;
          float angle_d = 0.01;
          float r = 100;
          float x, y;
        
          float firstRadius = -1;
          float deltaFromFirst =0;
          while ( angle < TAU) {
            float dr = 0;
            float radius;
            if ( firstRadius > 0 ) {
              // we know first radius and we have something to 'move towards'
              dr = C_AMPLITUDE * noise(angle * C_CURVE_INTENSITY, ttt);
              dr = reduceGradually(dr-deltaFromFirst, angle, 0, TAU);
              //          radius = r + dr;
              radius = firstRadius + dr;
            }
            else {
              // calculating first radius
              // we don't know first radius, make first calculation and make delta??
              dr = C_AMPLITUDE * noise(angle *C_CURVE_INTENSITY, ttt);
              //dr = reduceGradually(dr, angle, 0, TAU);
              radius = r + dr;
              deltaFromFirst = dr;
              firstRadius = radius;
            }
        
        
        
            x = radius * cos(angle);
            y = radius * sin(angle);
        
            if ( keyPressed) {
              point(x0+ x, y0 + y);
            }
            else {
              setLineStroke();
              line(x0, y0, x0 + x, y0 + y);
            }
        
        
            angle += angle_d;
          }// while
          noStroke();
          fill(0x55ecff1b);
          //ellipse(x0, y0, r, r);
          
   
  }
  
  /**
  * Sets stroke weight and stroke color.
  */
  void setLineStroke(){
    stroke(0x00ffd545);
    strokeWeight(3);  
  }  
}
