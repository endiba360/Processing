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
} 
