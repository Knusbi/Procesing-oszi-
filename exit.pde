class Exit{
  Button bexit;
  
  int[] exitbbcolor = {232, 17, 35};              //exit Button background color (Red) 
  
 Exit()
 {
  bexit = new Button(width - 50, 0, 62, 35); 
   
 }
  
  void nomc()
  {
   if(bexit.clicked() == true)
   {
     fill(exitbbcolor[0], exitbbcolor[1], exitbbcolor[2]);
     noStroke();
     rect(width - 50, 0, 62, 35);
     
    
     strokeWeight(1);
     stroke(0);
     line(width - 18, 10, width - 28, 22);
     line(width - 28, 10, width - 18 , 22);
   }
   else
   {
     strokeWeight(1);
     stroke(255);
     line(width - 18, 10, width - 28, 22);
     line(width - 28, 10, width - 18 , 22); 
   }
  }
  
  void mc()
  {
   if(bexit.clicked() == true) exit();
  }
  
  
  
}
