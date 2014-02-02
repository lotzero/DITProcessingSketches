void setup()
{
  size(500, 500);
  fill(255, 0, 0);  
  x = 0;
  y = 250;
  w = 50; 
  theta = 0;
}

int x;
int y;
int w;
float theta;
  float px;
  float py;  

void draw()
{
  //background(255, 255, 255);    
  px = px + 1;
  py = y + (-cos(theta) * w);
  fill(random(255), random(255), random(255));  
  ellipse(px, py, w, w);
  theta = theta + 0.1; 
  w = w -1;
  fill(w, 0, 0);
}


