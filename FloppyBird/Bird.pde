import ddf.minim.*;

class Bird extends GameEntity
{
  PVector gravity = new PVector(0, 200.0f);
  float mass = 1.0f;
  PVector force = new PVector();
  boolean lastPressed = false;
  float radius = 25;
  
  AudioPlayer flySound;
  Minim minim;//audio context
  
  void setup()
  {
    minim = new Minim(FloppyBird.instance());
    flySound = minim.loadFile("Jump17.wav", 2048);    
  }
  
  void update()
  {
    if (FloppyBird.checkKey(' '))
    {
      if (! lastPressed)
      {
        float newtons = -5000.0f;
        force.y += newtons;
        lastPressed = true;
        //flySound.rewind();
        //flySound.play();
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
    super.update();   
  }
  
  void draw()
  {
      stroke(0);
      fill(255);
      pushMatrix();
      translate(position.x, position.y);
      rotate(theta);            
      
      stroke(200, 0, 0);
      ellipse(0, 0, radius, radius);
          
      ellipse(0, 0, 20, 20);
      ellipse(10, -8, 10, 10);                 
      fill(0);
      ellipse(12, -7, 5, 5);          
      line(11, -2, 23, 1);
      line(10, 4, 23, 1);  
      line(11, 1, 23, 1);    
      line(-6, 3, 5, 3);
      popMatrix();  
  }
}
