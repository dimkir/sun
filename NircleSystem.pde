/**
* Implements system.
*/
class NircleSystem
{
    private ArrayList<Nircle> mNircles = new ArrayList<Nircle>();
    private int mSurfaceWidth, mSurfaceHeight; // hold params of the drawing surfaces.
    
    /**
    * I am passing vWidth and vHeight parameters explicitly not to have
    * implicit dependence on the size of the screen.
    */
    NircleSystem(int n, int vWidth, int vHeight){
       mSurfaceWidth = vWidth;
       mSurfaceHeight = vHeight;
       for(int i = 0 ; i < n ; i++){
          addRandomNircle(mSurfaceWidth, mSurfaceHeight); // adds at random location
       }
    }
    
    /**
    * Adds new random Nircle with default paramters 
    * 
    */
    private void addRandomNircle(int w, int h){
       mNircles.add( new Nircle(random(w), random(h), w , h ) );
// new NoiseCircle(random(width), random(height));       
    }
    
    
    
    
    /**
    * Draws all the nircles
    */
    void draw(){
       loadPixels();
       for(int i = 0 ; i < mNircles.size() ; i++){
           mNircles.get(i).drawPixels(pixels);
       }
       updatePixels();
    }
    
}
