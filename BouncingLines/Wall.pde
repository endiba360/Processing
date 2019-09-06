class Wall
{
  float Xposition;
  float Yposition;
  float widthWall;
  float heightWall;
  //
  float easing;
  float targetY;
  float targetX;
  float startY;
  float startX;
  float stopY;
  float stopX;
  //

  Wall(float tempX, float tempY, float tempWidth, float tempHeight)
  {
    Xposition = tempX;
    Yposition = tempY;
    widthWall = tempWidth;
    heightWall = tempHeight;
  }

  void display()
  {
    fill(0);
    rect(Xposition, Yposition, widthWall, heightWall);
  }
  void moveDown()
  {
    easing = 0.05;
    targetY = 50;
    startY = Yposition;
    stopY = targetY;

    if (mouseY <= targetY)
    {
      Yposition = startY + ((stopY - startY) * easing);
    } else if (mouseY != targetY)
    {
      easing = 0.1;
      Yposition -= (targetY - Yposition) * easing;
      if (Yposition < 0)
      {
        Yposition = 0;
      }
    }
  }
  void moveLeft()
  {
    easing = 0.05;
    targetX = width-50;
    startX = Xposition;
    stopX = targetX;

    if (mouseX >= targetX)
    {
      Xposition = startX + ((stopX - startX) * easing);
    } else if (mouseX != targetX)
    {
      easing = 0.1;
      Xposition -= (targetX - Xposition) * easing;
      if (Xposition > width-widthWall)
      {
        Xposition = width - widthWall;
      }
    }
  }
  void moveUp()
  {
    easing = 0.05;
    targetY = height - 50;
    startY = Yposition;
    stopY = targetY;

    if (mouseY >= targetY)
    {
      Yposition = startY + ((stopY - startY) * easing);
    } else if (mouseY != targetY) 
    {
      easing = 0.1;
      Yposition -= (targetY - Yposition) * easing;
      if (Yposition > height - heightWall) 
      {
        Yposition = height - heightWall;
      }
    }
  }
} 
