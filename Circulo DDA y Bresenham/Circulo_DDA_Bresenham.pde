//Bresenham & ADD
//Algoritmo del circulo

import interfascia.*;

//Variables para controlar los botones
GUIController control;
IFButton boton1, boton2, boton3;
IFLabel etiqueta;

//Variables Globales
int xActual, yActual, xInicial, yInicial, radio, paso = 1, algoritmo = 3;
float xActualD, yActualD, pK;
long tiempoInicial = 0, tiempoFinal = 0, tiempoTotal = 0, tiempoTotalD = 0;
boolean tiempo = false;

void setup() {  // setup() runs once
  control = new GUIController(this);
  boton1 = new IFButton("Bresenham", 50, 615, 100, 20);
  boton2 = new IFButton("ADD", 250, 615, 100, 20);
  boton3 = new IFButton("Ambos", 450, 615, 100, 20);
  
  boton1.addActionListener(this);
  boton2.addActionListener(this);
  boton3.addActionListener(this);
  control.add(boton1);
  control.add(boton2);
  control.add(boton3);

  noSmooth();
  size(600, 700);
  frameRate(50);
  background(192);
}

int xCentral(int j){
  return j + xInicial;
}

int yCentral(int k){
  return k + yInicial;
}

float xCentralD(float j){
  return j + xInicial;
}

float yCentralD(float k){
  return k + yInicial;
}

void dibujarPuntosSimetricos(){
    point(xCentral(xActual), yCentral(yActual));
    point(xCentral(xActual), yCentral(-yActual));
    point(xCentral(-xActual), yCentral(yActual));
    point(xCentral(-xActual), yCentral(-yActual));
    point(xCentral(yActual), yCentral(xActual));
    point(xCentral(yActual), yCentral(-xActual));
    point(xCentral(-yActual), yCentral(xActual));
    point(xCentral(-yActual), yCentral(-xActual));
}

void draw() {
  background(192);
  fill(0, 0, 0);
  switch(paso){
    case 1:
      text("Aún no hay ningún punto seleccionado", 50, 660);
      break;
      
    case 2:
      text("X Inicial: ", 50, 660);
      text(xInicial, 100, 660);
      text("Y Inicial: ", 150, 660);
      text(yInicial, 200, 660);
      break;
      
    case 3:
      text("X Inicial: ", 50, 660);
      text(xInicial, 100, 660);
      text("Y Inicial: ", 150, 660);
      text(yInicial, 200, 660);
      text("Radio: ", 250, 660);
      text(radio, 300, 660);
      
      switch(algoritmo){
          case 1:
            stroke(255, 0, 0);
            tiempoInicial = millis();
            algoritmoBresenham();
            tiempoFinal = millis();
            if(tiempo == false){
              tiempoTotal = tiempoFinal-tiempoInicial;
              tiempo = true;
            }
            text("T Bresenham: ", 350, 660);
            text(tiempoTotal, 450, 660);
            break;
            
          case 2:
            stroke(0, 0, 255);
            tiempoInicial = millis();
            algoritmoADD();
            tiempoFinal = millis();
            if(tiempo == false){
              tiempoTotalD = tiempoFinal-tiempoInicial;
              tiempo = true;
            }
            text("T ADD: ", 450, 660);
            text(tiempoTotalD, 500, 660);
            break;
            
          case 3:
            stroke(0, 0, 255);
            tiempoInicial = millis();
            algoritmoADD();
            tiempoFinal = millis();
            if(tiempo == false){
              tiempoTotalD = tiempoFinal-tiempoInicial;
            }
            text("T ADD: ", 350, 680);
            text(tiempoTotalD, 400, 680);
            stroke(255, 0, 0);
            tiempoInicial = millis();
            algoritmoBresenham();
            tiempoFinal = millis();
            if(tiempo == false){
              tiempoTotal = tiempoFinal-tiempoInicial;
              tiempo = true;
            }
            text("T Bresenham: ", 350, 660);
            text(tiempoTotal, 450, 660);
            break;
      }

      break;
      
      default:
        break;
  }
}

void mouseClicked(){
   switch(paso){
     case 1:
       paso = 2;
       xInicial = mouseX;
       yInicial = mouseY;
       if(yInicial > 600){
          yInicial = 600; 
       }
       break;
       
    case 2:
       paso = 3;
       int yTmp = mouseY;
       if(yTmp > 600){
          yTmp = 600; 
       }
       radio = round(sqrt(pow(mouseX-xInicial, 2)+pow(yTmp-yInicial, 2)));
       break;
       
    default:
       break;
       
   }
}

void actionPerformed(GUIEvent event){
  if(event.getSource() == boton1){
    algoritmo = 1;
    tiempo = false;
  }else if(event.getSource() == boton2){
    algoritmo = 2;
    tiempo = false;
  }else if(event.getSource() == boton3){
    algoritmo = 3;
    tiempo = false;
  }
}

void algoritmoBresenham(){
  xActual = 0;
  yActual = radio;
  pK = 1 - radio;
  do{
    if(xActual <= yActual){
      dibujarPuntosSimetricos();
      xActual++;
      if(pK <= 0){
        pK = pK + (2*xActual) + 1;
      }
      else {
        yActual--;
        pK = pK + ((2*xActual)-(2*yActual))+1;
      }
    }
  }while(xActual <= yActual);
}
//theta = angulo
void algoritmoADD(){
  float theta = 0.0;
  do{
    xActualD = xCentralD(radio*cos(theta));
    yActualD = yCentralD(radio*sin(theta));
    point(xActualD, yActualD);
    theta = theta + 0.001;
  }while(theta <= TWO_PI);
}