Ball ball;
Wall wallUp;
Wall wallDown;
Wall wallRight;

void setup()
{
  size(480, 340);
  smooth();
  frameRate(100);
  ball = new Ball(0, 0, 10, 10, 20, 20);
  wallUp = new Wall(15, 0, width - 35, 15);
  wallDown = new Wall(15, height - 15, width - 35, 15);
  wallRight = new Wall(width - 15, 20, 15, height - 40);
}

void draw()
{
  background(255);
  //ball.display();
  //ball.move();
  wallUp.display();
  //wallDown.display();
  //wallRight.display();
}
