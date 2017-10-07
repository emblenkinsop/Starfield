Particle[] stars = new Particle[500];

void setup()
{
  size(900, 600);
  background(0);
  noStroke();

  for (int i=0; i<stars.length; i++)
    stars[i] = new NormalParticle();
  for (int i=0; i<4; i++) {
    stars[i] = new OddballParticle(i);
  }
  for (int i=4; i<10; i++) {
    stars[i] = new JumboParticle();
    }
}
void draw()
{
  fill(0,50);
  rect(0,0,900,600);
  for (int i=0; i<stars.length; i++) {
    stars[i].move(i);
    stars[i].show();
  }
  fill(0);
  noStroke();
  ellipse(450,300,20,20);
}
class NormalParticle implements Particle
{
  double angle;
  float speed, xPos, yPos;
  NormalParticle() {
    xPos = 450;
    yPos = 300;
    angle = Math.random()*2*PI;
    speed = (float)Math.random()*2;
  }
  public void move(int a) {
    if ((xPos<0 || xPos>900) || (yPos<0 || yPos>600)) {
      xPos = 450;
      yPos = 300;
      angle = Math.random()*2*PI;
      speed = (float)Math.random()*2;
    }
    xPos = xPos+speed*(cos((float)angle));
    yPos = yPos+speed*(sin((float)angle));
    speed = speed*1.1;
  }
  public void show() {
    noStroke();
    fill(255);
    ellipse(xPos, yPos, 5, 5);
  }
}
class OddballParticle implements Particle
{
  float size,xPos,yPos;
  //int xDir,yDir;
  OddballParticle(int a) {
    size = 0;
    xPos = 450;
    yPos = 300;
  }
  public void move(int a) {
    if ((xPos<0 || xPos>900) || (yPos<0 || yPos>600)) {
      size = size-(size-100);
      xPos = 450;
      yPos = 300;
    }
    if (a==0) {
      xPos = xPos+1; yPos = yPos+1;
    }
    if (a==1) {
      xPos = xPos+1; yPos = yPos-1;
    }
    if (a==2) {
      xPos = xPos-1; yPos = yPos+1;
    }
    if (a==3) {
      xPos = xPos-1; yPos = yPos-1;
    }
  }
  public void show() {
    size++;
    noFill();
    strokeWeight(20);
    stroke(60,0,60);
    ellipse(xPos,yPos,size,size);
  }
}
class JumboParticle extends NormalParticle
 {
 public void show() {
   noStroke();
   fill(0,100,200);
   ellipse(xPos,yPos,20,20);   
 }
 }
interface Particle
{
  public void move(int a);
  public void show();
}