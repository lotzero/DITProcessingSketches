class Ship
{
  float x;
  float y;
  float w;
  float h;
  float theta;
  float spin = 0.01f;
  float scaleF = 1.0f;
  
  Ship()
  {
    x = 0;
    y = 0;
    w = 10;
    h = 10;
  }
  
  void update()
  { 
    theta += spin;
    x = x + 1;
  }
  
  void draw()
  {
    
    pushMatrix();
    translate(x, y);
    rotate(theta);
    scale(scaleF);
    float halfwidth, halfheight;
    halfwidth = w / 2.0f;
    halfheight = h / 2.0f;
    line(- halfwidth, halfheight, 0, - halfheight);
    line(halfwidth, halfheight, 0, - halfheight);
    
    line(- halfwidth, halfheight, 0, 0);
    line(halfwidth, halfheight, 0, 0);
    popMatrix();
  } 
}
