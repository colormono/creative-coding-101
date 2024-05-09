PImage img;
int resolution = 20;

void setup() {
  size(400, 480);
  img = loadImage("gioconda.jpg");
}

void draw() {
  background(255);
  image(img, 0, 0, width, height);

  noFill();
  for (int x=0; x<width; x+=resolution) {
    for (int y=0; y<height; y+=resolution) {
      int ix = (int) map(x, 0, width, 0, img.width);
      int iy = (int) map(y, 0, height, 0, img.height);
      color pix = img.get(ix, iy);
      int b = floor(brightness(pix));
      
      fill(255);
      fill(b);
      rect(x, y, resolution, resolution);
      
      fill(0);
      textSize(10);
      text(b, x+2, y+10);
    }
  }
}

void mouseReleased(){
  saveFrame("img-######.png");
}
