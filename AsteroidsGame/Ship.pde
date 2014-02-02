class Ship extends GameEntity
{  
  float spin = 0.1f;
  float fireRate = 5.0f;
  float toPass = 1.0f / fireRate;
  float elapsed = toPass;
 
  Ship()
  {
    w = 30;
    h = 30;
    position.x = AsteroidsGame.instance().width / 2;
    position.y = AsteroidsGame.instance().height / 2;    
  }
  
  void update()
  {     
      elapsed += timeDelta;
      velocity = look.get();
      velocity.mult(speed * timeDelta);
      if (AsteroidsGame.checkKey('W') || AsteroidsGame.checkKey('w'))
      {     
          position.add(velocity);
      }
      
      if (AsteroidsGame.checkKey('S') || AsteroidsGame.checkKey('s'))
      {
          position.sub(velocity);
      }
      if (AsteroidsGame.checkKey('A') || AsteroidsGame.checkKey('a'))
      {
        theta -= spin;
      }    
      
      if (AsteroidsGame.checkKey('D') || AsteroidsGame.checkKey('d'))
      {
        theta += spin;
      }
      
      if (AsteroidsGame.checkKey(' ')  && elapsed > toPass)
      {
        Lazer lazer = new Lazer();
        lazer.position = position.get();
        PVector offset = look.get();
        offset.mult(20.0f);
        lazer.position.add(offset);
        lazer.theta = theta;
        
        AsteroidsGame.instance().children.add(lazer);
        elapsed = 0.0f;
      }
            
      if (position.x > AsteroidsGame.instance().width)
      {
        position.x = 0;
      }
      if (position.x < 0)
      {
        position.x = AsteroidsGame.instance().width;
      }
      
      if (position.y > AsteroidsGame.instance().height)
      {
        position.y = 0;
      }
      if (position.y < 0)
      {
        position.y = AsteroidsGame.instance().height;
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
