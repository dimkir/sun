/*
  This encapsulates noise circle logic.
  Dependencies:
   implicitly is dependent on keyPress
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
    
    private  PImage mDot;
    
    
    /**
    * These two are meant for keeping dimensions of the drawing surface. This way we can use pixels[] array
    * to quickly plot the points.
    */
    private int mWidth, mHeight; 
    
 
  /**
  * Inits nircle with (X,Y) position and the width and height of surface.
  * Incuim vWidth and vHeight are only necessary for quickly plotting pixels through pixels[] array. (int[] mPixelz)
  */
  Nircle(float vX, float vY, int vWidth, int vHeight){
     mX = vX;
     mY = vY;
     mWidth = vWidth;
     mHeight = vHeight;
     onInit();
  }
  
  /**
  * Is called by constrcutors to init vars common to all constructors.
  */
  private void onInit(){
     mDot = loadImage("dot.png");
  }
   
   
  /**
  * Draws WHOLE NIRCLE but via pixels array
  */
  void drawPixels(color[] pixelz){
      mPixelz = pixelz;
      drawAt(mX, mY);
      mPixelz = null;
  }
  private color[] mPixelz = null;  // for nirclePoint - if mPixelz isn't null - it means it should be drawn with mPixelz.

  /**
  * This is delegate which is plotting point ( can be via point or via pixelz array)
  */
  void nirclePoint(float xx, float yy){
     if ( mPixelz != null ){
         int ixx = (int) xx;
         int iyy = (int) yy;
         int pixelIndex = iyy * mWidth + ixx;
         if ( pixelIndex < 0  || pixelIndex >= mPixelz.length ){
              // we just don't plot pixels outside of range
              // println("Pixel index is out of bounds: " + pixelIndex + " pixel array size: " + mPixelz.length);
         }
         else{
           mPixelz[pixelIndex] = #FFFFFF;
         } 
     }
     else{
        // draw with regualr point
        point(xx, yy);
     }
     
     
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
              setLineStroke();
              //point(x0+ x, y0 + y);
              spot(x0 + x , y0 + y);
            }
            else {
              setLineStroke();
              //line(x0, y0, x0 + x, y0 + y);
              nirclePoint(x0+ x, y0 + y);
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
    fill(0x00ffd545);
    stroke(0x00ffd545);
    strokeWeight(1);  
  }  
  
  
  void spot(float xx, float yy){
     image(mDot, xx, yy);
  }
}
