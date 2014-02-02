class AIShip extends GameEntity
{
  
  AIShip()
  {
    w = 30;
    h = 30;
    drawVectors = true;
  }
  
  void update()
  {
    // Check for distance
    Ship ship1 = Steering.instance().ship1;
    float alertdistance  = 100;
    PVector toShip1 = PVector.sub(ship1.position, position);
    if (toShip1.mag() < alertdistance)
    {
      Steering.instance().printText("In range");
    }
    else
    {
      Steering.instance().printText("Out of range");
    }
    
    // Check for FOV
    float fov = QUARTER_PI;
    toShip1.normalize();
    float a = acos(PVector.dot(look, toShip1));
    if (a < fov)
    {
      Steering.instance().printText("In FOV");
    }
    else
    {
      Steering.instance().printText("Outside of FOV");
    }    
    
    // Check in front of or behind
    // We dont even need to calculate the angle!
    float dot = PVector.dot(look, toShip1);
    if (dot > 0)
    {
      Steering.instance().printText("In front of");
    }
    else
    {
      Steering.instance().printText("Behind");
    }    
    
  }
  
  void draw()
  {
    stroke(0, 0, 255);
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
    super.draw();    
  } 
}
