class Face
{
  Vector pos;
  float theta;
  boolean happy;
  
  Face()
  {    
    pos = new Vector(0,0);
    theta = 0;
  }
  
  void draw()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);

    if (happy)
    {
      stroke(255, 255, 0);
    }
    else
    {
      stroke(0, 255, 255);
    }
    fill(0);
    ellipse(0,0 , 50, 50);
    ellipse(-10, -15, 5,5);
    ellipse(10, -15, 5,5);
    ellipse(0,0,5,5);
    line(-10, 10, 10, 10);
    if (happy)
    {
      line(-10, 10, -15, 5);
      line(10, 10, 15, 5);
    }
    else
    {
      line(-10, 10, -15, 15);
      line(10, 10, 15, 15);
    }
    popMatrix();  
  }
}
