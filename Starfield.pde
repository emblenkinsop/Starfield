Particle[] stars = new Particle[400];

void setup()
{
  size(900, 700);
  background(0);
  noStroke();

  for (int i=0; i<stars.length; i++)
    stars[i] = new NormalParticle();
  for (int i=0; i<4; i++) {
    stars[i] = new OddballParticle(i);
    System.out.println("oddball");
  }
  for (int i=4; i<10; i++) {
    stars[i] = new JumboParticle();
    System.out.println("jumbo");
    }
}
void draw()
{
  fill(0,50);
  rect(0,0,900,700);
  for (int i=0; i<stars.length; i++) {
    stars[i].move();
    stars[i].show();
  }
  fill(0);
  ellipse(450,350,20,20);
}
class NormalParticle implements Particle
{
  double angle;
  float speed, xPos, yPos;
  NormalParticle() {
    xPos = 450;
    yPos = 350;
    angle = Math.random()*2*PI;
    speed = (float)Math.random()*2;
  }
  public void move() {
    if ((xPos<0 || xPos>900) || (yPos<0 || yPos>700)) {
      xPos = 450;
      yPos = 350;
      angle = Math.random()*2*PI;
      speed = (float)Math.random()*2;
    }
    xPos = xPos+speed*(cos((float)angle));
    yPos = yPos+speed*(sin((float)angle));
    speed = speed*1.1;
  }
  public void show() {
    fill(255);
    ellipse(xPos, yPos, 5, 5);
  }
}
class OddballParticle implements Particle
{
  float size,xPos,yPos;
  int xDir,yDir;
  OddballParticle(int a) {
    size = 0;
    xPos = 450;
    yPos = 350;
    xDir = -1*(1+a);
    yDir = -1*(int)(.5*(a+2));
  }
  public void move() {
    xPos = xPos+xDir;
    yPos = xPos+yDir;
  }
  public void show() {
    size++;
    noFill();
    strokeWeight(20);
    stroke(0);
    ellipse(xPos,yPos,size,size);
  }
}
class JumboParticle extends NormalParticle
 {
 //public void move() {
 //}
 public void show() {
   fill(200,100,200);
   ellipse(xPos,yPos,20,20);   
 }
 }
interface Particle
{
  public void move();
  public void show();
}