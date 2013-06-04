class NircleSystem
{
    private ArrayList<Nircle> mNircles = new ArrayList<Nircle>();
    
    /**
    *
    */
    NircleSystem(int n){
       for(int i = 0 ; i < n ; i++){
          addNircle(); // adds at random location
       }
    }
    
    /**
    * Adds new Nircle with default paramters 
    *
    */
    private void addNircle(){
       mNircles.add( new Nircle() );
// new NoiseCircle(random(width), random(height));       
    }
    
    
    
    
    /**
    * Draws all the nircles
    */
    void draw(){
       for(int i = 0 ; i < mNircles.size() ; i++){
           mNircles.get(i).draw();
       }
    }
    
}
