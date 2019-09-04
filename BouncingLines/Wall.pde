class Wall
{
  float Xposition;
  float Yposition;
  float widthWall;
  float heightWall;
  
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
    float easing = 0.05;
    float targetY = 50;
    float startY = Yposition;
    float stopY = targetY;
    
    if(mouseY <= targetY)
    {
      Yposition = startY + ((stopY - startY) * easing);
    }else if(mouseY != targetY)
      {
        easing = 0.1;
        Yposition -= (targetY - Yposition) * easing;
        if(Yposition < 0)
        {
          Yposition = 0;
        }
      }
  }
} 
