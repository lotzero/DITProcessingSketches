void setup()
{
  size(500, 500);
  font = createFont("Arial",16,true);  
}

PFont font;
int count = 0;

void printText(String text)
{
  text(text, 330, 150 + (count * 20));
  count ++;
}

float distance(float x1, float y1, float x2, float y2)
{
  return sqrt (pow(x2 - x1, 2.0f) + pow(y2 - y1, 2.0f)); 
}

void draw()
{
  int startX = 10;
  int startY = 300;
  int endX = 300;
  int endY = 300;
  count = 0;
  background(0);
  stroke(255);
  line(startX, startY, endX, endY);
  line(startX, startY, endX, mouseY);
  line(endX, endY, endY, mouseY);
  
  textFont(font,16);
  
  float h, a, o;
  h = distance(startX, startY, mouseX, mouseY);
  a = distance(startX, startY, endX, endY);
  o = distance(endX, endY, mouseX, mouseY);
  printText("Opposite: " + o);
  printText("Hypotenuse: " + h);
  printText("Adjacent: " + a);
  float theta = o / h;
  printText("Theta (radians): " + theta);
  printText("Theta (degrees): " + degrees(theta));
  
}
