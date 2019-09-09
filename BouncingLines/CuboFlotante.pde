class cuboflotante
{
  float Xpos;
  float Ypos;
  float widthCubo;
  float heightCubo;
  float speed = 0.5;
  float direction = 1;

  cuboflotante(float tempX, float tempY, float tempWidth, float tempHeight)
  {
    Xpos = tempX;
    Ypos = tempY;
    widthCubo = tempWidth;
    heightCubo = tempHeight;
  }

  void display()
  {
    fill(0);
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
    } else if (Ypos < 60)
    {
      direction = -direction;
    }
  }
}
