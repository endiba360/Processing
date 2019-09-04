class Ball
{
  float XinitialPosition;
  float YinitialPosition;
  
  float XmiddlePosition;
  float YmiddlePosition;
  
  float XfinalPosition;
  float YfinalPosition;
  
  float Xidirection = 1;
  float Yidirection = 1;
  
  float Xmdirection = 1;
  float Ymdirection = 1;
  
  float Xfdirection = 1;
  float Yfdirection = 1;
  
  Ball(float tempXi, float tempYi, float tempXm, float tempYm, float tempXf, float tempYf)
  {
    XinitialPosition = tempXi;
    YinitialPosition = tempYi;
    
    XmiddlePosition = tempXm;
    YmiddlePosition = tempYm;
    
    XfinalPosition = tempXf;
    YfinalPosition = tempYf;
  }
  
  void move()
  {
    XinitialPosition = XinitialPosition + Xidirection;
    YinitialPosition = YinitialPosition + Yidirection;
    
    XmiddlePosition = XmiddlePosition + Xmdirection;
    YmiddlePosition = YmiddlePosition + Ymdirection;
    
    XfinalPosition = XfinalPosition + Xfdirection;
    YfinalPosition = YfinalPosition + Yfdirection;
    
    if(XinitialPosition > width)
    {
      Xidirection *= -1;
    }else if(XinitialPosition < 0)
      {
        Xidirection *= -1;
      }
    if(YinitialPosition > height)
    {
      Yidirection *= -1;
    }else if(YinitialPosition < 0)
      {
        Yidirection *= -1;
      }
    
    if(XmiddlePosition > width)
    {
      Xmdirection *= -1;
    }else if(XmiddlePosition < 0)
      {
        Xmdirection *= -1;
      }
    if(YmiddlePosition > height)
    {
      Ymdirection *= -1;
    }else if(YmiddlePosition < 0)
      {
        Ymdirection *= -1;
      }
    
    if(XfinalPosition > width)
    {
      Xfdirection *= -1;
    }else if(XfinalPosition < 0)
      {
        Xfdirection *= -1;
      }
    if(YfinalPosition > height)
    {
      Yfdirection *= -1;
    }else if(YfinalPosition < 0)
      {
        Yfdirection *= -1;
      }
  }
  
  void display()
  {
    point(XinitialPosition, YinitialPosition);
    point(XmiddlePosition, YmiddlePosition);
    point(XfinalPosition, YfinalPosition);
    
    line(XinitialPosition, YinitialPosition, XmiddlePosition, YmiddlePosition);
    line(XmiddlePosition, YmiddlePosition, XfinalPosition, YfinalPosition);
  }
  
  void bounce()
  {
    
  }
}
