void setup()
{
  size(500, 500, P3D);
  smooth();
  face0.pos = new Vector(50, 150);
  face1.pos = new Vector(200, 150);
  
  font = createFont("Arial",16,true);
}

Face face0 = new Face();
Face face1 = new Face();
PFont font;
int faceWidth = 50;

void draw()
{  
  background(0);  
  face0.draw();
  fill(255);
  textFont(font, 16);
  text("Angle: " + degrees(face0.theta) ,10,50);
  
  face0.theta += 0.1f;
  if (face0.theta > TWO_PI)
  {
    face0.theta = 0.0f;
  }
  face1.draw();  
}
