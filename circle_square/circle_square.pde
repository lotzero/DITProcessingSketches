// Now a star box
size(800,600);
background(0);
smooth();
    int x = 100; int y = 50; 
    int width = 200;
    int centre = width / 2;
    stroke(255);
    fill(0);
    for (int i = 0 ; i <= width ; i += 10)
    {
      line(x + i, y, x + centre, y + centre);
      line(x + i, y + width, x + centre, y + centre);
      line(x, y + i, x + centre, y + centre);
      line(x + width, y + i, x + centre, y + centre);
    }

    // Now the circle pattern
    x = 500; y = 100;
    for (int radius = 0 ; radius < 100; radius += 5)
    {
      ellipse(x, y, radius,radius);
    }
