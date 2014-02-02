class GameEntity
{

  PVector position;
  PVector look;
  PVector velocity;
  float w;
  float h;
  float theta;
  float scaleF = 1.0f;
  float speed = 100.0f;
  float timeDelta = 1.0f / 60.0f;
  boolean alive;
  
  GameEntity()
  {
    position = new PVector();
    look = new PVector(0, -1);    
    theta = 0.0f;
    alive = true;
  }
    
  
  void update()
  {
  }
  
  void draw()
  {
  }
  
}
