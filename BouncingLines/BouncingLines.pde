Ball ball;
Wall wallUp;
Wall wallDown;
Wall wallRight;
cuboflotante Cubo;
Contador contador;
//
//
void setup()
{
  size(480, 340);
  smooth();
  frameRate(100);
  ball = new Ball(60, 60, 70, 70, 80, 80);
  wallUp = new Wall(60, 0, width - 80, 15);
  wallDown = new Wall(60, height - 15, width - 80, 15);
  wallRight = new Wall(width - 15, 20, 15, height - 40);
  Cubo = new cuboflotante(width/2, height/2, 30, 30);
  contador = new Contador(0, -1, 55, height+1);
}

void draw()
{
  background(255);
  
  strokeWeight(3);
  ball.display();
  ball.move();
  //ball.bounce(); no longer used
  ball.checkIfHitDownWall();
  ball.checkIfHitRightWall();
  ball.checkIfHitUpWall();
  
  strokeWeight(0);
  wallUp.display();
  wallUp.moveDown();
  

  strokeWeight(0);
  wallDown.display();
  wallDown.moveUp();
  

  strokeWeight(0);
  wallRight.display();
  wallRight.moveLeft();
  

  strokeWeight(0);
  Cubo.display();
  Cubo.move();
  Cubo.bounce();
  Cubo.checkIfHits();

  strokeWeight(0);
  contador.display();
}
