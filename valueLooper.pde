/*
  This is convenience class, which allows to 'loop' through an  array of values.
  To use it:
   1) init ValueLooper with some values (let's say blend modes)
   
           ValueLooper<Integer> valLooper = new ValueLooper<>();
           
           valLooper.add(new Integer[]  { BLEND, ADD, SUBTRACT } );
           
           // if you want to query 'aliases' you can add String[] of 'labels' (of same size)
           valLooper.addLabels(new String[] { "BLEND" , "ADD label", "SUBTRACT this" });
       
       
   2) ValueLooper is ready to loop through the values, just call 'T getNextForever()' to do that.
           int myNextInt = valLooper.getNextForever();
           // you can use the integer.
           // if you want to get the label for the last returned value call
           String myNextIntLabel = valLooper.getLastReturnedLabel();
  
*/
class ValueLooper<T> 
{
   private T[] mHolder;
   private int pointer = -1; 
   private int lastReturnedPointer = -1; 
   private String[] mLabels;  // if empty - no labels are there
   
   
   // TODO: should I make a defensive copy here ? 
   // because it seems that this array is going to be mutable and it may result in a crash, may someone modify it
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
   
   
   private int nextIdForever(){
      lastReturnedPointer = pointer;
      pointer++;
      pointer = pointer % mHolder.length;
      return lastReturnedPointer;
   }
   
   String getLastReturnedLabel(){
      return mLabels[lastReturnedPointer];
   }
   
}
