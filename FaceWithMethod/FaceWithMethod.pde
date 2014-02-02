void setup()
{
  size(500, 500);
}

int faceWidth = 50;
int halfFaceWidth = faceWidth / 2;



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
  ellipse(x, y, 50, 50);
  ellipse(x - 10, y - 15, 5, 5);
  ellipse(x + 10, y - 15, 5, 5);
  ellipse(x, y, 5, 5);
  line(x-10, y+10, x + 10, y + 10);
  if (happy)
  {
    
    line(x-10, y + 10, x - 15, y + 5);
    line(x+10, y + 10, x + 15, y + 5); 
  }
  else
  {
    line(x-10, y + 10, x - 15, y + 15);
    line(x+10, y + 10, x + 15, y + 15);
  }
}

void draw()
{

  sqrt(100.0f);  
  
  boolean happy = true;
  background(0);
  fill(0);
  drawFace(110, 110, false);
  for (int y = halfFaceWidth ; y < height ; y += faceWidth)
  {
    for (int x = halfFaceWidth; x < width ; x += faceWidth)
    {
      
      drawFace(x, y, happy);
      happy = !happy;
    }
    happy = !happy; 
  }
}
