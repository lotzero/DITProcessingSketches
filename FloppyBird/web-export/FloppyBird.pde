import ddf.minim.*;

void setup()
{
  _instance = this;

  minim = new Minim(FloppyBird.instance());
  deadSound = minim.loadFile("Dead.wav", 2048);  
  scoreSound = minim.loadFile("Pickup_Coin4.wav", 2048);  
  size(300, 400);
  
  font = loadFont("ComicSansMS-48.vlw");
  textFont(font, 48);
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
    printText("Welcome to the amazing Floppy Bird");
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

import ddf.minim.*;

class Bird extends GameEntity
{
  PVector gravity = new PVector(0, 200.0f);
  float mass = 1.0f;
  PVector force = new PVector();
  boolean lastPressed = false;
  AudioPlayer flySound;
  Bounds bounds = new Bounds();
  
  
  void setup()
  {
    flySound = FloppyBird.instance().minim.loadFile("Jump17.wav", 2048);    
    w = 20;
    h = 20;
  }
  
  void update()
  {
    /*
    if (FloppyBird.checkKey('W'))
    {
      position.y -= 1;
    }
    
    if (FloppyBird.checkKey('S'))
    {
      position.y += 1;
    }
    
    if (FloppyBird.checkKey('D'))
    {
      position.x += 1;
    }
    
    if (FloppyBird.checkKey('A'))
    {
      position.x -= 1;
    }
    */
    
    if (FloppyBird.checkKey(' '))
    {
      if (! lastPressed)
      {
        float newtons = -5000.0f;
        force.y += newtons;
        lastPressed = true;
        flySound.rewind();
        flySound.play();
      }
    }
    else
    {
      lastPressed = false;
    }
    
    PVector accel = PVector.div(force, mass);
    accel.add(gravity);
    
    velocity.add(PVector.mult(accel, timeDelta));
    position.add(PVector.mult(velocity, timeDelta));
    
    force.x = force.y = 0.0f;         
           
    bounds.tl.x = position.x - (w / 2);
    bounds.tl.y = position.y - (h / 2);
    bounds.w = w;
    bounds.h = h;
    
    super.update();   
  }
  
  void draw()
  {
      //bounds.draw();
      stroke(0);
      fill(255);
      pushMatrix();
      translate(position.x, position.y);
      rotate(theta);            
      
      // Draw my body
      stroke(0, 255, 0);      
      ellipse(0, 0, 20, 20);
      
      // Draw my head          
      stroke(100, 255, 0);
      ellipse(10, -8, 10, 10);  
      // The eye      
      fill(0);
      ellipse(12, -7, 5, 5);          
      
      line(11, -2, 23, 1);
      line(10, 4, 23, 1);  
      line(11, 1, 23, 1);    
      line(-6, 3, 5, 3);
      popMatrix();  
      
      
  }
}
class Bounds
{
    PVector tl = new PVector();
    float w;
    float h;    
    
    void draw()
    {
      stroke(200, 0, 0);
      fill(255);
      rect(tl.x, tl.y, w, h);
    }
    
    boolean intersects(Bounds b)
    {
      if (b.tl.y + b.h < tl.y)
      {
        return false;
      }
      
      if (b.tl.x > tl.x + w)
      {
        return false;        
      }
      
      if (b.tl.y > tl.y + h)
      {
        return false;
      }
      
      if (b.tl.x + b.w < tl.x)
      {
        return false;
      }
      
      return true;
    }
}
class GameEntity
{

  PVector position;
  PVector look;
  PVector right;
  PVector velocity;
  PVector force;
  float w;
  float h;
  float theta;
  float scaleF = 1.0f;
  float speed = 100.0f;
  float timeDelta = 1.0f / 60.0f;
  boolean alive;
  boolean drawVectors;
  float mass;
  PVector basis = new PVector(0, -1);
  
  
  
  GameEntity()
  {
    position = new PVector();
    look = new PVector(0, -1);    
    right = new PVector(1, 0);    
    velocity = new PVector(0,0);
    force = new PVector(0,0);
    theta = 0.0f;
    mass = 1.0f;
    alive = true;
  }    
  
  void setup()
  {
  }
  
  void update()
  {
    // Calculate the vectors
    look.x = sin(theta);
    look.y = -cos(theta);  
    
    right.x = sin(theta + HALF_PI);
    right.y = -cos(theta + HALF_PI);  
    
    
        
    // Could also use this:
    //look = PVector.fromAngle(theta - HALF_PI);
    //right = PVector.fromAngle(theta);
  }
  
  void draw()
  {
    if (drawVectors)
    {
      float lineLength = 50.0f;
      pushMatrix();
      translate(position.x, position.y);
      //rotate(theta);
      scale(scaleF);    
      stroke(0, 255, 0);
      line(0, 0, look.x * lineLength, look.y * lineLength);      
      stroke(255, 0, 0);
      line(0, 0, right.x * lineLength, right.y * lineLength);
      popMatrix();      
    }
  }
  
}
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

