public class Contador
{
  float posX;
  float posY;
  float contadorWidth;
  float contadorHeight;
  int hitInWall = 0;
  int hitInCube = 0;
  
  Contador(float tempX, float tempY, float tempWidth, float tempHeight)
  {
    posX = tempX;
    posY = tempY;
    contadorWidth = tempWidth;
    contadorHeight = tempHeight;
  }
  
  void display()
  {
    noFill();
    rect(posX, posY, contadorWidth, contadorHeight);
    line(0, contadorHeight/3, contadorWidth, contadorHeight/3);
    line(0, contadorHeight/3 * 2, contadorWidth, contadorHeight/3 * 2);
    text("Hit Wall", 5, 0 + 50);
    text(hitInWall, 5, 0 + 70);
    text("Hit Cube", 5, contadorHeight/2);
    text(hitInCube, 5, contadorHeight/2 + 20);
    text("Difference", 0, contadorHeight/2 + 100);
    text(hitInWall - hitInCube, 5, contadorHeight/2 + 120);
  }
}
