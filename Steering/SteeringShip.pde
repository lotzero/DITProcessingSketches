class SteeringShip extends GameEntity
{
  
  float maxSpeed = 100;
  float maxForce = 50;
  PVector seekPos;
  Path path;

   SteeringShip()
   {
      w = 30;
      h = 30;
      position.x = Steering.instance().width / 2;
      position.y = Steering.instance().height / 2;    
      seekPos = new PVector();
      path = new Path();
      Steering.instance().children.add(path);
      drawVectors = true;
   }
   
   PVector followPath()
    {
        float epsilon = 20.0f;

        PVector toNext = PVector.sub(position, path.nextWaypoint());
        float dist = toNext.mag();
        if (dist < epsilon)
        {
            path.advance();
        }
        if (!path.looped && path.atEnd())
        {
            return arrive(path.nextWaypoint());
        }
        else
        {
            return seek(path.nextWaypoint());
        }
    }
   
   PVector arrive(PVector targetPos)
    {
        float slowingDistance = 100.0f;

        PVector targetOffset = PVector.sub(targetPos, position);
        
        float distance = targetOffset.mag();
        if (distance > 0.0f)
        {
            float ramped = maxSpeed * (distance / slowingDistance);
            float clipped = min(ramped, maxSpeed);
            PVector desired = PVector.mult(targetOffset, (clipped / distance));
            desired.sub(velocity);
            desired.mult(8.0f);
            return desired;
        }
        else
        {
            return new PVector(0,0,0);
        }
    }
   
   PVector seek(PVector targetPos)
    {
        PVector desired = PVector.sub(targetPos, position);
        desired.normalize();
        desired.mult(maxSpeed);

        PVector force = PVector.sub(desired, velocity);
        if (force.mag() > maxForce)
        {
            force.normalize();
            force.mult(maxForce);
        }
        return force;
    }
    
    void update()
    {     
      force = followPath();
      PVector acceleration = PVector.div(force, mass);
      velocity.add(PVector.mult(acceleration, timeDelta));
      if (velocity.mag() > maxSpeed)
      {
          velocity.normalize();
          velocity.mult(maxSpeed);
      }
      position.add(PVector.mult(velocity, timeDelta));
      
      // Apply damping
      //velocity.mult(0.99f);
      
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
     
      super.update();             
  }
    
    
  
  void draw()
  {
    stroke(128, 128, 0);
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
    
    super.draw();
    
  } 
}
