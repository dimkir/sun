ValueLooper<Integer> valueLooper = new BlendModeValueLooper();
BgImage bgImage;
NircleSystem nSystem;
final int C_RANDOM_NC_COUNT = 1;

void setup() {
  size(displayWidth, displayHeight);
//  size(800, 600);
 
  //frameRate(5);
  //setupImage();        // loads image (& scales it, to scale defined as constant)
  bgImage = new BgImage();
 // setupValueLooper();  // just initializes value looper with available blend modes
  
  nSystem = new NircleSystem(C_RANDOM_NC_COUNT);
  


}

// the blend mode for blending circle on top of image
int MY_BLEND_MODE; // needs to be initialized in setup

void draw() {
//  background(30);
  background(0);
//blendMode(SCREEN);  
  bgImage.draw();
//  if ( true) return;
   blendMode(MY_BLEND_MODE);
  
  nSystem.draw();
//  noiseCircle.drawAt(x0, y0);

 // filter(BLUR);
    displayFrameRate(); 
}

void displayFrameRate(){
    fill(255);
    text("frameRate: " + int(frameRate), 10, 10);
}

void mousePressed(){
   
   MY_BLEND_MODE = valueLooper.getNextForever();
   println("Changed blend mode to: " + MY_BLEND_MODE + ": "+  valueLooper.getLastReturnedLabel());
}
