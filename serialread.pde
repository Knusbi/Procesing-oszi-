class Serialread{
  Button bc1;                                  //Button Chanel 1
  
  Button bget;                                 //Button get serial input array
  
  Button bainc;                                //Button Amp increse 
  Button badec;                                //Button Amp decrese
  
  Button btinc;                                //Button Time increse 
  Button btdec;                                //Button Time decrese
  
  Button baup;                                 //Button Amp up
  Button badown;                               //Button Amp down
  
  Button btl;                                  //Button Time left
  Button btr;                                  //Button Time right
  
  Button bcs;                                  //Button cursor settings
  
  Cursor cursors;
  
  Freq f;
  
  Save s;
  
  Trigger trigger;
  
  Vmaxminline vmaxmin;
  
  String intval;                               //String measured value
  float[] fma = new float[LEN + 10];            //float measured value array

  int LF = 10;

  int i = 0;
  
  float aadjust = 1;
  float tadjust = 1;
  
  float aoffset = 0;
  float toffset = 0;
  
  String cname;
  int ccolor[] = {255, 255, 255};
  
  int xoffset = 0;
  
  int savepos;
  int jpos;
  
Serialread(String canelname, int chanelcolor[], int xoffs, int spos, int jsonspos)
{
    savepos = spos;
    jpos = jsonspos;
 int mmdyoffset = (savepos - 5) * 135;   
    xoffset = xoffs;
    
  ccolor[0] = chanelcolor[0];
  ccolor[1] = chanelcolor[1];
  ccolor[2] = chanelcolor[2];
  
  bc1 = new Button(WX + WW + xoffset, WY + WH + 5, 180, 40, ccolor, offstrokecolor);
 
  bget = new Button(WX + WW + xoffset, WY + WH + 50, 180, 40, ccolor, offstrokecolor);
   
  bainc = new Button(WX + WW  + xoffset, WY + WH + 95, 180, 40, ccolor, offstrokecolor);
  badec = new Button(WX + WW + xoffset, WY + WH + 140, 180, 40, ccolor, offstrokecolor);
 
  btinc = new Button(WX + WW + xoffset, WY + WH + 185, 180, 40, ccolor, offstrokecolor);
  btdec = new Button(WX + WW + xoffset, WY + WH + 230, 180, 40, ccolor, offstrokecolor);
  
  baup = new Button(WX + WW + xoffset, WY + WH + 275, 180, 40, ccolor, offstrokecolor);
  badown = new Button(WX + WW + xoffset, WY + WH + 320, 180, 40, ccolor, offstrokecolor);
 
  btl = new Button(WX + WW + xoffset, WY + WH + 365, 180, 40, ccolor, offstrokecolor);
  btr = new Button(WX + WW + xoffset, WY + WH + 410, 180, 40, ccolor, offstrokecolor);
  
  bcs = new Button(WX + WW + xoffset, WY + WH + 455, 180, 40, ccolor, offstrokecolor);
  
  cursors = new Cursor(canelname, ccolor, jpos);
  
  f = new Freq(ccolor, mmdyoffset);
  
  s = new Save();
  
  trigger = new Trigger(mmdyoffset, ccolor);
  
  vmaxmin = new Vmaxminline(ccolor, mmdyoffset, jpos);
 
  cname = canelname;
    
  if(s.getint(savepos) == 1)
  {
  bc1.drawon(cname + " ON");
  
  bget.drawon("get input array");
  
  bainc.drawon("Amp increase");
  badec.drawon("Amp decrease");
  
  btinc.drawon("Time increase");
  btdec.drawon("Time decrease");
  
  baup.drawon("Amp up");
  badown.drawon("Amp down");
  
  btl.drawon("Time left");
  btr.drawon("Time right");
  }
  else if(s.getint(savepos) == 0)
  {
      bc1.drawoff(cname + " OFF");
  }
}

  float[] getserarray()
  {  
       sendp();
   
    i = 0;
    
    while(i < LEN)
    {
     println("");
      while(serport.available() > 0 && i < LEN)
      {
       intval = serport.readStringUntil(LF);
        
        if(intval != null)
        {
          fma[i] = float(intval);
    
          i++;
        }
        
      }
    }
    i = 0;
     vmaxmin.getvmax(fma);
     vmaxmin.getvmin(fma);
     
    return fma;
  }
  
  
  void drawserin()
  {
    float lx = WX;
    
    if(data.getBoolean(jpos) == true)
    {
    for(i = 0; i < LEN; i++)
    {
      if(lx + toffset >= WX && lx + toffset <= WW + WX && WX + i * tadjust + toffset >= WX && WX + i * tadjust + toffset <= WW + WX && -(fma[i] * aadjust) + aoffset < WH / 2 && -(fma[i] * aadjust) + aoffset > - WH / 2 && -(fma[i + 1] * aadjust) + aoffset < WH / 2 && -(fma[i + 1] * aadjust) + aoffset > - WH / 2)
      {
        stroke(ccolor[0], ccolor[1], ccolor[2]);
        line(lx + toffset, WY + (WH / 2) - (fma[i] * aadjust) + aoffset, WX + i * tadjust + toffset, WY + (WH / 2) - (fma[i + 1] * aadjust) + aoffset);
      }
      lx = WX + i * tadjust;
    }
  bc1.drawon(cname + " ON");
  
  bget.drawon("get input array");
  
  bainc.drawon("Amp increase");
  badec.drawon("Amp decrease");
  
  btinc.drawon("Time increase");
  btdec.drawon("Time decrease");
  
  baup.drawon("Amp up");
  badown.drawon("Amp down");
  
  btl.drawon("Time left");
  btr.drawon("Time right");
  
     vmaxmin.drawvmaxmin();
     
  f.gethz(vmaxmin.getvmin(fma),   vmaxmin.getvmax(fma), savepos);
  
     trigger.draweverything();
     
     if(data.getBoolean(jpos + 1) == true)
     {
       bcs.drawon("hide cursor");
       cursors.drawclines();
       cursors.mccursor(OFF);
     }
     else if(data.getBoolean(jpos + 1) == false)
     {
         bcs.drawoff("show cursor");
     }
    }
    else if(data.getBoolean(jpos) == false)
    {
         bc1.drawoff(cname + " OFF");
    }
    
  }
  
  void mc()
  {
     f.gethz(vmaxmin.getvmin(fma),   vmaxmin.getvmax(fma), savepos); 
    if(bc1.clicked() == true)
    {
      if(data.getBoolean(jpos) == false)
      {
        data.setBoolean(jpos, true);
         bc1.drawon(cname + " ON");
 
         bget.drawon("get input array");
      
         bainc.drawon("Amp increase");
         badec.drawon("Amp decrease");
 
         btinc.drawon("Time increase");
         btdec.drawon("Time decrease");
         
         baup.drawon("Amp up");
         badown.drawon("Amp down");
  
         btl.drawon("Time left");
         btr.drawon("Time right");
     if(data.getBoolean(jpos + 1) == true)
     {
       bcs.drawon("hide cursor");
     }
     else if(data.getBoolean(jpos + 1) == false)
     {
       bcs.drawoff("show cursor");
     }
      }
      else if(data.getBoolean(jpos) == true)
      {
       data.setBoolean(jpos, false);
         bc1.drawoff(cname + " OFF");
        
         bget.drawover();
        
         bainc.drawover();
         badec.drawover();
        
         btinc.drawover();
         btdec.drawover();
         
         baup.drawover();
         badown.drawover();
  
         btl.drawover();
         btr.drawover();
      }
    }
    else if(bainc.clicked() == true)
    {
     aadjust = aadjust + 0.1; 
     drawserin();
    }
    else if(badec.clicked() == true)
    {
     aadjust = aadjust - 0.1; 
     drawserin();
    }
    else if(btinc.clicked() == true)
    {
     tadjust = tadjust + 0.1; 
     drawserin();
    }
    else if(btdec.clicked() == true)
    {
     tadjust = tadjust - 0.1; 
     drawserin();
    }
      else if(baup.clicked() == true)
      {
       aoffset = aoffset - 1; 
       drawserin();
      }
      else if(badown.clicked() == true)
      {
       aoffset = aoffset + 1; 
       drawserin();
      }
      else if(btl.clicked() == true)
      {
       toffset = toffset - 1; 
       drawserin();
      }
      else if(btr.clicked() == true)
      {
       toffset = toffset + 1; 
       drawserin();
      }
      else if(bget.clicked() == true)
      {
       bget.drawoff("loading");
       getserarray();
       drawserin();
       bget.drawon("get input array");
      }
      else if(bcs.clicked() == true)
      {
       if(data.getBoolean(jpos + 1) == true)
     {
       data.setBoolean(jpos + 1, false);
       bcs.drawoff("show cursor");
     }
     else if(data.getBoolean(jpos + 1) == false)
     {
       data.setBoolean(jpos + 1, true);
       bcs.drawon("hide cursor");
     }
      }
 cursors.mccursor(ON);
 trigger.mc();  
 vmaxmin.mc();
 }
 
 void sendp()                                 //send Parameters
 {
   int triggerlevel = trigger.gettl();
        serport.write('T'); 
        serport.write(str(triggerlevel)); 
        serport.write(trigger.gett());
         serport.write("E");
        serport.write('S'); 
 }
 
 void kc()
 {
    trigger.kc(); 
    cursors.kc();
 }
 
 
  
}
