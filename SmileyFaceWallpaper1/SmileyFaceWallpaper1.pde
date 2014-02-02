void setup()
{
  size(600, 600);
  smooth();
  
}

int faceWidth = 50;

float add(float a, float b)
{
  return a + b;
}

float distance(float x1, float y1, float x2, float y2)
{
  return sqrt(pow(x2 - x1, 2.0f) + pow(y2 - y1, 2.0f));
}

void drawFace(int x, int y, boolean happy)
{  
   
    if (happy)
    {
      stroke(255, 255, 0);
    }
    else
    {
      stroke(0, 255, 255);
    }
    fill(0);
    ellipse(x, y, 50, 50);
    ellipse(x-10, y-15, 5,5);
    ellipse(x+10, y-15, 5,5);
    ellipse(x,y,5,5);
    line(x-10, y+10, x+10, y+10);
    if (happy)
    {
      line(x-10, y+10, x-15, y+5);
      line(x+10, y+10, x+15, y+5);
    }
    else
    {
      line(x-10, y+10, x-15, y+15);
      line(x+10, y+10, x+15, y+15);
    }
}

void draw()
{
  background(0);
  int halfFaceWidth = faceWidth / 2;
  boolean happy = true;
  int halfWidth, halfHeight;
  halfWidth = width / 2;
  halfHeight = height / 2;
  
  for (int x = (faceWidth / 2) ; x <= width ; x += faceWidth)
  {
    for (int y = (faceWidth / 2) ; y <= width ; y += faceWidth)
    {  
      drawFace(x, y, happy);
      happy = ! happy;
    }
    happy = ! happy;
  }
}

