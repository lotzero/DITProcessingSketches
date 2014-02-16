class Bounds
{
    PVector tl = new PVector();
    float w;
    float h;    
    
    void draw()
    {
      stroke(200, 0, 0);
      fill(255);
      rect(tl.x, tl.y, w, h);
    }
    
    boolean intersects(Bounds b)
    {
      if (b.tl.y + b.h < tl.y)
      {
        return false;
      }
      
      if (b.tl.x > tl.x + w)
      {
        return false;        
      }
      
      if (b.tl.y > tl.y + h)
      {
        return false;
      }
      
      if (b.tl.x + b.w < tl.x)
      {
        return false;
      }
      
      return true;
    }
}
