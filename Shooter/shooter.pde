
// game variables
int gameScreenWidth = 600; // measured in pixels
int gameScreenHeight = 600;

int numEnemies = 5; // number of enemies in the game
int enemyDiameter = 10; //sets size of spheres
int enemyExplosionRadius = 25;
int enemySpeed = 1; // how quickly the enemies move

int [] enemyCoordsX = new int [ numEnemies ]; // creates an array for the x co-ordinates of each enemy
int [] enemyCoordsY = new int [ numEnemies ]; // creates an array for the y co-ordinates of each enemy

void setup()
{
  size(gameScreenWidth, gameScreenHeight); // set size of screen
  
  // initialize x coordinates of enemy ships
  for( int enemyIndex = 0; enemyIndex < numEnemies; enemyIndex++ )
  {
    enemyCoordsX[enemyIndex] = randomInteger(0, gameScreenWidth); // put enemy at a random x location
    enemyCoordsY[enemyIndex] = 0; // put the enemy at the top of the screen
  }
}

void draw()
{
  background(0); //creates a black background

  drawPlayerShip(mouseX);
  
  for ( int enemyIndex = 0; enemyIndex < numEnemies; enemyIndex++ )
  {
    moveEnemy(enemyIndex, enemySpeed); 
    drawEnemy(enemyIndex);
  }
  
  if ( gameOver() == true )
  {
    noLoop(); // stop the draw loop
  }
}

int randomInteger(int minimum, int maximum)
{
  return int(random(minimum, maximum)); // makes random positions
}

void drawPlayerShip(int coordX)
{
  //creates the triangle in green
  fill(color(0,0,0));
  stroke(color(0,255,0));
  triangle(coordX - 8, 580, coordX + 8, 580, coordX, 565);
}

void moveEnemy(int enemyIndex, int speed)
{
    enemyCoordsY[enemyIndex] = enemyCoordsY[enemyIndex] + speed;
}
void drawLaser(int cursorCoordX)
{
  // colour the laser
  stroke(color(255, 255, 0));
  fill(color(255, 255, 0)); // set colour for the explosion
  line(cursorCoordX, 565, cursorCoordX, 0);
}

void drawExplosion(int enemyCoordX, int enemyCoordY, int explosionSize)
{
  stroke(color(255,0,0));
  fill(color(255,0,0)); // set colour for the explosion
  ellipse(enemyCoordX, enemyCoordY, explosionSize, explosionSize);
}

// called each time the mouse is pressed
void mousePressed()
{
  // fire the laser from our ship (should wrap this in a function but there are so many already)
  
  drawLaser(mouseX);
  //shoot = true; //sets boolean at the start to true
  for ( int i = 0; i < numEnemies; i++ )
  {
    // see if the laser has hit the enemy
    if( laserHasCollidedWithEnemy(mouseX, enemyCoordsX[i], enemyDiameter) == true )
    {
      int enemyExplosionSize = enemyDiameter + enemyExplosionRadius; // calculate the size of the explosion
      drawExplosion(enemyCoordsX[i], enemyCoordsY[i], enemyExplosionSize);
      
      // move the enemy back to the top but at a random X coordinate
      enemyCoordsX[i] = randomInteger(0, gameScreenWidth); // move enemy to a random x position
      enemyCoordsY[i] = 0; // move enemy to the top of the screen
    }    
  }
}

void drawEnemy(int enemyIndex)
{  
  stroke(255);
  fill(0);
  ellipse(enemyCoordsX[enemyIndex], enemyCoordsY[enemyIndex], enemyDiameter, enemyDiameter);
}

boolean laserHasCollidedWithEnemy(int laserCoordX, int enemyCoordX, int enemyDiameter)
{
  boolean laserIsToTheRightOfTheEnemysLeft = laserCoordX >= ( enemyCoordX - (enemyDiameter / 2) );
  boolean laserIsToTheLeftOfTheEnemysRight = laserCoordX <= ( enemyCoordX + (enemyDiameter / 2) );
  
  if ( laserIsToTheRightOfTheEnemysLeft && laserIsToTheLeftOfTheEnemysRight )
    return true;
  else
    return false;
}

boolean gameOver()
{
  for ( int i = 0; i < numEnemies; i++ )
  {
    if( enemyCoordsY[i] == gameScreenHeight )
    {
      return true;
    }
  }
  return false;
}
