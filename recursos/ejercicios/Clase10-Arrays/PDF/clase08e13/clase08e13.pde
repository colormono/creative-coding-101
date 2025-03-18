String[] norte = { "Jujuy", "Salta", "Tucuman" };
String[] sur = { "Neuquen", "Chubut", "Santa Cruz" };

arrayCopy(norte, sur); // Copiar de matriz norte a matriz sur
printArray(sur); // Imprime [0] "Jujuy", [1] "Salta", [2] "Tucuman"
println();

String[] este = { "Misiones", "Corrientes", "Buenos Aires" };
String[] oeste = new String[este.length]; // Crear matriz nueva

arrayCopy(este, oeste); // Copiar de matriz este a matriz oeste
printArray(oeste); // Imprime [0] "Misiones", [1] "Corrientes", [2] "Buenos Aires"
