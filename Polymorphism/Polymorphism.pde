void setup()
{
  size(500, 500);
  
  for (int i = 0 ; i < 20 ; i ++)
  {
    GameEntity entity;
    if (i % 2 == 0)
    {
      entity = new Ship();
    }
    else
    {
      entity = new Asteroid();
    }
    entity.pos.x = random(0, 500);
    entity.pos.y = random(0, 500);
    children.add(entity);
  }  
}

GameEntity ship = new Ship();
ArrayList<GameEntity> children = new ArrayList<GameEntity>();

void draw()
{
  background(0);
  stroke(255);
  
  for(int i = 0 ; i < children.size() ; i ++)
  {
    children.get(i).update();
    children.get(i).draw();   
  }
  
  
  ship.update();
  ship.draw();
  
  if ((ship.pos.x > 400) && (ship instanceof Ship))
  {
    Asteroid a = new Asteroid();
    a.pos = ship.pos;
    
    ship = a;
  }
  
}
