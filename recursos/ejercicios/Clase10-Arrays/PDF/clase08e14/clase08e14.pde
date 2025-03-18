float[] data = { 19.0, 40.0, 75.0, 76.0, 90.0 };

void setup() {
  halve(data);
  println(data[0]); // Imprime "9.5"
  println(data[1]); // Imprime "20.0"
  println(data[2]); // Imprime "37.5"
  println(data[3]); // Imprime "38.0"
  println(data[4]); // Imprime "45.0"
}
void halve(float[] d) {
  // Para cada elemento de la matriz,
  for (int i = 0; i < d.length; i++) {
    d[i] = d[i] / 2.0; // dividir el valor por 2
  }
}
