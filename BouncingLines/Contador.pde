class Contador
{
  float posX;
  float posY;
  float contadorWidth;
  float contadorHeight;
  
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
  }
}
