void setup()
{
  _instance = this;

  size(500, 500, OPENGL);
  ship1 = new Ship();  
  ship1.position = new PVector(100, 100);
  ship1.w = 50;
  ship1.h = 50; 
  
  ship1 = new Ship();
  children.add(ship1);
  
  for (int i = 0 ; i < 10 ; i ++)
  {
    Star star = new Star((int) random(5, 10), random(-0.2f, 0.2f), random(5, 30), (int) random(0, 255), (int) random(0, 255), (int) random(0, 255));
    children.add(star);
    star.position.x = random(0, width);
    star.position.y = random(0, height);    
    star.look.x = random(-1, 1);    
    star.look.y = random(-1, 1);    
  }  
}

static AsteroidsGame _instance;

Ship ship1;
static boolean[] keys = new boolean[526];
ArrayList<GameEntity> children = new ArrayList<GameEntity>();
static AsteroidsGame instance()
{
  return _instance;
}

void draw()
{
  background(0);
  
  for (int i = children.size()-1; i >= 0; i--) 
  {
    GameEntity entity = children.get(i);
    entity.update();
    entity.draw();
    if (! entity.alive) 
    {
      children.remove(i);
    }
  }
}

static boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k];  
  }
  return false;
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

