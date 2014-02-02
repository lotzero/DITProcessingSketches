void setup ()
{
  background(255,255,153);
  size(1000,1000);
  px=175;
  dx=-1;
  py=600;
  dy=450;
  fx=500;
  fy=150;
  nx=210;
  ax=350;
  bx=250;
  cx=50;
  ex=200;
}

int px, py, dy, fx, fy, nx, ax, bx, cx, ex;
int dx;
void draw()
{
  background(0);
stroke(255);
size(1000,1000);
fill(200);
line(px, py, ax, 700);
line(px, py, ax, 500);
ellipse(fx, py, 360, 360);
line (fy,dy, bx, 557);
line(fy,dy, cx, 450);
line(fy,dy, ex,450);
line(fy,750, bx, 643);
line(nx,750, cx, 750);

px= px + dx;
fx=fx+dx;
fy=fy+dx;
nx=nx+dx;
ax=ax+dx;
bx=bx+dx;
cx=cx+dx;
ex=ex+dx;
  if (mouseX > 250)
  {
    dx=1;
  }
  if(mouseX <250)
  {
    dx=-1;
  }
 }

