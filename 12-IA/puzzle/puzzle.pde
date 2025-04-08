import processing.svg.*;

// Configuración del lienzo
int canvasWidth = 800;
int canvasHeight = 600;
boolean recording = false;

// Configuración del rompecabezas
int puzzleRows = 4;
int puzzleCols = 6;
float marginX = 50;
float marginY = 50;
float pieceWidth;
float pieceHeight;
float knobSize = 15; // Tamaño del "nudo" de las piezas

// Color y estilo
color backgroundColor = color(255);
color outlineColor = color(0);
float strokeW = 2;

// Estados y controles
boolean showGrid = true;
boolean useRandomSeed = false;
int currentSeed = 0;

void setup() {
  size(800, 600);
  // Calcular tamaño de piezas basado en el tamaño del canvas y márgenes
  pieceWidth = (width - 2 * marginX) / puzzleCols;
  pieceHeight = (height - 2 * marginY) / puzzleRows;
  
  // Título de la ventana
  surface.setTitle("Generador de Siluetas de Rompecabezas");
  
  // Configuración general
  strokeWeight(strokeW);
  stroke(outlineColor);
  noFill();
  
  // Semilla aleatoria inicial
  currentSeed = (int)random(1000);
  randomSeed(currentSeed);
  noiseSeed(currentSeed);
}

void draw() {
  background(backgroundColor);
  
  if (recording) {
    // Iniciar grabación SVG
    beginRecord(SVG, "puzzle_" + puzzleRows + "x" + puzzleCols + "_" + currentSeed + ".svg");
    // Configurar nuevamente para el archivo SVG
    stroke(outlineColor);
    strokeWeight(strokeW);
    noFill();
  }
  
  // Dibujar las piezas del rompecabezas
  drawPuzzle();
  
  // Dibujar interfaz e información
  if (!recording) {
    drawInterface();
  }
  
  if (recording) {
    // Finalizar grabación SVG
    endRecord();
    recording = false;
    println("SVG guardado: puzzle_" + puzzleRows + "x" + puzzleCols + "_" + currentSeed + ".svg");
  }
}

void drawPuzzle() {
  // Usamos una matriz para almacenar información sobre los bordes
  // -1: borde concavo, 1: borde convexo, 0: borde recto (bordes exteriores)
  int[][] rightEdges = new int[puzzleRows][puzzleCols];
  int[][] bottomEdges = new int[puzzleRows][puzzleCols];
  
  // Inicializar los bordes si usamos aleatorios
  if (useRandomSeed) {
    randomSeed(currentSeed);
    
    // Generar configuración de bordes
    for (int row = 0; row < puzzleRows; row++) {
      for (int col = 0; col < puzzleCols; col++) {
        // El último borde a la derecha siempre es recto (0)
        if (col < puzzleCols - 1) {
          rightEdges[row][col] = random(1) > 0.5 ? 1 : -1;
        }
        
        // El último borde inferior siempre es recto (0)
        if (row < puzzleRows - 1) {
          bottomEdges[row][col] = random(1) > 0.5 ? 1 : -1;
        }
      }
    }
  } else {
    // Configuración determinista para un patrón más ordenado
    for (int row = 0; row < puzzleRows; row++) {
      for (int col = 0; col < puzzleCols; col++) {
        // El último borde a la derecha siempre es recto (0)
        if (col < puzzleCols - 1) {
          rightEdges[row][col] = (row + col) % 2 == 0 ? 1 : -1;
        }
        
        // El último borde inferior siempre es recto (0)
        if (row < puzzleRows - 1) {
          bottomEdges[row][col] = (row + col) % 2 == 0 ? -1 : 1;
        }
      }
    }
  }
  
  // Dibujar cada pieza
  for (int row = 0; row < puzzleRows; row++) {
    for (int col = 0; col < puzzleCols; col++) {
      float x = marginX + col * pieceWidth;
      float y = marginY + row * pieceHeight;
      
      // Dibujar la pieza con conexiones apropiadas
      drawPuzzlePiece(x, y, row, col, rightEdges, bottomEdges);
    }
  }
  
  // Dibujar el contorno exterior del rompecabezas
  if (showGrid) {
    stroke(outlineColor, 150);
    strokeWeight(strokeW * 2);
    rect(marginX, marginY, puzzleCols * pieceWidth, puzzleRows * pieceHeight);
  }
}

void drawPuzzlePiece(float x, float y, int row, int col, int[][] rightEdges, int[][] bottomEdges) {
  // Guardamos el estilo actual
  pushStyle();
  
  // Estilo de la pieza
  stroke(outlineColor);
  strokeWeight(strokeW);
  
  beginShape();
  
  // Esquina superior izquierda
  vertex(x, y);
  
  // Borde superior (considerando el borde de la pieza de arriba)
  if (row > 0 && bottomEdges[row-1][col] != 0) {
    int direction = -bottomEdges[row-1][col]; // Invertimos la dirección
    drawEdge(x, y, x + pieceWidth, y, direction, true);
  } else {
    // Borde recto para la primera fila
    vertex(x + pieceWidth, y);
  }
  
  // Esquina superior derecha
  // vertex(x + pieceWidth, y);
  
  // Borde derecho
  if (col < puzzleCols - 1 && rightEdges[row][col] != 0) {
    drawEdge(x + pieceWidth, y, x + pieceWidth, y + pieceHeight, rightEdges[row][col], false);
  } else {
    // Borde recto para la última columna
    vertex(x + pieceWidth, y + pieceHeight);
  }
  
  // Esquina inferior derecha
  // vertex(x + pieceWidth, y + pieceHeight);
  
  // Borde inferior
  if (row < puzzleRows - 1 && bottomEdges[row][col] != 0) {
    drawEdge(x + pieceWidth, y + pieceHeight, x, y + pieceHeight, bottomEdges[row][col], true);
  } else {
    // Borde recto para la última fila
    vertex(x, y + pieceHeight);
  }
  
  // Esquina inferior izquierda
  // vertex(x, y + pieceHeight);
  
  // Borde izquierdo (considerando el borde derecho de la pieza a la izquierda)
  if (col > 0 && rightEdges[row][col-1] != 0) {
    int direction = -rightEdges[row][col-1]; // Invertimos la dirección
    drawEdge(x, y + pieceHeight, x, y, direction, false);
  } else {
    // Borde recto para la primera columna
    vertex(x, y);
  }
  
  endShape(CLOSE);
  
  // Si estamos mostrando la cuadrícula, dibujamos números de piezas
  if (showGrid && !recording) {
    fill(150);
    textAlign(CENTER, CENTER);
    textSize(min(pieceWidth, pieceHeight) / 4);
    text((row * puzzleCols + col + 1), x + pieceWidth/2, y + pieceHeight/2);
    noFill();
  }
  
  // Restauramos el estilo
  popStyle();
}

void drawEdge(float x1, float y1, float x2, float y2, int direction, boolean isHorizontal) {
  // Punto medio entre los dos puntos
  float midX = (x1 + x2) / 2;
  float midY = (y1 + y2) / 2;
  
  // Calcula el punto de control para la conexión (nudo)
  float ctrlX, ctrlY;
  
  if (isHorizontal) {
    ctrlX = midX;
    ctrlY = midY + direction * knobSize;
    
    // Dibuja la curva de conexión
    vertex(x1, y1);
    bezierVertex(
      midX - knobSize, y1,
      midX - knobSize, ctrlY,
      ctrlX, ctrlY
    );
    bezierVertex(
      midX + knobSize, ctrlY,
      midX + knobSize, y2,
      x2, y2
    );
  } else {
    ctrlX = midX + direction * knobSize;
    ctrlY = midY;
    
    // Dibuja la curva de conexión
    vertex(x1, y1);
    bezierVertex(
      x1, midY - knobSize,
      ctrlX, midY - knobSize,
      ctrlX, ctrlY
    );
    bezierVertex(
      ctrlX, midY + knobSize,
      x2, midY + knobSize,
      x2, y2
    );
  }
}

void drawInterface() {
  // Panel de información
  fill(240);
  stroke(180);
  strokeWeight(1);
  rect(20, height - 110, width - 40, 90);
  
  // Información de controles
  fill(0);
  textAlign(LEFT);
  textSize(14);
  text("Controles:", 40, height - 90);
  text("S: Exportar SVG", 40, height - 70);
  text("↑/↓: Cambiar filas (" + puzzleRows + ")", 40, height - 50);
  text("←/→: Cambiar columnas (" + puzzleCols + ")", 40, height - 30);
  
  text("G: Mostrar/ocultar guía", width/2, height - 70);
  text("R: Regenerar aleatorio (Semilla: " + currentSeed + ")", width/2, height - 50);
  text("T: Cambiar entre patrón y aleatorio", width/2, height - 30);
  
  // Restaurar estilo
  noFill();
  stroke(outlineColor);
  strokeWeight(strokeW);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    recording = true;
  } else if (key == 'g' || key == 'G') {
    showGrid = !showGrid;
  } else if (key == 'r' || key == 'R') {
    currentSeed = (int)random(1000);
    randomSeed(currentSeed);
    noiseSeed(currentSeed);
  } else if (key == 't' || key == 'T') {
    useRandomSeed = !useRandomSeed;
  } else if (keyCode == UP) {
    puzzleRows = constrain(puzzleRows + 1, 2, 10);
    pieceHeight = (height - 2 * marginY) / puzzleRows;
  } else if (keyCode == DOWN) {
    puzzleRows = constrain(puzzleRows - 1, 2, 10);
    pieceHeight = (height - 2 * marginY) / puzzleRows;
  } else if (keyCode == RIGHT) {
    puzzleCols = constrain(puzzleCols + 1, 2, 12);
    pieceWidth = (width - 2 * marginX) / puzzleCols;
  } else if (keyCode == LEFT) {
    puzzleCols = constrain(puzzleCols - 1, 2, 12);
    pieceWidth = (width - 2 * marginX) / puzzleCols;
  }
}
