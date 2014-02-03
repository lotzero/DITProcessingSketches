class Ship extends GameEntity
{
  
  void update()
  {
    float speed = 100.0f;
    PVector toMouse = new PVector(mouseX, mouseY);
    toMouse.sub(position);
    
    if (toMouse.mag() > 0.1f)
    {
      toMouse.normalize();  
      position.add(PVector.mult(toMouse, speed * timeDelta));    
    }
    
    theta = atan(toMouse.x / -toMouse.y);
    
    if (toMouse.y > 0)
    {
      theta += PI;
    }
   
    super.update();   
  }
  
  void draw()
  {
      stroke(255);
      pushMatrix();
      translate(position.x, position.y);
      rotate(theta);
      line(-10, +10, 0, -10);
      line(+10, +10, 0, -10);
      line(-10, +10, 0, 0);
      line(+10, +10, 0, 0);    
      popMatrix();  
  }
}
