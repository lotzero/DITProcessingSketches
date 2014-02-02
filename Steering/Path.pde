class Path extends GameEntity
{
  ArrayList<PVector> waypoints = new ArrayList<PVector>();

  boolean looped;

  int current = 0;
 
  boolean atEnd()
  {
      return (current == (waypoints.size() - 1));
  }

  void add(PVector point)
  {
      waypoints.add(point);
  }

  PVector nextWaypoint()
  {
      return waypoints.get(current);
  }

  void advance()
  {
      if (looped)
      {
          current = (current + 1) % waypoints.size();
      }
      else
      {
          if (! atEnd())
          {
              current++;
          }
      }
  }
  
  void draw()
  {
    if (waypoints.size() < 2)
    {
      return;
    }
    for (int i = 1 ; i < waypoints.size() ; i ++)
    {
      stroke(128, 128, 128);
      PVector from = waypoints.get(i - 1);
      PVector to = waypoints.get(i);      
      line(from.x, from.y, to.x, to.y);
    }
  }
}
