class Ship extends GameComponent
{
  float rot;
  
  void update()
  {
  }
  
  void draw()
  {
    pushMatrix();
    translate(x, y);
    rotate(rot);
    stroke(r, g, b);
    line(-radius, radius, 0, -radius);
    line(radius, radius, 0, -radius);
    line(-radius, radius, 0, 0);
    line(radius, radius, 0, 0);
    
    popMatrix();
  }

}
