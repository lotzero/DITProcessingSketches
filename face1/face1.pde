void setup()
{
  size(800,600);
  stroke(255);
  fill(0);
  background(0);
}

void drawFace(int x, int y, int red, int green, int blue, boolean smile)    
{
  stroke(red, green, blue);
  ellipse(x + 25, y + 25, 50, 50);
  // The eyes and nose    
  ellipse(x + 15, y + 10, 4, 4);
  ellipse(x + 35, y + 10, 4, 4);
  ellipse(x + 25, y + 25, 4, 4);    

  // The mouth
  line(x + 20, y + 38, x + 30, y + 38);
  if (smile)
  {    
    // Draw an upturned mouth
    line(x + 20, y + 38, x + 18, y + 35);
    line(x + 30, y + 38, x + 32, y + 35);
  }
  else
  {
    // Draw a downturned mouth
    line(x + 20, y + 38, x + 18, y + 41);
    line(x + 30, y + 38, x + 32, y + 41);
  }
}


void draw()
{
  boolean smile = false;
  for (int x = 0 ; x< width ; x += 50)
  {
    smile = ! smile;
    drawFace(x,100, 255, 255, 255, smile);
  }
}
