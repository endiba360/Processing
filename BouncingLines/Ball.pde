public class Ball
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

  void checkIfHitDownWall()
  {
    //final Point
    if (XfinalPosition + Xfdirection > wallDown.Xposition && 
      YfinalPosition + Xfdirection < wallDown.Xposition + wallDown.widthWall && 
      YfinalPosition > wallDown.Yposition &&
      YfinalPosition < wallDown.Yposition + wallDown.heightWall)
    {
      Xfdirection *= -1;
      
    } else if (XfinalPosition < 0 || XfinalPosition > width || XfinalPosition < contador.contadorWidth)
    {
      Xfdirection *= -1;
      
    }

    if (XfinalPosition > wallDown.Xposition &&
      XfinalPosition < wallDown.Xposition + wallDown.widthWall &&
      YfinalPosition + Yfdirection > wallDown.Yposition &&
      YfinalPosition + Yfdirection < wallDown.Yposition + wallDown.heightWall)
    {
      Yfdirection *= -1;
      contador.hitInWall = contador.hitInWall + 1;
      
    } else if (YfinalPosition < 0 || YfinalPosition > height)
    {
      Yfdirection *= -1;
      contador.hitInWall = contador.hitInWall + 1;
      
    }
    //middle Point
    if (XmiddlePosition + Xmdirection > wallDown.Xposition && 
      YmiddlePosition + Xmdirection < wallDown.Xposition + wallDown.widthWall && 
      YmiddlePosition > wallDown.Yposition &&
      YmiddlePosition < wallDown.Yposition + wallDown.heightWall)
    {
      Xmdirection *= -1;
    } else if (XmiddlePosition < 0 || XmiddlePosition > width || XmiddlePosition < contador.contadorWidth)
    {
      Xmdirection *= -1;
    }

    if (XmiddlePosition > wallDown.Xposition &&
      XmiddlePosition < wallDown.Xposition + wallDown.widthWall &&
      YmiddlePosition + Ymdirection > wallDown.Yposition &&
      YmiddlePosition + Ymdirection < wallDown.Yposition + wallDown.heightWall)
    {
      Ymdirection *= -1;
    } else if (YmiddlePosition < 0 || YmiddlePosition > height)
    {
      Ymdirection *= -1;
    }
    //initial point
    if (XinitialPosition + Xidirection > wallDown.Xposition && 
      YinitialPosition + Xidirection < wallDown.Xposition + wallDown.widthWall && 
      YinitialPosition > wallDown.Yposition &&
      YinitialPosition < wallDown.Yposition + wallDown.heightWall)
    {
      Xidirection *= -1;
    } else if (XinitialPosition < 0 || XinitialPosition > width || XinitialPosition < contador.contadorWidth)
    {
      Xidirection *= -1;
    }

    if (XinitialPosition > wallDown.Xposition &&
      XinitialPosition < wallDown.Xposition + wallDown.widthWall &&
      YinitialPosition + Yidirection > wallDown.Yposition &&
      YinitialPosition + Yidirection < wallDown.Yposition + wallDown.heightWall)
    {
      Yidirection *= -1;
    } else if (YinitialPosition < 0 || YinitialPosition > height)
    {
      Yidirection *= -1;
    }
  }

  void checkIfHitRightWall()
  {
    //final Point
    if (XfinalPosition + Xfdirection > wallRight.Xposition && 
      YfinalPosition + Xfdirection < wallRight.Xposition + wallRight.widthWall && 
      YfinalPosition > wallRight.Yposition &&
      YfinalPosition < wallRight.Yposition + wallRight.heightWall)
    {
      Xfdirection *= -1;
      contador.hitInWall = contador.hitInWall + 1;
      
    } else if (XfinalPosition < 0 || XfinalPosition > width || XfinalPosition < contador.contadorWidth)
    {
      Xfdirection *= -1;
      contador.hitInWall = contador.hitInWall + 1;
      
    }

    if (XfinalPosition > wallRight.Xposition &&
      XfinalPosition < wallRight.Xposition + wallRight.widthWall &&
      YfinalPosition + Yfdirection > wallRight.Yposition &&
      YfinalPosition + Yfdirection < wallRight.Yposition + wallRight.heightWall)
    {
      Yfdirection *= -1;
      
    } else if (YfinalPosition < 0 || YfinalPosition > height)
    {
      Yfdirection *= -1;
      
    }
    //middle Point
    if (XmiddlePosition + Xmdirection > wallRight.Xposition && 
      YmiddlePosition + Xmdirection < wallRight.Xposition + wallRight.widthWall && 
      YmiddlePosition > wallRight.Yposition &&
      YmiddlePosition < wallRight.Yposition + wallRight.heightWall)
    {
      Xmdirection *= -1;
    } else if (XmiddlePosition < 0 || XmiddlePosition > width || XmiddlePosition < contador.contadorWidth)
    {
      Xmdirection *= -1;
    }

    if (XmiddlePosition > wallRight.Xposition &&
      XmiddlePosition < wallRight.Xposition + wallRight.widthWall &&
      YmiddlePosition + Ymdirection > wallRight.Yposition &&
      YmiddlePosition + Ymdirection < wallRight.Yposition + wallRight.heightWall)
    {
      Ymdirection *= -1;
    } else if (YmiddlePosition < 0 || YmiddlePosition > height)
    {
      Ymdirection *= -1;
    }
    //initial point
    if (XinitialPosition + Xidirection > wallRight.Xposition && 
      YinitialPosition + Xidirection < wallRight.Xposition + wallRight.widthWall && 
      YinitialPosition > wallRight.Yposition &&
      YinitialPosition < wallRight.Yposition + wallRight.heightWall)
    {
      Xidirection *= -1;
    } else if (XinitialPosition < 0 || XinitialPosition > width || XinitialPosition < contador.contadorWidth)
    {
      Xidirection *= -1;
    }

    if (XinitialPosition > wallRight.Xposition &&
      XinitialPosition < wallRight.Xposition + wallRight.widthWall &&
      YinitialPosition + Yidirection > wallRight.Yposition &&
      YinitialPosition + Yidirection < wallRight.Yposition + wallRight.heightWall)
    {
      Yidirection *= -1;
    } else if (YinitialPosition < 0 || YinitialPosition > height)
    {
      Yidirection *= -1;
    }
  }

  void checkIfHitUpWall()
  {
    //final Point
    if (XfinalPosition + Xfdirection > wallUp.Xposition && 
      YfinalPosition + Xfdirection < wallUp.Xposition + wallUp.widthWall && 
      YfinalPosition > wallUp.Yposition &&
      YfinalPosition < wallUp.Yposition + wallUp.heightWall)
    {
      Xfdirection *= -1;
      
    } else if (XfinalPosition < 0 || XfinalPosition > width || XfinalPosition < contador.contadorWidth)
    {
      Xfdirection *= -1;
      
    }

    if (XfinalPosition > wallUp.Xposition &&
      XfinalPosition < wallUp.Xposition + wallUp.widthWall &&
      YfinalPosition + Yfdirection > wallUp.Yposition &&
      YfinalPosition + Yfdirection < wallUp.Yposition + wallUp.heightWall)
    {
      Yfdirection *= -1;
      contador.hitInWall = contador.hitInWall + 1;
      
    } else if (YfinalPosition < 0 || YfinalPosition > height)
    {
      Yfdirection *= -1;
      contador.hitInWall = contador.hitInWall + 1;
      
    }
    //middle Point
    if (XmiddlePosition + Xmdirection > wallUp.Xposition && 
      YmiddlePosition + Xmdirection < wallUp.Xposition + wallUp.widthWall && 
      YmiddlePosition > wallUp.Yposition &&
      YmiddlePosition < wallUp.Yposition + wallUp.heightWall)
    {
      Xmdirection *= -1;
    } else if (XmiddlePosition < 0 || XmiddlePosition > width || XmiddlePosition < contador.contadorWidth)
    {
      Xmdirection *= -1;
    }

    if (XmiddlePosition > wallUp.Xposition &&
      XmiddlePosition < wallUp.Xposition + wallUp.widthWall &&
      YmiddlePosition + Ymdirection > wallUp.Yposition &&
      YmiddlePosition + Ymdirection < wallUp.Yposition + wallUp.heightWall)
    {
      Ymdirection *= -1;
    } else if (YmiddlePosition < 0 || YmiddlePosition > height)
    {
      Ymdirection *= -1;
    }
    //initial point
    if (XinitialPosition + Xidirection > wallUp.Xposition && 
      YinitialPosition + Xidirection < wallUp.Xposition + wallUp.widthWall && 
      YinitialPosition > wallUp.Yposition &&
      YinitialPosition < wallUp.Yposition + wallUp.heightWall)
    {
      Xidirection *= -1;
    } else if (XinitialPosition < 0 || XinitialPosition > width || XinitialPosition < contador.contadorWidth)
    {
      Xidirection *= -1;
    }

    if (XinitialPosition > wallUp.Xposition &&
      XinitialPosition < wallUp.Xposition + wallUp.widthWall &&
      YinitialPosition + Yidirection > wallUp.Yposition &&
      YinitialPosition + Yidirection < wallUp.Yposition + wallUp.heightWall)
    {
      Yidirection *= -1;
    } else if (YinitialPosition < 0 || YinitialPosition > height)
    {
      Yidirection *= -1;
    }
  }

  void move()
  {
    XinitialPosition = XinitialPosition + Xidirection;
    YinitialPosition = YinitialPosition + Yidirection;

    XmiddlePosition = XmiddlePosition + Xmdirection;
    YmiddlePosition = YmiddlePosition + Ymdirection;

    XfinalPosition = XfinalPosition + Xfdirection;
    YfinalPosition = YfinalPosition + Yfdirection;
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
    if (XinitialPosition > width)
    {
      Xidirection *= -1;
    } else if ((XinitialPosition < 0)||(XinitialPosition < contador.contadorWidth))
    {
      Xidirection *= -1;
    }
    if (YinitialPosition > height)
    {
      Yidirection *= -1;
    } else if (YinitialPosition < 0)
    {
      Yidirection *= -1;
    }

    if (XmiddlePosition > width)
    {
      Xmdirection *= -1;
    } else if ((XmiddlePosition < 0)||(XmiddlePosition < contador.contadorWidth))
    {
      Xmdirection *= -1;
    }
    if (YmiddlePosition > height)
    {
      Ymdirection *= -1;
    } else if (YmiddlePosition < 0)
    {
      Ymdirection *= -1;
    }

    if (XfinalPosition > width)
    {
      Xfdirection *= -1;
      contador.hitInWall = contador.hitInWall +1;
    } else if ((XfinalPosition < 0)||(XfinalPosition < contador.contadorWidth))
    {
      Xfdirection *= -1;
      contador.hitInWall = contador.hitInWall +1;
    }
    if (YfinalPosition > height)
    {
      Yfdirection *= -1;
      contador.hitInWall = contador.hitInWall +1;
    } else if (YfinalPosition < 0)
    {
      Yfdirection *= -1;
      contador.hitInWall = contador.hitInWall +1;
    }
  }
}
