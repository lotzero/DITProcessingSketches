void setup()
{
  size(500,500);
  sampleRate = width;
  amplitude = height / 2.0f;
  lasty = (float) height / 2.0f;
  lastx = 0.0f;
 
}

float frequency = 10.0f;
float sampleRate;
float theta = 0.0f;
float amplitude = 1.0f;
float pi = 3.14159285f;
float lastx, lasty;

void draw()
{
    float inc = (2.0f * pi * frequency) / sampleRate;
    lasty = (float) height / 2.0f;
    lastx = 0.0f;
    for (int x = 0 ; x < width ; x ++)
    {
      float y = (sin(theta) * amplitude) + (height / 2);
      theta += inc;
      line(lastx, lasty, x, y);
      lastx = x;
      lasty = y;      
    }
    theta = 0.0f;    
}
