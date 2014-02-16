class Tower extends GameEntity
{
  float gap;
  float gapHeight = 100;
  float towerWidth = 60;
  boolean scored;
  Bounds topBounds = new Bounds();
  Bounds bottomBounds = new Bounds();
  
  Tower()
  {
    velocity = new PVector(-50, 0);
    reset();
    position.x = width;
    position.y = 0;
  }
  
  void update()
  {    
    position.add(PVector.mult(velocity, timeDelta));
    if (position.x < - (towerWidth / 2.0f))
    {
      reset();          
    }    
    
    topBounds.tl.x = position.x - (towerWidth / 2.0f);
    topBounds.tl.y = 0;
    topBounds.w = towerWidth;
    topBounds.h = gap - (gapHeight / 2);
    
    bottomBounds.tl.x = position.x - (towerWidth / 2.0f);
    bottomBounds.tl.y = gap + (gapHeight / 2);
    bottomBounds.w = towerWidth;
    bottomBounds.h = height - (gap + (gapHeight / 2));    
  }
  
  boolean intersects(Bounds b)
  {
    return (topBounds.intersects(b) || bottomBounds.intersects(b));
  }
  
  void reset()
  {
    position.x = width + (towerWidth / 2.0f);
    gap = random(50, height - 50);    
    scored = false;
  }
  
  boolean checkScore(Bounds b)
  {
    float right = position.x + (towerWidth / 2);
    
    if ((b.tl.x > right) && (! scored))
    {
      scored = true;
      return true;
    }
    
    return false;
  }
  
  void draw()
  {
    pushMatrix();
    translate(position.x, position.y);
    fill(255);
    stroke(0, 0, 255);
    rect(-(towerWidth / 2), height, towerWidth, - (height - (gap + gapHeight / 2)));
    rect(-(towerWidth / 2), 0, towerWidth, gap - (gapHeight / 2));
    popMatrix();  
    
    //topBounds.draw();
    //bottomBounds.draw();
  }
}
