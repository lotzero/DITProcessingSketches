
PVector gravity = new PVector(0, -9.8);
PVector coinVelocity = new PVector(0, 0);
float buildingHeight = 381;
PVector coinPos;
PFont font;
int count = 0;
float timeDelta = 1.0f / 60.0f;

float predictedTime;
PVector predictedVelocity;

void printText(String text)
{
  fill(255);  
  text(text, 5, 20 + (count * 20));
  count ++;
}

void setup()
{
    size(500, 500, OPENGL);
    font = createFont("Arial",16,true);  
    coinPos = new PVector(200, buildingHeight);
    
    predictedTime = sqrt(buildingHeight / 4.9f);    
    predictedVelocity = PVector.mult(gravity, predictedTime);
}

float timeAcc = 0;

void draw()
{
  
  background(0);
  fill(255);
  stroke(255);
  textFont(font,16);
  // Draw the Building
  rect(100.0f, (float) height, 50.0f, - buildingHeight);
  
  
  if (coinPos.y > 0)
  {
    coinVelocity.add(PVector.mult(gravity, timeDelta));
    coinPos.add(PVector.mult(coinVelocity, timeDelta));
    timeAcc += timeDelta;
  }
  
  // Draw the coin
  fill(0);
  ellipse(coinPos.x, height - coinPos.y, 10, 10);  
  
  count = 0;
  printText("Predicted Time: " + predictedTime);
  printText("Predicted Velocity: " + predictedVelocity);
  printText("Coin Velocity: " + coinVelocity);
  printText("Coin Height: " + (coinPos.y));
  printText("Time: " + timeAcc);
  
}

