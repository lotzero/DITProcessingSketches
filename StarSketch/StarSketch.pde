void setup()
{
  size(displayWidth, displayHeight);
  smooth();
  Star star1, star2, star3;
  Ship ship;
  star1 = new Star();  
  star2 = new Star();
  star2.rotSpeed = -0.05f;
  star2.r = 255;
  star2.g = 255;
  star2.b = 0;
  star2.x = 200; star2.y = 50;
  star2.radius = 20;

  star3 = new Star();
  star3.rotSpeed = 0.015f;
  star3.r = 255;
  star3.g = 0;
  star3.b = 255;
  star3.points = 5;
  star3.x = 300; star3.y = 300;
  star3.radius = 120;
  ship = new Ship();
  ship.x = 300;
  ship.y = 300;
  ship.radius = 40;
  ship.r = 255;
  ship.g = 255;
  ship.b = 255;
  children.add(star1);
  children.add(star2);
  children.add(star3);
  children.add(ship);
}

ArrayList<GameComponent> children = new ArrayList<GameComponent>();

void draw()
{
  background(0);
  for (int i = 0 ; i < children.size(); i ++)
  {
      children.get(i).update();
      children.get(i).draw();
  }
}
