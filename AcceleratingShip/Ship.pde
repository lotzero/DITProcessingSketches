class Ship extends GameEntity
{
  PVector acceleration = new PVector(10, 0, 0);
  
  void update()
  {
    velocity.add(PVector.mult(acceleration, timeDelta));
    position.add(PVector.mult(velocity, timeDelta));
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
