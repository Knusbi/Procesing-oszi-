class Fgen{
  
  float[] sin = new float[1000];
  
  float freq;
  float amp;
  
  int i, j;
  

 
  Fgen()
  {
    i = 0;
    j = 0;
    
    freq = 0.03;
    amp = 220;
  }
  /*
  void gensin()
  {
   vmin = 0;
    vmax = 0;
    
    for(i = 0; i < 999; i++)
    {
      sin[i] = sin(i * freq) * amp;
            
      if(sin[i] < vmin)
      {
        vmin = sin[i];
        vmint = i;
      }
   
      
      if(sin[i] > vmax)
      {
        vmax = sin[i];
        vmaxt = i;
      }
  }
  }
  
  
  void drawsin()
  {
        for(i = 0; i < 999; i++)
    {
      if((i) < WW  && (sin[i]) <  (WH / 2) && (sin[i]) > -(WH / 2) && (sin[i + 1] ) <  (WH / 2) && (sin[i + 1]) > -(WH / 2))
    {
      stroke(funccolor[0], funccolor[1], funccolor[2]);
      line(WX + i, WY + (WH / 2) + sin[i], WX + 1 + i, WY + (WH / 2) + sin[i + 1]);
    }
    }
    
  }
  */
}
