//Bresenham & DDA
//Mid-Point Line Generator Algorithm
int xi, xf, xk, yi, yf, yk, Dx, Dy, pk, stepx, stepy, tiempoInicioB, tiempoFinalB, tiempoTotalB, tiempoInicioA, tiempoFinalA, tiempoTotalA; 
boolean punto1 = false, inicio = false, fin = false, finadd = false;
float xfd, xid, yfd, yid, xa, ya, m;
boolean yPlus, direccion, primero = true;

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  strokeWeight(1);
  frameRate(100);
}

void draw() {
  if (inicio==true&&fin==false) {
    if (Dx > Dy) {
      xk = xk + stepx;
      if (pk < 0) {
        pk = pk + (2*Dy);
      } else {
        yk = yk + stepy;
        pk = pk + (2*Dy) - (2*Dx);
      }
    } else {
      yk = yk + stepy;
      if (pk < 0) {
        pk = pk + (2*Dx);
      } else {
        xk = xk + stepx;
        pk = pk + (2*Dx) - (2*Dy);
      }
    }
    stroke(255, 0, 0);
    drawLine(xk, yk); 
    if (xk == xf || yk == yf) {
      fin = true;
      tiempoFinalB = millis();
      tiempoTotalB = tiempoFinalB - tiempoInicioB;
      tiempoInicioA = millis();
    }
  } else {
    if (inicio == true && finadd == false) {
      if (primero==true) {
        frameCount = 0;
        primero = false;
      }
      stroke(255);
      if (xfd != xid) {
        if (yfd != yid) {
          if (direccion == false) {
            if (m > -1 && m < 1) {
              xa = xid + frameCount;
              ya = round(m*(xa - xid) + yid);
              drawLine(xa, ya);
            } else {
              if (yPlus == false) {
                ya = yid - frameCount;
              } else {
                ya = yid + frameCount;
              }
              xa = round((ya - yid)/m + xid);
              drawLine(xa, ya);
            }
          } else {
            if (m > -1 && m < 1) {
              xa = xid - frameCount;
              ya = round(m*(xa - xid) + yid);
              drawLine(xa, ya);
            } else {
              if (yPlus == false) {
                ya = yid - frameCount;
              } else {
                ya = yid + frameCount;
              }
              xa = round((ya - yid)/m + xid);
              drawLine(xa, ya);
            }
          }
        }
      }
      if (xa == xf || ya == yf) {
        finadd = true;
        tiempoFinalA = millis();
        tiempoTotalA = tiempoFinalA - tiempoInicioA;
        textSize(18);
        text("Tiempo de ejecucion algoritmo Bresenham: "+tiempoTotalB, 10, 30); 
        text("Tiempo de ejecucion algoritmo Punto Pendiente: "+tiempoTotalA, 10, 60); 
        fill(255, 255, 255);
      }
    }
  }
}

void drawLine(int xk, int yk) {
  point(xk, yk);
}

void drawLine(float xa, float ya) {
  point(xa, ya);
}

void mouseClicked() {
  if (punto1 == false) {
    xi = mouseX;
    yi = mouseY;

    xid = mouseX;
    yid = mouseY;
    punto1 = true;
  } else {
    if (inicio == false) {
      xf = mouseX;
      yf = mouseY;
      inicio = true;
      Dx = (int)(xf - xi);
      Dy = (int)(yf - yi);
      xk = (int)xi;
      yk = (int)yi;
      pk = 2*Dy - Dx;
      drawLine(xk, yk);
      if (Dx < 0) {
        Dx = -Dx;
        stepx = -1;
      } else {
        stepx = 1;
      }
      if (Dy< 0) {
        Dy = -Dy;
        stepy = -1;
      } else {
        stepy = 1;
      }

      //ADD
      xfd = mouseX;
      yfd = mouseY;
      inicio = true;
      if (xfd != xid) {
        if (yfd != yid) {
          if (xid < xfd) {
            m = (yfd - yid)/(xfd - xid);
            direccion = false;
          } else {
            m = (yid - yfd)/(xid - xfd);
            direccion = true;
          }
        }
      }
      if (yid > yfd) {
        yPlus = false;
      } else {
        yPlus = true;
      }

      //TIEMPO
      tiempoInicioB = millis();
    }
  }
}