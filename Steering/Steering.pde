void setup()
{
  _instance = this;

  size(500, 500, OPENGL);
  ship1 = new Ship();  
  ship1.position = new PVector(100, 100);
  ship1.w = 50;
  ship1.h = 50; 
  
  font = createFont("Arial",16,true);  
  
  ship1 = new Ship();
  children.add(ship1);  
  aiShip = new AIShip();
  aiShip.position.x = 100;
  aiShip.position.y = 300;  
  children.add(aiShip);   
 
 steeringShip = new SteeringShip();
 steeringShip.position.x = 20;
 steeringShip.position.y = 400;
 
 steeringShip.path.add(steeringShip.position.get());
 steeringShip.path.add(new PVector(110, 300));
 steeringShip.path.add(new PVector(130, 200));

 steeringShip.path.add(new PVector(200, 10));
 steeringShip.path.add(new PVector(300, 100));
 steeringShip.path.add(new PVector(300, 400));
 steeringShip.path.add(steeringShip.position.get());
 steeringShip.path.looped = true;
 children.add(steeringShip);   
  
}

PFont font;
int count = 0;

void printText(String text)
{
  text(text, 5, 20 + (count * 20));
  count ++;
}


static Steering _instance;

Ship ship1;
AIShip aiShip;
SteeringShip steeringShip;
static boolean[] keys = new boolean[526];
ArrayList<GameEntity> children = new ArrayList<GameEntity>();
static Steering instance()
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
  count = 0;
}

static boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k];  
  }
  return false;
}

void mousePressed()
{
  steeringShip.seekPos.x = mouseX;
  steeringShip.seekPos.y = mouseY;
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

