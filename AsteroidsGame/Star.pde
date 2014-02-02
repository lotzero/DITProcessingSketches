class Star extends GameEntity
{
  float points;
  float spin;
  int r, g, b;
  
  Star(float points, float spin, float radius, int r, int g, int b)
  {
    this.points = points;
    this.spin = spin;
    this.w = radius;
    this.r = r;
    this.g = g;
    this.b = b;
    
  }
  
  void update()
  {
      theta += spin;
      if (theta > TWO_PI)
      {
        theta = 0.0f;
      } 
      PVector velocity = look.get();
      velocity.mult(speed * timeDelta);
      position.add(velocity);
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
      
      for (int i = 0 ; i < AsteroidsGame.instance().children.size() ; i ++)
      {
        if ((AsteroidsGame.instance().children.get(i) instanceof Lazer))
        {
          Lazer lazer = (Lazer) AsteroidsGame.instance().children.get(i);
          if (dist(position.x, position.y, lazer.position.x, lazer.position.y) < w)
          {
            alive = false;
            lazer.alive = false;
          }
        }
      }
    
  }
  
  void draw()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    float thetaInc = TWO_PI / (points * 2);
    float lastX;
    float lastY;
    lastX = 0;
    lastY = -w; 
    stroke(r, g, b);
    for (int i = 0 ; i <= (points * 2) ; i ++)
    {
       float currentX;
       float currentY;
       float theta = (float) i * thetaInc;
       
       if (i % 2 == 1)
       {         
         currentX = sin(theta) * (w / 2);
         currentY = -cos(theta) * (w / 2);
       }
       else
       {
         currentX = sin(theta) * (w);
         currentY = -cos(theta) * (w);
       }
       line(lastX, lastY, currentX, currentY);
       lastX = currentX;
       lastY = currentY;
       
    }
    popMatrix();
  }
}
