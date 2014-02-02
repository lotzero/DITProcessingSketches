void setup()
{
  size(500, 500);
}

int steps = 40;
int step = 0;
float radius = 100;
  
void draw()
{
  //background(0);
  float thetaInc = TWO_PI / (float) steps;
  float centX, centY;
  centX = width / 2;
  centY = height / 2;
  float theta = (thetaInc * (float)step);
  float x = sin(theta) * radius;
  float y = -cos(theta) * radius;
  radius --;
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  ellipse(x + centX, y + centY, radius, radius);
  step ++;
}

