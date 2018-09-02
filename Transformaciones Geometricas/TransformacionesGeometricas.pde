//Transformaciones Geometricas
//Este programa rota, escala y traslada una figura que previamente recibe sus puntos con el mouse para ser dibujada

import java.util.*;
import interfascia.*;

//Variables globales
Vector listPoints = new Vector(5, 1);
Vector listPointsCenter = new Vector(5, 1);
Vector listPointsRotate = new Vector(5, 1);
boolean flagPoints = false, flagRotate = false;
GUIController c;
IFButton b1, b2;
Point diff;

void setup(){
    size(600, 600);
    background(0);
    stroke(255, 0, 0);    
    //Añadir interfaz
    c = new GUIController(this);
    b1 = new IFButton("Trasladar al centro", 20, 570, 140, 20);
    b1.addActionListener(this);
    c.add(b1);
}

//Clase punto para manejar puntos
class Point{
  int x;
  int y;
  //Constructor
  Point(int a, int b){
    x = a;
    y = b;
  }
  //Suma la diferencia para centrar la figura
  void addDiff(Point diff){
    x = x + diff.x;
    y = y + diff.y;
  }
  //Rota la figura regresando al origen del programa y luego centrandolo
  void addRotate(int degree, Point diff){
    float rad = (PI*(degree*-1))/180;
    float rX = round(x-300)*cos(rad)-round(y-300)*sin(rad);
    float rY = round(x-300)*sin(rad)+round(y-300)*cos(rad);
    x = (int)rX+300;
    y = (int)rY+300;
  }
}

//Dibuja el plano cartesiano
void drawCartesian(){
  stroke(255);
  strokeWeight(1);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}

//Crear un punto
Point addPoint(int x, int y){
  Point newPoint = new Point(x, y);
  return newPoint;
}

//Mandar el centro al origen
Point findCenter(Point actual){
  Point newP = new Point((width/2)-actual.x, (height/2)-actual.y);
  return newP;
}

//Cambiar los puntos al origen
void generateCenter(Point diffCenter){
    for(int i = 0; i < listPoints.size(); i++){
       Point conv = (Point)listPoints.elementAt(i);
       conv.addDiff(diffCenter);
       listPointsCenter.addElement(conv);
    }
}

//Rotar los puntos
void generateRotation(int degree, Point diff){
    for(int i = 0; i < listPointsCenter.size(); i++){
       Point conv = (Point)listPointsCenter.elementAt(i);
       conv.addRotate(degree, diff);
       listPointsRotate.addElement(conv);
    }
}

//Dibujar los puntos
void draw(){
  drawCartesian();
  if(listPoints.size() > 1){
     if(flagPoints == false){
       //Dibujar puntos originales
       int addTotalX = 0;
       int addTotalY = 0;
       float aveX, aveY;
       int size = listPoints.size();
       stroke(255);
       strokeWeight(1);
       for(int i = 0; i < size-1; i++){
           Point actual = (Point)listPoints.elementAt(i);
           Point next = (Point)listPoints.elementAt(i+1);
           line(actual.x, actual.y, next.x, next.y);
           
           addTotalX = addTotalX + actual.x;
           addTotalY = addTotalY + actual.y;
           
       }
       //centroide de la figura
       Point actual = (Point)listPoints.elementAt(size-1);
       Point next = (Point)listPoints.elementAt(0);
       line(actual.x, actual.y, next.x, next.y);
       addTotalX = addTotalX + actual.x;
       addTotalY = addTotalY + actual.y;
       aveX = addTotalX/size;
       aveY = addTotalY/size;
       stroke(255, 0, 0);
       strokeWeight(4);
       point(aveX, aveY);
       //Creacion de diferencia
       Point originalCenter = new Point((int)aveX, (int)aveY);
       diff = findCenter(originalCenter);
     }else{
       if(flagRotate == false){
         //Dibujar puntos en origen
         int addTotalX = 0;
         int addTotalY = 0;
         float aveX, aveY;
         int size = listPointsCenter.size();
         stroke(255);
         strokeWeight(1);
         for(int i = 0; i < size-1; i++){
             Point actual = (Point)listPointsCenter.elementAt(i);
             Point next = (Point)listPointsCenter.elementAt(i+1);
             line(actual.x, actual.y, next.x, next.y);      
             
             addTotalX = addTotalX + actual.x;
             addTotalY = addTotalY + actual.y;   
         }
         Point actual = (Point)listPointsCenter.elementAt(size-1);
         Point next = (Point)listPointsCenter.elementAt(0);
         line(actual.x, actual.y, next.x, next.y);
         addTotalX = addTotalX + actual.x;
         addTotalY = addTotalY + actual.y;
         aveX = addTotalX/size;
         aveY = addTotalY/size;
         stroke(255, 0, 0);
         strokeWeight(4);
         point(aveX, aveY);
         Point originalCenter = new Point((int)aveX-300, (int)aveY-300);
         
         point(originalCenter.x, originalCenter.y);
       }else{
         //Dibujar puntos rotados
         int addTotalX = 0;
         int addTotalY = 0;
         float aveX, aveY;
         int size = listPointsRotate.size();
         stroke(255);
         strokeWeight(1);
         for(int i = 0; i < size-1; i++){
             Point actual = (Point)listPointsRotate.elementAt(i);
             Point next = (Point)listPointsRotate.elementAt(i+1);
             line(actual.x, actual.y, next.x, next.y);      
             
             addTotalX = addTotalX + actual.x;
             addTotalY = addTotalY + actual.y;   
         }
         Point actual = (Point)listPointsRotate.elementAt(size-1);
         Point next = (Point)listPointsRotate.elementAt(0);
         line(actual.x, actual.y, next.x, next.y);
         addTotalX = addTotalX + actual.x;
         addTotalY = addTotalY + actual.y;
         aveX = addTotalX/size;
         aveY = addTotalY/size;
         stroke(255, 0, 0);
         strokeWeight(4);
         point(aveX, aveY);
       }
     }
  }
}

//Clic de mouse para añadir 
void mouseClicked(){
   if(flagPoints == false){
      listPoints.addElement(addPoint(mouseX, mouseY));
       background(0);
       drawCartesian();
   }
}

//Ejecuta las opciones de la interfaz
void actionPerformed(GUIEvent e){
  if(e.getSource() == b1){
    flagPoints = true;
    //Remueve el componente del CANVAS
    c.remove(b1);
    //Redibuja el CANVAS para ocultar el boton
    background(0);
    b2 = new IFButton("Rotar", 500, 570, 70, 20);
    b2.addActionListener(this);
    c.add(b2);
    generateCenter(diff);
  }
  if(e.getSource() == b2){
    flagRotate= true;
    background(0);
    //Se genera la rotacion
    generateRotation(90, diff);
  }
}
