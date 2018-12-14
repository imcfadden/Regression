
void setup() {
  //Parsing and converting data to floating point numbers
  String[] o_data = loadStrings("data.txt"); 

  //String[] s_x_data = new String[len];
  //String[] s_y_data = new String[len];
  String[] s_x_data = split(o_data[0], ',');
  String[] s_y_data=split(o_data[1], ',');
  int len=s_x_data.length;
  float[] f_x_data = new float[len];
  float[] f_y_data = new float[len];
  for (int i=0; i<len; i++) {
    f_x_data[i]=float(s_x_data[i]);
    f_y_data[i]=float(s_y_data[i]);
  }
  
  
  
  
}
