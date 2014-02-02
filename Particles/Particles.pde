void setup()
{
  _instance = this;

  size(500, 500);
  
  font = createFont("Arial",16,true);  
  
  for (int i = 0 ; i < 500 ; i ++)
  {
    Particle p = new Particle(width / 2, 250);
    children.add(p);
  }
  
}

PFont font;
int count = 0;

void printText(String text)
{
  text(text, 5, 20 + (count * 20));
  count ++;
}


static Particles _instance;

static boolean[] keys = new boolean[526];
ArrayList<GameEntity> children = new ArrayList<GameEntity>();
static Particles instance()
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
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

