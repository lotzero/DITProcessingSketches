class Particle extends GameEntity
{
  PVector spawnPoint;
  PVector gravity = new PVector(0, 9.8);
  
  Particle(float x, float y)
  {
    spawnPoint = new PVector(x, y);
    reset();
  }
  
  void reset()
  {
    position = spawnPoint.get();
    velocity = new PVector(random(-20, 20), random(-80, -50));
  }
  
  void update()
  {
    velocity = PVector.add(velocity, PVector.mult(gravity, timeDelta));
    position = PVector.add(position, PVector.mult(velocity, timeDelta));
    
    if (velocity.mag() > 0.001f)
    {
      look = velocity.get();
      look.normalize();        
      theta = acos(PVector.dot(basis, look));
      if (look.x < 0)
      {
          theta *= -1;
      }
      // Alternatively use this..
      //theta = look.heading() + HALF_PI;
    }    
      
    if (position.y > height)
    {
      reset();
    }
  }
  
  void draw()
  {
    stroke(255);
    pushMatrix();
    translate(position.x, position.y);    
    rotate(theta);    
    line(0, -5, 0, 5);
    popMatrix();
  }
  
}


