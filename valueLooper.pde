class ValueLooper<T> 
{
   private T[] mHolder;
   private int pointer = -1; 
   private int lastReturnedPointer = -1; 
   private String[] mLabels;  // if empty - no labels are there
   
   
   void add(T[] values){
      if ( values == null || values.length == 0 ){
         throw new IllegalArgumentException("Should be valid arrays");
      }
      mHolder = values;
      pointer = 0;
   }
   
   
   void addLabels(String[] labels){
      // reset labels if null
          if ( labels == null ){
             mLabels = null;
          }
          

      // verify that array lengths match          
          if ( labels.length != mHolder.length){
             throw new IllegalArgumentException("Only same lenght as elements is allowed: should be: " + mHolder.length + " received: "+ labels.length);
          }
      
      
      // save labels
         
          mLabels = labels;
      
      
   }
   
   
   T getNextForever(){
      
      return mHolder[nextIdForever()];
      
   }
   
   
   int nextIdForever(){
      lastReturnedPointer = pointer;
      pointer++;
      pointer = pointer % mHolder.length;
      return lastReturnedPointer;
   }
   
   String getLastReturnedLabel(){
      return mLabels[lastReturnedPointer];
   }
   
}
