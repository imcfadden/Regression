
float calcMean(float[] data) {
  float mean;
  float sum=0;
  for (int i=0; i < data.length; i++) {
    sum=sum+data[i];
  }
  mean=sum/data.length;
  return mean;
}
float[] calcValues(float[] inputX, float[] inputY) {
  float[] values = new float[3];
  float[] inter = new float[inputX.length];
  float len=inputX.length;
  // values[0] === Sxx
  // values[1] === Syy
  // values[2] === Sxy
  // values[3] === lny
  // values[4] === avgX
  values[4]=calcMean(inputX);
  for (int i=0; i<inputX.length; i++) {
    inter[3]= inter[3]+(log(inputY[i]));
    inter[0]=inter[0]+(inputX[i]-values[4]);
  }
  values[3]=inter[3]/len;
  values[0]=(inter[0]*inter[0])/len;
  for (int j=0; j<inputX.length; j++) {
    inter[1]=inter[1]+(log(inputY[j])-values[3]);
    inter[2]=inter[2]+((inputX[j]-values[4])*(log(inputY[j])-values[3]));
  }
  values[1]=(inter[1]*inter[1])/len;
  values[2]=inter[2]/len;
  return values;
}
float calcSum(float[] data) {
  float sum=0;
  for (int i=0; i<data.length; i++) {
    sum=sum+data[i];
  }
  return sum;
}
float calcA(float[] values) {
  float A=0;
  // values[0] === Sxx
  // values[1] === Syy
  // values[2] === Sxy
  // values[3] === lny
  // values[4] === avgX
  float B = calcB(values);
    float e=exp(1);
float exp = values[3]-(values[4]*log(B));
A= pow(e,exp);
  


  return A;
}
float calcB(float[] values) {
  float B=0;
  float e=exp(1);
  float exp = values[2]/values[0];
  B=pow(e,exp);
  
  return B;
}
