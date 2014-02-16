void setup()
{
  _instance = this;

  size(300, 400);
  
  font = createFont("Arial",16,true);  
  bird = new Bird();
  children.add(bird);
  bird.position.x = 100;
  bird.position.y = 200;
  
  Tower t = new Tower();
  children.add(t);
  towers.add(t);
  
  t = new Tower();
  children.add(t);
  t.position.x = width + 180.0f;
  towers.add(t);
  
  for (int i = children.size()-1; i >= 0; i--) 
  {
    GameEntity entity = children.get(i);
    entity.setup();
  }
}

PFont font;
int count = 0;
int score = 0;

void printText(String text)
{
  text(text, 5, 20 + (count * 20));
  count ++;
}

static FloppyBird _instance;

static boolean[] keys = new boolean[526];
ArrayList<GameEntity> children = new ArrayList<GameEntity>();
ArrayList<Tower> towers = new ArrayList<Tower>();
Bird bird;
int gameState = 0;

static FloppyBird instance()
{
  return _instance;
}

void draw()
{
  background(255);
  
  if (gameState == 0)
  {
    printText("Press space key to start");
    if (checkKey(' '))
    {
      gameState = 1;
    }
  }
  if (gameState == 2)
  {
    printText("Game over!");
    printText("Press space key to start");
    if (checkKey(' '))
    {
      gameState = 1;
    }
  }
    
  for (int i = children.size()-1; i >= 0; i--) 
  {
    GameEntity entity = children.get(i);
    if (gameState == 1)
    {
      entity.update();
    }
    entity.draw();
    if (! entity.alive) 
    {
      children.remove(i);
    }
  }
  checkCollisions();
  printText("Score: " + score);
  count = 0;
}

void checkScore()
{
  for (int i = 0 ; i < towers.size() ; i ++)
  {
    Tower tower = towers.get(i);
    if (tower.circleCollides(bird.position, bird.radius))
    {
      collision = true;
      break;
    }     
  }
}

void checkCollisions()
{
  boolean collision = false;
  for (int i = 0 ; i < towers.size() ; i ++)
  {
    Tower tower = towers.get(i);
    if (tower.circleCollides(bird.position, bird.radius))
    {
      collision = true;
      break;
    }     
  }
  if (collision)
  {
    gameState = 2;
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

