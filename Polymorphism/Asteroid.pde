class Asteroid extends GameEntity
{
  Asteroid()
  {
    pos.x = 300;
    pos.y = 300;
  }
  void update()
  {
    rot += 0.1f;
  }
  
  void draw()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    ellipse(0,0, 20, 10);    
    popMatrix();

  }
}
