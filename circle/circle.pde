float theta = 0;
float x;
float y;
float width = 20;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  float x = sin(theta);
  float y = - cos(theta);
  theta += 0.1;
  x *= width;
  y *= width;

  ellipse(x + 100, y + 100, 10, 10);  
}
