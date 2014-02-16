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
