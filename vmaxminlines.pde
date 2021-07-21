class Vmaxminline{
  
  Button bline;
  Button bpoints;
  Button bch;
  
  Button bvmin;
  Button bvmax;
  Button bvdelta;
  Save s;
  
float vmin = 0;
float vmax = 0;
float vmint = 0;
float[] vminta = new float[1010];
float vmaxt = 0;
float[] vmaxta = new float[1010];
float deltav;

   int ON;
  int OFF;
  
  int i = 0, j = 0;
  int mincount = 0;                           
  int maxcount = 0;
  
  int cursorweight;
  
  int savepos;
  
  int sil;
  int sip;
  
  int vc[] = {255, 255, 255};
  
  Vmaxminline(int[] vcolor, int mmdyoffset, int spos)   //mmdyoffset = min max delta y offset                
  {
       vc[0] = vcolor[0];
       vc[1] = vcolor[1];
       vc[2] = vcolor[2];
       
       savepos = spos;
        
    bline = new Button(WX + WW + 190, WY, 180, 40, vc, offstrokecolor);
    bpoints = new Button(WX + WW + 375, WY, 180, 40, vc, offstrokecolor);
    bch = new Button(WX + WW + 560, WY, 180, 40, vc, offstrokecolor);
    
    bvmin = new Button(WX, WY + WH + 5 + mmdyoffset, 180, 40, vc, offstrokecolor);
    bvmax = new Button(WX, WY + WH + 50 + mmdyoffset, 180, 40, vc, offstrokecolor);
    bvdelta = new Button(WX, WY + WH + 95 + mmdyoffset, 180, 40, vc, offstrokecolor);
    s = new Save();
    ON = 1;
    OFF = 0;
    
   vmaxminxline = s.getint(0);
   vmaxminypoints = s.getint(1);
  
     i = 0; 
    
    switch(savepos)
    {
     case 0:
     {
       sil = 14;
       sip = 15;
       break;
     }
     case 4:
     {
       sil = 16;
       sip = 17;
       break;
     }
     case 8:
     {
       sil = 18;
       sip = 19;
       break;
     }
    }
    
    
  }
  
  float getvmax(float inarray[])
  {
  vmax = - WH / 2;
    for(int i = 0; i < LEN; i++)
    {
      if(vmax <= inarray[i] && inarray[1] <= WH / 2)
      {
        vmax = inarray[i];
        vmaxt = i;
      }
    }
   return vmax;
  }
  
  float getvmin(float inarray[])
  {
    vmin =  WH / 2;
    
     for(i = 0; i < LEN; i++)
     {
      if(vmin >= inarray[i] && inarray[i] >= - WH / 2)
      {
        vmin = inarray[i];
        vmint = i;
       
      }
      
     }
  
   return vmin;
  }
  
  void drawvlineon()
  {
    bline.drawon("V max / min lines ON");
 
      stroke(linecolor[0], linecolor[1], linecolor[2]);
      strokeWeight(1);
    if(vmax < (WH / 2)  && vmax > - (WH / 2)  && vmin < (WH / 2) && vmin > - (WH / 2))
    {
      line(WX, WY + (WH / 2) -  vmin, WX + WW, WY + (WH / 2) - vmin);
      line(WX, WY + (WH / 2) - vmax, WX + WW, WY + (WH / 2) - vmax);
    }
  }
  
  void drawvtpointson()
  {
    bpoints.drawon("V max / min tline  ON");
    
  for(i = 0; i < (WH / PD); i++)
  {
    stroke(linecolor[0], linecolor[1], linecolor[2]);
    strokeWeight(2);
    point(WX + vmint, WY + (i * PD));
    point(WX + vmaxt, WY + (i * PD));
  }
  }
  
  void drawvmaxmin()
  { 
     vmin = (float)(((int)(vmin * 100)) / 100.0);
     vmax = (float)(((int)(vmax * 100)) / 100.0);
    
    deltav = vmax + vmin * - 1 ; 
    bvmin.drawon("vmin:  " + vmin);
    bvmax.drawon("vmax:  " + vmax);
    bvdelta.drawon("deltav: " + deltav);
    
    maxminlp();
  }
 
  void drawmaxmin(int onoff)
  {
   
   if(onoff == ON)
   {
     if(bline.clicked() == true)
     {
       if(vmaxminxline == OFF)
       {
       vmaxminxline = ON;
       }
       else if(vmaxminxline == ON)
       {
       vmaxminxline = OFF;
     }
     }
     else if(bpoints.clicked() == true)
     {
      if(vmaxminypoints == OFF)
      {
       vmaxminypoints = ON;
      }
      else if(vmaxminypoints == ON)
      {
      vmaxminypoints = OFF;
      }
    }
   }
    else
    {
      if(vmaxminxline == ON)
      {
        drawvlineon();
      }
      else
      {
        bline.drawoff("V max / min lines OFF");
      }
      
      if(vmaxminypoints == ON)
      {
        drawvtpointson(); 
      }
      else
      {
        bpoints.drawoff("V max / min tline OFF");
      }
    }
  }
  
void maxminlp()
{
  if(data.getInt(SICVMM) == savepos) 
  {
    bch.drawon("Change Chanel");
    
    if(data.getBoolean(sil) == true)
    {
      drawvlineon();
    }
    else if(data.getBoolean(sil) == false)
    {
      bline.drawoff("V max / min lines OFF");
    }
    if(data.getBoolean(sip) == true)
    {
      drawvtpointson(); 
    }
    else if(data.getBoolean(sip) == false)
    {
       bpoints.drawoff("V max / min tline OFF");
    }
  }
  else if(data.getInt(SICVMM) != savepos && data.getBoolean(data.getInt(SICVMM)) == false)
  {
   if(data.getBoolean(SICH1) == true)
   {
    data.setInt(SICVMM, SICH1); 
   }
   else if(data.getBoolean(SICH2) == true)
   {
    data.setInt(SICVMM, SICH2); 
   }
   else if(data.getBoolean(SICH3) == true)
   {
    data.setInt(SICVMM, SICH3); 
   }
  }
  
}
  
void mc()
{
  if(data.getInt(SICVMM) == savepos && data.getBoolean(savepos)) 
  {
    if(bch.clicked() == true && mcc == true)
    { 
      mcc = false;
      
      if(data.getInt(SICVMM) == SICH1)
      {
       if(data.getBoolean(SICH2) == true) 
       {
        data.setInt(SICVMM, SICH2); 
       }
       else if(data.getBoolean(SICH3) == true)
       {
         data.setInt(SICVMM, SICH3);
       }
      }
      else if(data.getInt(SICVMM) == SICH2)
      {
       if(data.getBoolean(SICH3) == true) 
       {
        data.setInt(SICVMM, SICH3); 
       }
       else if(data.getBoolean(SICH1) == true)
       {
        data.setInt(SICVMM, SICH1); 
       }
      }
      else if(data.getInt(SICVMM) == SICH3)
      {
       if(data.getBoolean(SICH1) == true) 
       {
        data.setInt(SICVMM, SICH1); 
       }
       else if(data.getBoolean(SICH2) == true)
       {
        data.setInt(SICVMM, SICH2); 
       }
      }
    }
    else if(bline.clicked() == true)
    {
      if(data.getBoolean(sil) == true) data.setBoolean(sil, false);
      else if(data.getBoolean(sil) == false) data.setBoolean(sil, true);
    }
    else if(bpoints.clicked() == true)
    {
      if(data.getBoolean(sip) == true) data.setBoolean(sip, false);
      else if(data.getBoolean(sip) == false) data.setBoolean(sip, true);
    }
  }
}
 
  
  
  
  
  
  
 
  
  
  
  
  
}
