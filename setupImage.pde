PImage myBg;

// default scale when using parameterless setupImage();
final float C_SCALE_DEFAULT = 0.55;
// default image
final String C_IMAGE_MAIN = "space.jpg";

void setupImage(){
   setupImage(C_SCALE_DEFAULT); // init with default zoom
}

void setupImageFullScreen(){
   setupImage(width, height);
}


void setupImage(float vZoom){
   myBg = loadImage(C_IMAGE_MAIN);
   if ( vZoom != 1.0f){
     myBg.resize(int(myBg.width * vZoom), int(myBg.height * vZoom) );
   }
}

void setupImage(int w, int h){
   myBg = loadImage(C_IMAGE_MAIN);
   myBg.resize(w,h);
   //myBg.resize(width, height);  
}
