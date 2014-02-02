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
    position.x = Steering.instance().width / 2;
    position.y = Steering.instance().height / 2;    
    drawVectors = true;
  }
  
  void update()
  {     
      elapsed += timeDelta;
      float newtons = 100.0f;
      if (Steering.checkKey('W') || Steering.checkKey('w'))
      {     
          force.add(PVector.mult(look, newtons));
      }
      
      if (Steering.checkKey('S') || Steering.checkKey('s'))
      {
          force.sub(PVector.mult(look, newtons));
      }
      if (Steering.checkKey('A') || Steering.checkKey('a'))
      {
        force.sub(PVector.mult(right, newtons));
      }    
      
      if (Steering.checkKey('D') || Steering.checkKey('d'))
      {
        force.add(PVector.mult(right, newtons));
      }
      
      if (Steering.checkKey(' ')  && elapsed > toPass)
      {
        Lazer lazer = new Lazer();
        lazer.position = position.get();
        PVector offset = look.get();
        offset.mult(20.0f);
        lazer.position.add(offset);
        lazer.theta = theta;
        
        Steering.instance().children.add(lazer);
        elapsed = 0.0f;
      }
      
      PVector acceleration = PVector.div(force, mass);
      velocity.add(PVector.mult(acceleration, timeDelta));
      position.add(PVector.mult(velocity, timeDelta));
      
      // Apply damping
      velocity.mult(0.99f);
      
      // Reset the force
      force.setMag(0);
      
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
            
      if (position.x > Steering.instance().width)
      {
        position.x = 0;
      }
      if (position.x < 0)
      {
        position.x = Steering.instance().width;
      }
      
      if (position.y > Steering.instance().height)
      {
        position.y = 0;
      }
      if (position.y < 0)
      {
        position.y = Steering.instance().height;
      }
      super.update();             
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
    float lineLength = 50.0f;
    
    popMatrix();
    Steering.instance().printText("Look: " + look.x + " " + look.y + " "+ look.z); 
    
    super.draw();    
  } 
}
