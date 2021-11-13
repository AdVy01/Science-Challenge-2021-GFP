String[] lines;
int[] values;

String getResult(String value) {
   //read();
   //getValues(lines);
   //return writeTestMsg(values);
   int an_pwr = Integer.valueOf(value);
   double pw = an_pwr / 1023.0 * 30.0;
   return "Analog val: " + an_pwr + "\t Pwr (uW) = " + pw;
}

//void read() {
//  lines = loadStrings("data.txt");
//}

//void getValues(String[] valuesStr) {
//  if (valuesStr.length > 0) {
//    values = new int[valuesStr.length];
//    for (int i = 0; i < valuesStr.length; i++) {
//      int value = Integer.valueOf(valuesStr[i]);
//      values[i] = value;
//    }
//  }
//}

//String writeTestMsg(int[] v) {
//  if (v.length > 0) {
//    String msg = "";
//    for (int i : v) {
//      double pwr = i / 1023.0 * 30.0;
//      msg += "Analog val: " + i + "\t Pwr (uW) = " + pwr + "\n";
//    }
//  }
//  return "";
//}
