PImage myBg;

final float C_SCALE = 0.55;

void setupImage(){
   myBg = loadImage("space.jpg");
   myBg.resize(int(myBg.width * C_SCALE), int(myBg.height * C_SCALE) );
   //myBg.resize(width, height);
}
