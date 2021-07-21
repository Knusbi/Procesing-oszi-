class Getcode{
  Button bgetcode;
  
  
 Getcode()
 {
   bgetcode = new Button(width - 185, height - 45, 180 , 40);
 }
  
  void d()
  {
    bgetcode.drawon("Arduino code");
  }
  
  void mc()
  {
   if(bgetcode.clicked() == true) 
   {
    link("https://github.com/Knusbi/Procesing-oszi-/blob/main/Arduino"); 
   }
  }
  
  
  
  
}
