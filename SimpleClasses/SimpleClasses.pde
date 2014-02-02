void setup()
{
  size(500, 500);
  ship1 = new Ship();
  ship2 = new Ship();
  ship3 = new Ship();
  
  ship1.x = 150;
  ship1.y = 150;
  ship1.w = 50;
  ship1.h = 50;
  ship1.spin = 0.2f;

  ship2.x = 100;
  ship2.y = 100;
  ship2.w = 50;
  ship2.h = 50;
  
  ship3.x = 50;
  ship3.y = 50;
  ship3.w = 50;
  ship3.h = 50;
  ship3.spin = -0.1f;
  ship3.scaleF = 2;
  
}

Ship ship1;
Ship ship2;
Ship ship3;

void draw()
{
  background(255);
  rect(50, 50, 250, 300);

  ship1.update();
  ship1.draw();
  ship2.update();
  ship2.draw();
  

  ship3.update();
  ship3.draw();
  
}

