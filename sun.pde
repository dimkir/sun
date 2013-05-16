
void setup() {
  size(displayWidth, displayHeight, P2D);
//  size(800, 600);
  x0 = width/2;
  y0 = height/2;
  setLineStroke();  // sets color and strokeWeight

  //frameRate(5);
  //setupImage();        // loads image (& scales it, to scale defined as constant)
  setupImageFullScreen();
  setupValueLooper();  // just initializes value looper with available blend modes
  
  // setup noise circle
  noiseCircle = new NoiseCircle();
  
  // setup random noise circles
  randomNoiseCircles = new NoiseCircle[C_RANDOM_NC_COUNT];
  for(int i =0  ; i < C_RANDOM_NC_COUNT; i++){
     randomNoiseCircles[i] = new NoiseCircle(random(width), random(height));
  }
}

final int C_RANDOM_NC_COUNT = 10;
NoiseCircle[] randomNoiseCircles;
NoiseCircle noiseCircle;

// noise circle drawing position
float x0, y0;

// the blend mode for blending circle on top of image
int MY_BLEND_MODE; // needs to be initialized in setup

void drawRandomNC(){
   for(int i = 0; i < randomNoiseCircles.length ; i++){
      randomNoiseCircles[i].draw();
   }
}

void draw() {
//  background(30);
  background(0);
//blendMode(SCREEN);  
  image(myBg, 0, 0);
//  if ( true) return;
   blendMode(MY_BLEND_MODE);
  
  noiseCircle.drawAt(x0, y0);

   drawRandomNC();
 // filter(BLUR);
  
}

void mousePressed(){
   
   MY_BLEND_MODE = valueLooper.getNextForever();
   println("Changed blend mode to: " + MY_BLEND_MODE + ": "+  valueLooper.getLastReturnedLabel());
   x0 = mouseX;
   y0 = mouseY;
}

void setLineStroke()
{
  
  stroke(0x00ffd545);
  strokeWeight(3);  
}
