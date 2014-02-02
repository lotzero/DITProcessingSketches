void setup()
{
  size(500, 500);
  ages[0] = 41.0f;
  ages[1] = 30.0f;
  ages[2] = 21.0f;
  ages[3] = 22.0f;
  ages[4] = 39.0f;
  
  float total = 0.0f;
  for (int i = 0 ; i < 5 ; i++)
  {
    total = total + ages[i];
  }
  float average = total / 5.0f;
  
  float min, max;
  min = ages[0];
  max = ages[0];
  
  for (int i = 1 ; i < 5 ; i ++)
  {
    if (ages[i] > max)
    {
       max = ages[i];
    }
    if (ages[i] < min)
    {
       min = ages[i];
    } 
  }
  
  println(min);
  println(max);
 
  println(average);
  
  Person[] people = new Person[5];
  people[0] = new Person();
  
  int i = 9;
  int j = 10;
  
  i = j;
  j = 11;
  println("i = " + i);
  println("j = " + j);
  
}

float[] ages = new float[5];

void draw()
{
  int w = 25;
   int gap = 5;
  for (int i = 0 ; i < ages.length ; i ++)
  {
    rect(i * w, 200, w - gap, -ages[i]);
    text("" + ages[i], i * w, 220);
  } 
}





