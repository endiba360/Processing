//Curva de Bezier


import interfascia.*;

class Bezier{
  ArrayList<PVector> puntosIniciales;
  ArrayList<PVector> puntosCurva;
  ArrayList<PVector> puntosCurvaMatriz;
  
  Bezier(){
      puntosIniciales = new ArrayList<PVector>();
      puntosCurva = new ArrayList<PVector>();
      puntosCurvaMatriz = new ArrayList<PVector>();
  }
  
  PVector funcionCu(PVector p1, PVector p2, double u) {
     int newX = (int)((1-u)*p1.x + u*p2.x);
     int newY = (int)((1-u)*p1.y + u*p2.y);
     PVector q = new PVector(newX, newY);
     return q;
  }
  
  PVector bezierCuadraticoEcuacion(PVector p1, PVector p2, PVector p3, double u){
     PVector Q1 = funcionCu(p1, p2, u);
     PVector Q2 = funcionCu(p2, p3, u);
     if(tiempo == false){
       stroke(#9BE434);
       line(Q1.x, Q1.y, Q2.x, Q2.y);
     }
     PVector Cu = funcionCu(Q1, Q2, u);
     return Cu;
  }
  
  PVector bezierCubicoEcuacion(PVector p1, PVector p2, PVector p3, PVector p4, double u){
     PVector Q1 = funcionCu(p1, p2, u);
     PVector Q2 = funcionCu(p2, p3, u);
     PVector Q3 = funcionCu(p3, p4, u);
     PVector T1 = funcionCu(Q1, Q2, u);
     PVector T2 = funcionCu(Q2, Q3, u);
     if(tiempo == false){
       stroke(#9BE434);
       line(Q1.x, Q1.y, Q2.x, Q2.y);
       line(Q2.x, Q2.y, Q3.x, Q3.y);
       stroke(#9BE434);
       line(T1.x, T1.y, T2.x, T2.y);
     }
     PVector Cu = funcionCu(T1, T2, u);
     return Cu;
  }
  
  PVector bezierCuartaEcuacion(PVector p1, PVector p2, PVector p3, PVector p4, PVector p5, double u){
     PVector Q1 = funcionCu(p1, p2, u);
     PVector Q2 = funcionCu(p2, p3, u);
     PVector Q3 = funcionCu(p3, p4, u);
     PVector Q4 = funcionCu(p4, p5, u);
     PVector T1 = funcionCu(Q1, Q2, u);
     PVector T2 = funcionCu(Q2, Q3, u);
     PVector T3 = funcionCu(Q3, Q4, u);
     PVector W1 = funcionCu(T1, T2, u);
     PVector W2 = funcionCu(T2, T3, u);
     if(tiempo == false){
       stroke(#9BE434);
       line(Q1.x, Q1.y, Q2.x, Q2.y);
       line(Q2.x, Q2.y, Q3.x, Q3.y);
       line(Q3.x, Q3.y, Q4.x, Q4.y);
       stroke(#9BE434);
       line(T1.x, T1.y, T2.x, T2.y);
       line(T2.x, T2.y, T3.x, T3.y);
       stroke(#9BE434);
       line(W1.x, W1.y, W2.x, W2.y);
     }
     PVector Cu = funcionCu(W1, W2, u);
     return Cu;
  }
  
  PVector bezierLinealMatriz(PVector p1, PVector p2, double u){
    PVector[] puntos = new PVector[2];
    puntos[0] = p1;
    puntos[1] = p2;
    
    PVector[] vectorResultante = new PVector[2];
    vectorResultante[0] = new PVector(0, 0);
    vectorResultante[1] = new PVector(0, 0);
    
    for(int i = 0; i < 2; i++){
      for(int j = 0; j < 2; j++){
        PVector aux = puntos[j];
        vectorResultante[i].x = vectorResultante[i].x + (aux.x*matrizMLineal[i][j]);
        vectorResultante[i].y = vectorResultante[i].y + (aux.y*matrizMLineal[i][j]);
      }
    }
    
    PVector puntoResultante = new PVector(0, 0);
    float[] vectorFinal = new float[2];
    vectorFinal[0] = (float)u;
    vectorFinal[1] = 1;
    
    for(int i = 0; i < 2; i++){
      puntoResultante.x = puntoResultante.x + (vectorResultante[i].x*vectorFinal[i]);
      puntoResultante.y = puntoResultante.y + (vectorResultante[i].y*vectorFinal[i]);
    }
    
    return puntoResultante;
  }
  
  PVector bezierCuadraticoMatriz(double u){
    PVector[] vectorResultante = new PVector[3];
    vectorResultante[0] = new PVector(0, 0);
    vectorResultante[1] = new PVector(0, 0);
    vectorResultante[2] = new PVector(0, 0);
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        PVector aux = puntosIniciales.get(j);
        vectorResultante[i].x = vectorResultante[i].x + (aux.x*matrizMCuadratico[i][j]);
        vectorResultante[i].y = vectorResultante[i].y + (aux.y*matrizMCuadratico[i][j]);
      }
    }
    
    PVector puntoResultante = new PVector(0, 0);
    float[] vectorFinal = new float[3];
    vectorFinal[0] = (float)u*(float)u;
    vectorFinal[1] = (float)u;
    vectorFinal[2] = 1;
    
    for(int i = 0; i < 3; i++){
      puntoResultante.x = puntoResultante.x + (vectorResultante[i].x*vectorFinal[i]);
      puntoResultante.y = puntoResultante.y + (vectorResultante[i].y*vectorFinal[i]);
    }
    
    if(tiempo == false){
      stroke(#00FF00);
      PVector tmp1 = bezierLinealMatriz(puntosIniciales.get(0), puntosIniciales.get(1), u);
      PVector tmp2 = bezierLinealMatriz(puntosIniciales.get(1), puntosIniciales.get(2), u);
      line(tmp1.x, tmp1.y, tmp2.x, tmp2.y);
    }
    
    return puntoResultante;
  }  
  
  PVector bezierCubicoMatriz(double u){
    PVector[] vectorResultante = new PVector[4];
    vectorResultante[0] = new PVector(0, 0);
    vectorResultante[1] = new PVector(0, 0);
    vectorResultante[2] = new PVector(0, 0);
    vectorResultante[3] = new PVector(0, 0);
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        PVector aux = puntosIniciales.get(j);
        vectorResultante[i].x = vectorResultante[i].x + (aux.x*matrizMCubo[i][j]);
        vectorResultante[i].y = vectorResultante[i].y + (aux.y*matrizMCubo[i][j]);
      }
    }
    
    PVector puntoResultante = new PVector(0, 0);
    float[] vectorFinal = new float[4];
    vectorFinal[0] = (float)u*(float)u*(float)u;
    vectorFinal[1] = (float)u*(float)u;
    vectorFinal[2] = (float)u;
    vectorFinal[3] = 1;
    
    for(int i = 0; i < 4; i++){
      puntoResultante.x = int(puntoResultante.x + (vectorResultante[i].x*vectorFinal[i]));
      puntoResultante.y = int(puntoResultante.y + (vectorResultante[i].y*vectorFinal[i]));
    }
    
    if(tiempo == false){
      stroke(#00FF00);
      PVector tmp1 = bezierLinealMatriz(puntosIniciales.get(0), puntosIniciales.get(1), u);
      PVector tmp2 = bezierLinealMatriz(puntosIniciales.get(1), puntosIniciales.get(2), u);
      PVector tmp3 = bezierLinealMatriz(puntosIniciales.get(2), puntosIniciales.get(3), u);
      line(tmp1.x, tmp1.y, tmp2.x, tmp2.y);
      line(tmp2.x, tmp2.y, tmp3.x, tmp3.y);
      stroke(#FF00FF);
      PVector tmp12 = bezierLinealMatriz(tmp1, tmp2, u);
      PVector tmp23 = bezierLinealMatriz(tmp2, tmp3, u);
      line(tmp12.x, tmp12.y, tmp23.x, tmp23.y);
    }
    
    return puntoResultante;
  }
  
  PVector bezierCuartaMatriz(double u){
    PVector[] vectorResultante = new PVector[5];
    vectorResultante[0] = new PVector(0, 0);
    vectorResultante[1] = new PVector(0, 0);
    vectorResultante[2] = new PVector(0, 0);
    vectorResultante[3] = new PVector(0, 0);
    vectorResultante[4] = new PVector(0, 0);
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 5; j++){
        PVector aux = puntosIniciales.get(j);
        vectorResultante[i].x = vectorResultante[i].x + (aux.x*matrizMCuarta[i][j]);
        vectorResultante[i].y = vectorResultante[i].y + (aux.y*matrizMCuarta[i][j]);
      }
    }
    
    PVector puntoResultante = new PVector(0, 0);
    float[] vectorFinal = new float[5];
    vectorFinal[0] = (float)u*(float)u*(float)u*(float)u;
    vectorFinal[1] = (float)u*(float)u*(float)u;
    vectorFinal[2] = (float)u*(float)u;
    vectorFinal[3] = (float)u;
    vectorFinal[4] = 1;
    
    for(int i = 0; i < 5; i++){
      puntoResultante.x = int(puntoResultante.x + (vectorResultante[i].x*vectorFinal[i]));
      puntoResultante.y = int(puntoResultante.y + (vectorResultante[i].y*vectorFinal[i]));
    }
    
    if(tiempo == false){
      stroke(#00FF00);
      PVector tmp1 = bezierLinealMatriz(puntosIniciales.get(0), puntosIniciales.get(1), u);
      PVector tmp2 = bezierLinealMatriz(puntosIniciales.get(1), puntosIniciales.get(2), u);
      PVector tmp3 = bezierLinealMatriz(puntosIniciales.get(2), puntosIniciales.get(3), u);
      PVector tmp4 = bezierLinealMatriz(puntosIniciales.get(3), puntosIniciales.get(4), u);
      line(tmp1.x, tmp1.y, tmp2.x, tmp2.y);
      line(tmp2.x, tmp2.y, tmp3.x, tmp3.y);
      line(tmp3.x, tmp3.y, tmp4.x, tmp4.y);
      stroke(#FF00FF);
      PVector tmp12 = bezierLinealMatriz(tmp1, tmp2, u);
      PVector tmp23 = bezierLinealMatriz(tmp2, tmp3, u);
      PVector tmp34 = bezierLinealMatriz(tmp3, tmp4, u);
      line(tmp12.x, tmp12.y, tmp23.x, tmp23.y);
      line(tmp23.x, tmp23.y, tmp34.x, tmp34.y);
      stroke(#FF0000);
      PVector tmp1223 = bezierLinealMatriz(tmp12, tmp23, u);
      PVector tmp2334 = bezierLinealMatriz(tmp23, tmp34, u);
      line(tmp1223.x, tmp1223.y, tmp2334.x, tmp2334.y);
    }
    
    return puntoResultante;
  }
}

  //Variables Globales
  boolean flagCurva = false, flagBoton = false, flagMatriz = false, tiempo = false, inicio = true;
  float j = 0, uPlus;
  int algoritmo = 0;
  long tiempoTotal = 0, tiempoInicial = 0, tiempoFinal = 0;
  Bezier proceso = new Bezier();
  PVector p1 = new PVector(0, 0);
  PVector p2 = new PVector(0, 0);
  PVector p3 = new PVector(0, 0);
  PVector p4 = new PVector(0, 0);
  PVector p5 = new PVector(0, 0);
  
  GUIController controlador;
  IFTextField p1x, p1y, p2x, p2y, p3x, p3y, p4x, p4y, p5x, p5y, u;
  IFLabel p1xL, p1yL, p2xL, p2yL, p3xL, p3yL, p4xL, p4yL, p5xL, p5yL, uL, modo, tiempoEcuacion, tiempoMatriz;
  IFButton boton1, boton2, boton3, boton4, boton5;
  
  int[][] matrizMLineal = { {-1, 1}, {1, 0} };
  int[][] matrizMCuadratico = { {1, -2, 1}, {-2, 2, 0}, {1, 0, 0} };
  int[][] matrizMCubo = { {-1, 3, -3, 1}, {3, -6, 3, 0}, {-3, 3, 0, 0}, {1, 0, 0, 0} };
  int[][] matrizMCuarta = { {1, -4, 6, -4, 1}, {-4, 12, -12, 4, 0}, {6, -12, 6, 0, 0}, {-4, 4, 0, 0, 0}, {1, 0, 0, 0, 0} };
    
void setup(){
  //Variables de ventana
  size(800, 605);
  background(#34D9E4);
  strokeWeight(2);
  frameRate(60);
  
  //Variables de campos de texto
  controlador = new GUIController(this);
  p1x = new IFTextField("P1 X", 605, 25, 75);
  p1y = new IFTextField("P1 Y", 705, 25, 75);
  p2x = new IFTextField("P2 X", 605, 75, 75);
  p2y = new IFTextField("P2 Y", 705, 75, 75);
  p3x = new IFTextField("P3 X", 605, 125, 75);
  p3y = new IFTextField("P3 Y", 705, 125, 75);
  p4x = new IFTextField("P4 X", 605, 175, 75);
  p4y = new IFTextField("P4 Y", 705, 175, 75);
  p5x = new IFTextField("P5 X", 605, 225, 75);
  p5y = new IFTextField("P5 Y", 705, 225, 75);
  u = new IFTextField("P5 Y", 605, 275, 75);
  
  p1xL = new IFLabel("P1 X:", 605, 10);
  p1yL = new IFLabel("P1 Y:", 705, 10);
  p2xL = new IFLabel("P2 X:", 605, 60);
  p2yL = new IFLabel("P2 Y:", 705, 60);
  p3xL = new IFLabel("P3 X:", 605, 110);
  p3yL = new IFLabel("P3 Y:", 705, 110);
  p4xL = new IFLabel("P4 X:", 605, 160);
  p4yL = new IFLabel("P4 Y:", 705, 160);
  p5xL = new IFLabel("P5 X:", 605, 210);
  p5yL = new IFLabel("P5 Y:", 705, 210);
  uL = new IFLabel("U:", 605, 260);
  modo = new IFLabel("MODO: DIBUJO", 705, 260);
  tiempoEcuacion = new IFLabel("TIEMPO ECUACION: ", 605, 525);
  tiempoMatriz = new IFLabel("TIEMPO MATRIZ:", 605, 575);
  
  boton1 = new IFButton("Iniciar Bezier Cuadrado", 605, 325, 185, 20);
  boton2 = new IFButton("Iniciar Bezier Cubico", 605, 375, 185, 20);
  boton3 = new IFButton("Iniciar Bezier Cuarta", 605, 425, 185, 20);
  boton4 = new IFButton("Reiniciar", 650, 475, 100, 20);
  boton5 = new IFButton("Cambiar Modo", 705, 275, 75, 20);
  
  p1x.addActionListener(this);
  p1y.addActionListener(this);
  p2x.addActionListener(this);
  p2y.addActionListener(this);
  p3x.addActionListener(this);
  p3y.addActionListener(this);
  p4x.addActionListener(this);
  p4y.addActionListener(this);
  p5x.addActionListener(this);
  p5y.addActionListener(this);
  u.addActionListener(this);
  
  boton1.addActionListener(this);
  boton2.addActionListener(this);
  boton3.addActionListener(this);
  boton4.addActionListener(this);
  boton5.addActionListener(this);
  
  controlador.add(p1x);
  controlador.add(p1y);
  controlador.add(p2x);
  controlador.add(p2y);
  controlador.add(p3x);
  controlador.add(p3y);
  controlador.add(p4x);
  controlador.add(p4y);
  controlador.add(p5x);
  controlador.add(p5y);
  controlador.add(u);
  
  controlador.add(p1xL);
  controlador.add(p1yL);
  controlador.add(p2xL);
  controlador.add(p2yL);
  controlador.add(p3xL);
  controlador.add(p3yL);
  controlador.add(p4xL);
  controlador.add(p4yL);
  controlador.add(p5xL);
  controlador.add(p5yL);
  controlador.add(uL);
  controlador.add(modo);
  controlador.add(tiempoEcuacion);
  controlador.add(tiempoMatriz);
  
  controlador.add(boton1);
  controlador.add(boton2);
  controlador.add(boton3);
  controlador.add(boton4);
  controlador.add(boton5);
}
  
//Funcionamiento de caja de texto
void actionPerformed(GUIEvent e){
  if(e.getSource() == boton1){
    flagBoton = true;
    proceso.puntosIniciales.add(new PVector(int(p1x.getValue()), int(p1y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p2x.getValue()), int(p2y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p3x.getValue()), int(p3y.getValue())));
    algoritmo = 1;
  }
  if(e.getSource() == boton2){
    flagBoton = true;
    proceso.puntosIniciales.add(new PVector(int(p1x.getValue()), int(p1y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p2x.getValue()), int(p2y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p3x.getValue()), int(p3y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p4x.getValue()), int(p4y.getValue())));
    algoritmo = 2;
  }
  if(e.getSource() == boton3){
    flagBoton = true;
    proceso.puntosIniciales.add(new PVector(int(p1x.getValue()), int(p1y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p2x.getValue()), int(p2y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p3x.getValue()), int(p3y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p4x.getValue()), int(p4y.getValue())));
    proceso.puntosIniciales.add(new PVector(int(p5x.getValue()), int(p5y.getValue())));
    algoritmo = 3;
  }
  
  if(e.getSource() == boton4){
    flagBoton = false;
    flagCurva = false;
    flagMatriz = false;
    j = 0;
    proceso = new Bezier();
    p1 = new PVector(0, 0);
    p2 = new PVector(0, 0);
    p3 = new PVector(0, 0);
    p4 = new PVector(0, 0);
    p5 = new PVector(0, 0);
    algoritmo = 0;
    p1x.setValue("");
    p1xL.setLabel("P1 X: "+p1x.getValue());
    p1y.setValue("");
    p1yL.setLabel("P1 Y: "+p1y.getValue());
    p2x.setValue("");
    p2xL.setLabel("P2 X: "+p2x.getValue());
    p2y.setValue("");
    p2yL.setLabel("P2 Y: "+p2y.getValue());
    p3x.setValue("");
    p3xL.setLabel("P3 X: "+p3x.getValue());
    p3y.setValue("");
    p3yL.setLabel("P3 Y: "+p3y.getValue());
    p4x.setValue("");
    p4xL.setLabel("P4 X: "+p4x.getValue());
    p4y.setValue("");
    p4yL.setLabel("P4 Y: "+p4y.getValue());
    p5x.setValue("");
    p5xL.setLabel("P5 X: "+p5x.getValue());
    p5y.setValue("");
    p5yL.setLabel("P5 Y: "+p5y.getValue());
    u.setValue("");
    uL.setLabel("U: "+u.getValue());
  }
  
  if(e.getSource() == boton5){
    tiempo = !tiempo;
    if(tiempo == false){
      modo.setLabel("MODO: DIBUJO");
    }else{
      modo.setLabel("MODO: TIEMPO");
    }
  }
  
  if(flagBoton == false && flagCurva == false){
      if(e.getMessage().equals("Completed")){
          if(e.getSource() == p1x){
            if(int(p1x.getValue()) > 599){
                p1x.setValue("599");
            }
            if(int(p1x.getValue()) < 1){
                p1x.setValue("1");
            }
            p1xL.setLabel("P1 X: "+p1x.getValue());
            p1.x = int(p1x.getValue());
          }
          
          if(e.getSource() == p1y){
            if(int(p1y.getValue()) > 599){
                p1y.setValue("599");
            }
            if(int(p1y.getValue()) < 1){
                p1y.setValue("1");
            }
            p1yL.setLabel("P1 Y: "+p1y.getValue());
            p1.y = int(p1y.getValue());
          }
          
          if(e.getSource() == p2x){
            if(int(p2x.getValue()) > 599){
                p2x.setValue("599");
            }
            if(int(p1x.getValue()) < 1){
                p2x.setValue("1");
            }
            p2xL.setLabel("P2 X: "+p2x.getValue());
            p2.x = int(p2x.getValue());
          }
          
          if(e.getSource() == p2y){
            if(int(p2y.getValue()) > 599){
                p2y.setValue("599");
            }
            if(int(p2y.getValue()) < 1){
                p2y.setValue("1");
            }
            p2yL.setLabel("P2 Y: "+p2y.getValue());
            p2.y = int(p2y.getValue());
          }
          
          if(e.getSource() == p3x){
            if(int(p3x.getValue()) > 599){
                p3x.setValue("599");
            }
            if(int(p3x.getValue()) < 1){
                p3x.setValue("1");
            }
            p3xL.setLabel("P3 X: "+p3x.getValue());
            p3.x = int(p3x.getValue());
          }
          
          if(e.getSource() == p3y){
            if(int(p3y.getValue()) > 599){
                p3y.setValue("599");
            }
            if(int(p3y.getValue()) < 1){
                p3y.setValue("1");
            }
            p3yL.setLabel("P3 Y: "+p3y.getValue());
            p3.y = int(p3y.getValue());
          }
          
          if(e.getSource() == p4x){
            if(int(p4x.getValue()) > 599){
                p4x.setValue("599");
            }
            if(int(p4x.getValue()) < 1){
                p4x.setValue("1");
            }
            p4xL.setLabel("P4 X: "+p4x.getValue());
            p4.x = int(p4x.getValue());
          }
          
          if(e.getSource() == p4y){
            if(int(p4y.getValue()) > 599){
                p4y.setValue("599");
            }
            if(int(p4y.getValue()) < 1){
                p4y.setValue("1");
            }
            p4yL.setLabel("P4 Y: "+p4y.getValue());
            p4.y = int(p4y.getValue());
          }
          
          if(e.getSource() == p5x){
            if(int(p5x.getValue()) > 599){
                p5x.setValue("599");
            }
            if(int(p5x.getValue()) < 1){
                p5x.setValue("1");
            }
            p5xL.setLabel("P5 X: "+p5x.getValue());
            p5.x = int(p5x.getValue());
          }
          
          if(e.getSource() == p5y){
            if(int(p5y.getValue()) > 599){
                p5y.setValue("599");
            }
            if(int(p5y.getValue()) < 1){
                p5y.setValue("1");
            }
            p5yL.setLabel("P5 Y: "+p5y.getValue());
            p5.y = int(p5y.getValue());
          }
          
          if(e.getSource() == u){
            if(float(u.getValue()) > 1){
                u.setValue("0.9999");
            }
            if(float(u.getValue()) < 0){
                u.setValue("0.0001");
            }
            uL.setLabel("U: "+u.getValue());
            uPlus = float(u.getValue());
          }
      }
  }
}
  
void draw(){
  fill(200);
  stroke(200);
  rect(595, 0, 205, 600);
  if(flagBoton == true){
      if(flagCurva == false){
         if(inicio == true && tiempo == true){
           tiempoInicial = millis();
           inicio = false;
         }
         background(#34D9E4);
         stroke(#9BE434);
         switch(algoritmo){
             case 1:
               line(p1.x, p1.y, p2.x, p2.y);
               line(p2.x, p2.y, p3.x, p3.y);
               proceso.puntosCurva.add(proceso.bezierCuadraticoEcuacion(p1, p2, p3, j));
             break;
             
             case 2:
               line(p1.x, p1.y, p2.x, p2.y);
               line(p2.x, p2.y, p3.x, p3.y);
               line(p3.x, p3.y, p4.x, p4.y);
               proceso.puntosCurva.add(proceso.bezierCubicoEcuacion(p1, p2, p3, p4, j));
             break;
             
             case 3:
               line(p1.x, p1.y, p2.x, p2.y);
               line(p2.x, p2.y, p3.x, p3.y);
               line(p3.x, p3.y, p4.x, p4.y);
               line(p4.x, p4.y, p5.x, p5.y);
               proceso.puntosCurva.add(proceso.bezierCuartaEcuacion(p1, p2, p3, p4, p5, j));
             break;
           
             default:
             break;
         }
         
         for(int k = 0; k < proceso.puntosCurva.size(); k++){
            stroke(#9BE434);
            PVector aux = proceso.puntosCurva.get(k);
            point(aux.x, aux.y);
         }
         j = j + uPlus;
         if(j > 1){
           flagCurva = true;
           j = 0;
           if(tiempo == true){
             inicio = true;
             tiempoFinal = millis();
             tiempoTotal = tiempoFinal-tiempoInicial;
             tiempoEcuacion.setLabel("TIEMPO ECUACION: "+str(tiempoTotal)+" miliseg");
           }
         }
         fill(200);
         stroke(200);
         rect(595, 0, 205, 600);
      }else{
         background(#34D9E4);
         if(flagMatriz == false){
           if(inicio == true && tiempo == true){
             tiempoInicial = millis();
             inicio = false;
           }
           background(#34D9E4);
           stroke(#9BE434);
           switch(algoritmo){
               case 1:
                 line(p1.x, p1.y, p2.x, p2.y);
                 line(p2.x, p2.y, p3.x, p3.y);
                 proceso.puntosCurvaMatriz.add(proceso.bezierCuadraticoMatriz(j));
               break;
               
               case 2:
                 line(p1.x, p1.y, p2.x, p2.y);
                 line(p2.x, p2.y, p3.x, p3.y);
                 line(p3.x, p3.y, p4.x, p4.y);
                 proceso.puntosCurvaMatriz.add(proceso.bezierCubicoMatriz(j));
               break;
               
               case 3:
                 line(p1.x, p1.y, p2.x, p2.y);
                 line(p2.x, p2.y, p3.x, p3.y);
                 line(p3.x, p3.y, p4.x, p4.y);
                 line(p4.x, p4.y, p5.x, p5.y);
                 proceso.puntosCurvaMatriz.add(proceso.bezierCuartaMatriz(j));
               break;
             
               default:
               break;
           }
           for(int k = 0; k < proceso.puntosCurvaMatriz.size(); k++){
              stroke(#000000);
              PVector aux = proceso.puntosCurvaMatriz.get(k);
              point(aux.x, aux.y);
           }
           j = j + uPlus;
           if(j > 1){
             flagMatriz = true;
             if(tiempo == true){
               inicio = true;
               tiempoFinal = millis();
               tiempoTotal = tiempoFinal-tiempoInicial;
               tiempoMatriz.setLabel("TIEMPO MATRIZ: "+str(tiempoTotal)+" miliseg");
             }
           }
           fill(200);
           stroke(200);
           rect(595, 0, 205, 600);
         }else{
           for(int k = 0; k < proceso.puntosCurva.size(); k++){
              stroke(#FF0000);
              PVector aux = proceso.puntosCurva.get(k);
              point(aux.x, aux.y);
           }
           for(int k = 0; k < proceso.puntosCurvaMatriz.size(); k++){
              stroke(#0000FF);
              PVector aux = proceso.puntosCurvaMatriz.get(k);
              point(aux.x, aux.y);
           }
           fill(200);
           stroke(200);
           rect(595, 0, 205, 600);
         }
      }
  }
}