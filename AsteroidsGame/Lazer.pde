class Lazer extends GameEntity
{
  float timeDelta = 1.0f / 60.0f;
  
  Lazer()
  {
    w = 5.0f;
    h = 5.0f;
    speed = 200.0f;
  }
  
  void update()
  {
    PVector velocity = look.get();
    velocity.mult(speed * timeDelta);
    position.add(velocity);
    
    if ((position.x > AsteroidsGame.instance().width) 
          || (position.x < 0)
          || (position.y > AsteroidsGame.instance().height)        
          || (position.y < 0))
  {
    alive = false;
  }
          
    
    look.x = sin(theta);
    look.y = -cos(theta);   
  }
  
  void draw()
  {
    stroke(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    scale(scaleF);
    
    line(0, - h / 2.0f, 0, h / 2.0f);
      
    popMatrix();        
  }
}
