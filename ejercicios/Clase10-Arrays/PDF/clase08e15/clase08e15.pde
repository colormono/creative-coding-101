float[] data = { 19.0, 40.0, 75.0, 76.0, 90.0 };
float[] halfData;

void setup() {
  halfData = halve(data); // Ejecutar la funcion halve()
  println(data[0], halfData[0]); // Imprime "19.0, 9.5"
  println(data[1], halfData[1]); // Imprime "40.0, 20.0"
  println(data[2], halfData[2]); // Imprime "75.0, 37.5"
  println(data[3], halfData[3]); // Imprime "76.0, 38.0"
  println(data[4], halfData[4]); // Imprime "90.0, 45.0"
}

float[] halve(float[] d) {
  float[] numbers = new float[d.length]; // Crear matriz nueva
  arrayCopy(d, numbers);
  for (int i = 0; i < numbers.length; i++) { // Para cada elemento
    numbers[i] = numbers[i] / 2.0; // dividir el valor por 2
  }
  return numbers; // Devolver la matriz nueva
}
