class BlendModeValueLooper extends ValueLooper<Integer>
{
      BlendModeValueLooper(){
         setupValueLooper(this);
      }     
  
      /**
      * This method just defines all the things.
      */
      protected void setupValueLooper(ValueLooper<Integer> valueLooper){
//         valueLooper = new ValueLooper<Integer>();
         valueLooper.add(new Integer[] 
         { BLEND, ADD, SUBTRACT, DARKEST, LIGHTEST, DIFFERENCE, EXCLUSION, MULTIPLY, SCREEN, REPLACE} 
                                   );
         valueLooper.addLabels(new String[]
           { "BLEND", "ADD", "SUBTRACT", "DARKEST", "LIGHTEST", "DIFFERENCE", "EXCLUSION", "MULTIPLY", "SCREEN", "REPLACE"}
         );
         MY_BLEND_MODE = valueLooper.getNextForever();
      }   
}
