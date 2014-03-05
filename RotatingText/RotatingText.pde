void setup()
{
  size(500, 500, P3D);
  String[] fontList = PFont.list();
  println(fontList);
  font = createFont("Arial", 32);
  
  x = width / 2;
  y = height / 2;
  
}

PFont font;
float x;
float y;


void draw()
{
  pushMatrix();
  rotate(0.5f, 1.0f, 0.0f, 0.0f);  
  background(0);
  stroke(255);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(font);
  text("Hello world", x, y);
  y = y  - 1;
  popMatrix();
}
