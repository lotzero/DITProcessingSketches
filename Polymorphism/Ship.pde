class Ship extends GameEntity
{
  
  Ship()
  {
    pos.x = 100;
    pos.y = 200;
    
  }

  void update()
  {
    pos.x += 1; 
  }
  
  void draw()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    
    rect(-10, 20, 10, 20);
    
    popMatrix();
  }
}
