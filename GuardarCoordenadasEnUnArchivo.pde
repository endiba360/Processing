class Log{
  private PrintWriter output; //Permite la creacion de archivos
  private String path = sketchPath(); //Variable para guardar ruta de archivos
  private String fileName; //Variable para el nombre del archivo
  private int id = 1; //id del archivo, se usa para renombrar
  
  //Constructor de la clase
  Log(String fileName){
    this.fileName = fileName; //Asignamos nombre del archivo
    if(exist(this.fileName)){ //Comprobamos si ya existe el nombre
      rename(); //Si es verdadero se llama a la funcion rename()
      output = createWriter(this.fileName); //Se crea el archivo con el nombre
    }
    else{
      output = createWriter(this.fileName); //Si no existe, se crea sin renombrar
    }
  }
  //Crea una lista de los archivos existentes en el directorio actual
  private String[] listFileNames(String dir){
  File file = new File(dir); //Crea un objeto de la clase File
  if(file.isDirectory()){ //Comprobamos que sea un directorio
    String names[] = file.list();
    return names;
  }else{
    return null; //en caso de que sea un archivo se regresa null
    }
  }
  //Comprobamos si el archivo ya existe
  private boolean exist(String fileName){ //Recibe como parametro el nombre
    String[] filenames = listFileNames(path); //llama a la funcion listFileNames para obtener la lista de archivos
    for(int x=0;x<=filenames.length-1;x++){//Se comprueba por medio de un for la existencia del archivo, recorre todo el vector
    if(fileName.equals(filenames[x])){ //Si el nombre de un archivo existe
    return true; // regresa verdadero
      }
    }
    return false; //regresa falso
  }
  //Renombra el archivo para no sobre escribir
  private void rename(){
  String newName=(split(fileName, ".")[0]+"_"+split(fileName, ".")[1]);//Al nombre original se le asigna un indicador haciendo uso del id
  if (exist(newName)){//Se comprueba si el archivo con el nuevo nombre existe
    id++;//Se incrementa id hasta que se encuentra un archivo inexistente
    rename();//Es recursiva en caso de que siga existiendo el nombre
    }else{
      fileName=newName;//Se regresa el nuevo nombre
      return;
    }
  }
  //Cierra el archivo para que sea utilizable
  public void close(){
    output.flush();//vaciamos el buffer de escritura
    output.close();//cerramos el archivo
  }
  //Escribe datos nuevos
  public void write(String data){
    output.print(data+";");//Concatena los datos nuevos y asigna fin de linea
  }
}//End Class

//-----------------------------------------//

//Uso de la clase Log
Log log;//Nuevo objeto de la clase log
int id=0;
int R,G,B;

void setup(){
  size(400,400);
  log= new Log("ejemplo.txt");//Creamos el nuevo archivo
}
void draw(){

}
void mousePressed(){
  R=(int) random(0,255);
  G=(int) random(0,255);
  B=(int) random(0,255);
  fill(color(R,G,B));
  ellipse(mouseX,mouseY,10,10);
  text(id,mouseX+7,mouseY+5);
  log.write(/*id+","+R+","+G+","+B+","+*/mouseX+","+mouseY);//Escribimos las coordenadas del punto
  id++;
}
void keyPressed(){
  switch(key){
    case 'c':
      log.close();//Cerramos el archivo al presionar "C"
      println("Archivo cerrado");
      break;
  }
}