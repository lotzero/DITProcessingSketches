class Tower extends GameEntity
{
  float gap;
  float gapHeight = 100;
  float towerWidth = 60;
  boolean scored;
  
  Tower()
  {
    velocity = new PVector(-50, 0);
    randomiseGap();
    position.x = width;
    position.y = 0;
  }
  
  void update()
  {    
    position.add(PVector.mult(velocity, timeDelta));
    if (position.x < - (towerWidth / 2.0f))
    {
      randomiseGap();    
      position.x = width + (towerWidth / 2.0f);
    }    
  }
  
  void randomiseGap()
  {
    gap = random(50, height - 50);    
    scored = false;
  }
  
  boolean circleCollides(PVector centre, float radius)
  {
    float left = position.x - (towerWidth / 2);
    float right = position.x + (towerWidth / 2);
    if ((centre.x + radius) < left)
    {
      return false;
    }
    
    if ((centre.x - radius) > right)
    {
      return false;
    }
    
    float top = gap - (gapHeight / 2);
    float bottom = gap + (gapHeight / 2);
    
    if (((centre.y - radius) > top) && ((centre.y + radius) < bottom))
    {
      return false;
    }
    
    return true;       
  }
  
  
  void draw()
  {
    pushMatrix();
    translate(position.x, position.y);
    fill(255);
    stroke(0);
    rect(-(towerWidth / 2), height, towerWidth, - (height - (gap + gapHeight / 2)));
    rect(-(towerWidth / 2), 0, towerWidth, gap - (gapHeight / 2));
    popMatrix();  
  }
}
