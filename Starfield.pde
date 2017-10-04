Particle[] stars = new NormalParticle[400];

void setup()
{
  size(900, 700);
  background(0);
  noStroke();

  for (int i=0; i<stars.length; i++) {
    stars[i] = new NormalParticle();
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
  public void move() {
  }
  public void show() {
  }
}
/*class JumboParticle extends Particle
 {
 public void move() {
 }
 public void show() {
 }
 }*/
interface Particle
{
  public void move();
  public void show();
}