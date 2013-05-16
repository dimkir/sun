float reduceGradually(float valToGraduallyReduce, float param, float param_min, float param_max){
  
   float reductionCoefficient;
   float paramValueInRange01 = map(param, param_min, param_max, 0, 1);
   
   reductionCoefficient = (float) Math.pow((double)paramValueInRange01, 11.0d);
   
   reductionCoefficient -=  1.0;
   
   //reductionCoefficient = paramValueInRange01;
   
   
   return valToGraduallyReduce * reductionCoefficient;
}
