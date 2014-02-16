import ddf.minim.*;

void setup()
{
  _instance = this;

  minim = new Minim(FloppyBird.instance());
  deadSound = minim.loadFile("Dead.wav", 2048);  
  scoreSound = minim.loadFile("Pickup_Coin4.wav", 2048);  
  size(300, 400);
  
  font = loadFont("ComicSansMS-16.vlw");
  textFont(font, 16);
  bird = new Bird();
  children.add(bird);
  
  for (int i = 0 ; i < numTowers ; i ++)
  {
    Tower t = new Tower();   
    towers.add(t);
    children.add(t);
  }
   
  reset();
  
  for (int i = children.size()-1; i >= 0; i--) 
  {
    GameEntity entity = children.get(i);
    entity.setup();
  }
}

PFont font;
int count = 0;
int score = 0;
int numTowers = 2;

AudioPlayer deadSound;
AudioPlayer scoreSound;
Minim minim;//audio context

static void printText(String text)
{
  instance().messages.add(text);  
}

void printAllMessages()
{
  stroke(0);
  fill(0);
  for (int i = 0 ; i < messages.size() ; i ++)
  {    
    text(messages.get(i), 5, 20 + (i * 20));
  }
  messages.clear();  
}


static FloppyBird _instance;

static boolean[] keys = new boolean[526];
ArrayList<GameEntity> children = new ArrayList<GameEntity>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<String> messages = new ArrayList<String>();
Bird bird;
int gameState = 0;

static FloppyBird instance()
{
  return _instance;
}

void reset()
{
  for (int i = 0 ; i < numTowers ; i ++)
  {
    towers.get(i).position.x = width + ( i * 180);
  }
  
  bird.position.x = 100;
  bird.position.y = 200;
  bird.velocity.x = bird.velocity.y = 0.0f;
  score = 0;
  gameState = 0;
}

void draw()
{
  background(255);
  
  if (gameState == 0)
  {
    printText("Floppy Bird");
    printText("Press s key to start");
    if (checkKey('S'))
    {
      gameState = 1;
    }
  }
  if (gameState == 2)
  {
    printText("Game over!");
    printText("Press s key to start");
    if (checkKey('S'))
    {
      reset();
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
  if (gameState == 1)
  {
    checkScores();
    checkCollisions();
  }
  printText("Score: " + score);
  printAllMessages();
}

void checkScores()
{
  for (int i = 0 ; i < towers.size() ; i ++)
  {
    Tower tower = towers.get(i);
    if (tower.checkScore(bird.bounds))
    {
      scoreSound.rewind();
      scoreSound.play();
      score ++;
    }     
  }
}

void checkCollisions()
{
  boolean collision = false;
  for (int i = 0 ; i < towers.size() ; i ++)
  {
    Tower tower = towers.get(i);
    if (tower.intersects(bird.bounds))
    {
      collision = true;
      break;
    }     
  }
  
  if ((bird.bounds.tl.y + bird.bounds.h) > height)
  {
    collision = true;
  } 
  
  if ((bird.bounds.tl.y) < 0)
  {
    collision = true;
  } 
  
  if (collision)
  {
    deadSound.rewind();
    deadSound.play();
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

