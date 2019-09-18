public class cuboflotante
{
  float Xpos;
  float Ypos;
  float widthCubo;
  float heightCubo;
  float speed = 1;
  float direction = 1;
  

  cuboflotante(float tempX, float tempY, float tempWidth, float tempHeight)
  {
    Xpos = tempX;
    Ypos = tempY;
    widthCubo = tempWidth;
    heightCubo = tempHeight;
  }

  void checkIfHits()
  {
    if (ball.XfinalPosition > Xpos && 
        ball.XfinalPosition < Xpos + widthCubo && 
        ball.YfinalPosition > Ypos && 
        ball.YfinalPosition < Ypos + heightCubo)
    {
      contador.hitInCube = contador.hitInCube + 1;
    }

  }

  void display()
  {
    rect(Xpos, Ypos, widthCubo, heightCubo);
  }

  void move()
  {
    Ypos += speed * direction;
  }
  void bounce()
  {
    if (Ypos > 260)
    {
      direction = -direction;
    } else if (Ypos < 60+heightCubo)
    {
      direction = -direction;
    }
  }
}
