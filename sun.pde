
void setup() {
  size(displayWidth, displayHeight, P2D);
//  size(800, 600);
  x0 = width/2;
  y0 = height/2;
  setLineStroke();

  //frameRate(5);
  setupImage();
  setupValueLooper();
}


// t - parameters for the perlin noise!
float t2 = 3;
float dt2 = 0.01;

float x0, y0;

int MY_BLEND_MODE; // needs to be initialized in setup

void draw() {
//  background(30);
  background(0);
//blendMode(SCREEN);  
  image(myBg, 0, 0);
//  if ( true) return;
   blendMode(MY_BLEND_MODE);
  
  drawNoiseCircle(t2, x0, y0);
  t2 += dt2;
 // filter(BLUR);
  
}

void mousePressed(){
   
   MY_BLEND_MODE = valueLooper.getNextForever();
   println("Changed blend mode to: " + MY_BLEND_MODE + ": "+  valueLooper.getLastReturnedLabel());
   x0 = mouseX;
   y0 = mouseY;
}


final float C_AMPLITUDE = 80; // amplitude of radius noise
final float C_CURVE_INTENSITY = 6.5;
void drawNoiseCircle(float ttt, float x0, float y0) {

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

void setLineStroke()
{
  
  stroke(0x00ffd545);
  strokeWeight(3);  
}
