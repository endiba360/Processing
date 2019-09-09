Ball ball;
Wall wallUp;
Wall wallDown;
Wall wallRight;
cuboflotante Cubo;
//
//
void setup()
{
  size(480, 340);
  smooth();
  frameRate(100);
  ball = new Ball(0, 0, 10, 10, 20, 20);
  wallUp = new Wall(60, 0, width - 80, 15);
  wallDown = new Wall(60, height - 15, width - 80, 15);
  wallRight = new Wall(width - 15, 20, 15, height - 40);
  Cubo = new cuboflotante(width/2, height/2, 25, 25);
}

void draw()
{
 background(255);

  //ball.display();
  //ball.move();

  //wallUp.display();
  //wallUp.moveDown();
  //wallDown.display();
  //wallDown.moveUp();
  //wallRight.display();
  //wallRight.moveLeft();
  
  Cubo.display();
  Cubo.move();
  Cubo.bounce();
}
