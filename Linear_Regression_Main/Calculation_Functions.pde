float calculateSD(float[] data) {
  float dataMean=calculateMean(data);
  float[] data_2= new float[data.length];
  float sd;
  for (int i=0; i < data.length; i++) {
    data_2[i]=data[i]-dataMean;
    data_2[i]=data_2[i]*data_2[i];
  }
  sd=sqrt(calculateMean(data_2));
  return(sd);
}
float calculateMean(float[] data) {
  float mean;
  float sum=0;
  for (int i=0; i < data.length; i++) {
    sum=sum+data[i];
  }
  mean=sum/data.length;
  return mean;
}
float[] calcValues(float[] inputX, float[] inputY) {
  float[] values = new float[6];
  float[] inter = new float[inputX.length];
  // values[0] === Sum of all X values
  // values[1] === Sum of all Y values
  // values[2] === Sum of all X*Y values
  // values[3] === Sum of all X^2 values
  // values[4] === Sum of all Y^2 values
  // values[5] === Total number of values
  values[0]=calcSum(inputX);
  values[1]=calcSum(inputY);
  for (int i=0; i<inputX.length; i++) {
    inter[i]=inputX[i]*inputY[i];
  }
  values[2]=calcSum(inter);
  for (int j=0; j<inputX.length; j++) {
    inter[j]=inputX[j]*inputX[j];
  }
  values[3]=calcSum(inter);
  for (int k=0; k<inputX.length; k++) {
    inter[k]=inputY[k]*inputY[k];
  }
  values[4]=calcSum(inter);
  values[5]=inputX.length;
  return values;
}
float calcSum(float[] data) {
  float sum=0;
  for (int i=0; i<data.length; i++) {
    sum=sum+data[i];
  }
  return sum;
}
float calcSlope(float[] values) {
  float slope=0;
  slope=((values[5]*values[2])-(values[0]*values[1]))/((values[5]*values[3])-(values[0]*values[0]));
  return slope;
}
float calcXInt(float[] values) {
  float XInt=0;
  XInt=((values[3]*values[1])-(values[0]*values[2]))/((values[5]*values[3])-(values[0]*values[0]));
  return XInt;
}
float calcCovariance(float[] xInput, float[] yInput, float len) {
  float covariance=0;
  float sum=0;
  float avgX= calculateMean(xInput);
  float avgY= calculateMean(yInput);

  for (int i=0; i<len-1; i++) {
    sum=sum+((xInput[i]-avgX)*(yInput[i]-avgY));
    //covariance=sum/(len-1);
  }
  covariance=sum/(len-1);
  println(sum);
  return covariance;
}
