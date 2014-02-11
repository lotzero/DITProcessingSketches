class Ship extends GameEntity
{
  
  int current = 0;
  
  Ship()
  {
    // Add 5 random waypoints
    
    for (int i = 0 ; i < 5 ; i ++)
    {
      waypoints.add(new PVector(random(0, width), random(0, height)));
    }    
    
    for (int i = 0 ; i < 5 ; i ++)
    {
      println(i + " " + waypoints.get(i));
    }
  }
  
  
  ArrayList<PVector> waypoints = new ArrayList<PVector>();
  
  void update()
  {
    
    float speed = 50f;
    PVector toDest = waypoints.get(current).get();
    println(current);
    toDest.sub(position);
    float distance = toDest.mag();    
    if (distance < 1.0f)
    {
      current ++;
      if (current == waypoints.size())
      {
        current = 0;
      }
    }
    else
    {
      toDest.normalize();  
      position.add(PVector.mult(toDest, speed * timeDelta));    
      theta = atan(toDest.x / -toDest.y);
    
      if (toDest.y > 0)
      {
        theta += PI;
      }
    }
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
      
      // Draw the path
      stroke(255, 0, 0);
      for (int i = 1 ; i < waypoints.size() ; i ++)
      {
        PVector from = waypoints.get(i - 1);
        PVector to = waypoints.get(i);        
        line(from.x, from.y, to.x, to.y);
      }
  }
}
