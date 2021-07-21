class Freq{
  
  Button bp;                            //Button period duration
  Button herz;                          //Button Frequency in hz
  
  int i = 0;
  int gccount = 0;                      //counter
  int tp[] = {0,0};                     //Tiefpunkt
  int hp[] = {0,0};                     //Höhepunkt
  int vmin = 0;                         
  int vmax = 0;
  int pd = 0;                           //period duration
  float hz = 0;                         //Frequency in hz
  
  PImage everything;
  color cc;                                                                 //current collor 
  color gc = color(g1color[0], g1color[1], g1color[2]);                 //graph collor        
  color gfc = color(gfillcollor[0], gfillcollor[1], gfillcollor[2]);        //graph backroundcollor
  
 Freq(int[] gcolor, int yoffset){
    bp = new Button(WX + 185, WY + WH + 5 + yoffset, 180, 40, gcolor, offstrokecolor);
    herz = new Button(WX + 185, WY + WH + 50 + yoffset, 180, 40, gcolor, offstrokecolor);
    
    gc = color(gcolor[0], gcolor[1], gcolor[2]);
   }
  
  void gethz(float max, float min, int spos)
  {
    vmax = int(max);
    vmin = int(min);
   
    if((ampcursors[spos / 2] == vmin || ampcursors[(spos / 2) + 1] == vmin) && (ampcursors[spos / 2] == vmax || ampcursors[(spos / 2) + 1] == vmax))
    {
       bp.drawoff("Error: cursor");
       herz.drawoff("Error: cursor");
    }
    else if(vmaxminxline == OFF)
    {
      
      if(ampcursors[spos / 2] == vmin || ampcursors[(spos / 2) + 1] == vmin)
      { 
       calcwhp();
       if(pd == 0 )
       { 
         if(vmin != 0)
         {
          calcwtp();
         }
         else
         {
           bp.drawoff("Error: npfca");                  //no point for calculation avalabile
           herz.drawoff("Error: ncpfca");               //no point for calculation avalabile
         }
       }
      }
      else if(ampcursors[spos / 2] == vmax || ampcursors[(spos / 2) + 1] == vmax)
      { 
      if(vmin != 0)
         {
          calcwtp();
         }
         else
         {
           bp.drawoff("Error: npfca");                  //no point for calculation avalabile
           herz.drawoff("Error: ncpfca");               //no point for calculation avalabile
         }
      }
      else
      { 
       if(vmin != 0)
         {
          calcwtp();
         }
         else
         {
           bp.drawoff("Error: npfca");                  //no point for calculation avalabile
           herz.drawoff("Error: ncpfca");               //no point for calculation avalabile
         }
      }
      
      }
      else if(vmaxminxline == ON)
      { 
         bp.drawoff("Error: Vmaxminline");
       herz.drawoff("Error: Vmaxminline");
      }
}
      
  void calcwhp()
  {
     
     for( i = 0; i < 997; i++)
    {
      cc = get(WX + 2 + i, WY + (WH / 2) + (vmin * - 1));
     
    
    if(cc == gc)
    {
        while(cc == gc)
        {
         gccount++; 
         
          cc = get(WX + 2 + i, WY + (WH / 2) + (vmax * - 1));
          i++;
        }
       if(hp[0] == 0)
       {
         hp[0] = WX + 2 + i + gccount / 2;
       }
       else if (hp[1] == 0)
       {
              hp[1] = WX + 2 + i + gccount / 2;
       }
       
       gccount = 0;
    }
      
    }
 if(hp[0] == 0 || hp[1] == 0)
 {
   pd = 0;
   hz = 0;
 }
 else
 {
      pd = hp[1] - hp[0];
      
        hz = 1000 / float(pd);
    hz = (float)(((int)(hz * 100)) / 100.0);
  }
  bp.drawon("Perioddur.: " + pd + "ms");
       herz.drawon("Freqency:" + hz+ "hz");
    }
    
    

  
  void calcwtp()
  {
      
    for( i = 0; i < 997; i++)
    {
      cc = get(int(WX + 2 + i), int(WY + (WH / 2) + (vmin * - 1)));
   
    if(cc == gc)
    {  
        while(cc == gc)
        {
         gccount++; 
         
          cc = get(int(WX + 2 + i), int(WY + (WH / 2) + (vmin * - 1)));
          i++;
        }
       if(tp[0] == 0)
       {
         tp[0] = WX + 2 + i + gccount / 2;
       }
       else if (tp[1] == 0)
       {
              tp[1] = WX + 2 + i + gccount / 2;
       }
       
       gccount = 0;
    }
      
    }
    
 if(tp[0] == 0 || tp[1] == 0)
 {
   pd = 0;
   hz = 0;
 }
 else
 {
      pd = tp[1] - tp[0];
      
        hz = 1000 / float(pd);
    hz = (float)(((int)(hz * 100)) / 100.0);
  }
  bp.drawon("Perioddur.: " + pd + "ms");
       herz.drawon("Freqency:" + hz+ "hz");
}

  
  }
  
  
  
  
  
  
  
  
