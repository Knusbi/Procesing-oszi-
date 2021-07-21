class Cursor {
  
  Button bamp;
  Button btime;
  Save s;
  
  Button ac1plus;
  Button ac1minus;
  Button ac2plus;
  Button ac2minus;
  Button tc1plus;
  Button tc1minus;
  Button tc2plus;
  Button tc2minus;
    
  Button bcc;  
  
  boolean ampcursor;
  boolean timecursor;
  
  int cxmax = 1000;      //max x cursor value
  int cxmin = 0;         //min x cursor value
  
  int cymax = 250;      //max y cursor value
  int cymin = -250;     //min y cursor value

   int mcg;             //Mouse clicked Global
  
   int cursorweight = 1;
   
   int[] cursorcolor = {0,0,0};
   
   int savepos;
   
   String channelname;
   
  Cursor(String cname, int ccolor[], int spos)
  {  
    cursorcolor[0] = ccolor[0];
    cursorcolor[1] = ccolor[1];
    cursorcolor[2] = ccolor[2];
    
    savepos = spos;
    
    channelname = cname;
    bamp = new Button(WX + WW + 5, WY + 90, 180, 40, cursorcolor, offstrokecolor);
    btime = new Button(WX + WW + 5, WY + 135, 180, 40, cursorcolor, offstrokecolor);
    
    s = new Save();
    
    ac1plus = new Button(WX + WW + 5, WY + 275, 85, 25, cursorcolor, offstrokecolor);
    ac1minus = new Button(WX + WW + 5, WY + 325, 85, 25, cursorcolor, offstrokecolor);
    ac2plus = new Button(WX + WW + 90, WY + 275, 85, 25, cursorcolor, offstrokecolor);
    ac2minus = new Button(WX + WW + 90, WY + 325, 85, 25, cursorcolor, offstrokecolor);
    tc1plus = new Button(WX + WW + 5, WY + 365, 85, 25, cursorcolor, offstrokecolor);
    tc1minus = new Button(WX + WW + 5, WY + 415, 85, 25, cursorcolor, offstrokecolor);
    tc2plus = new Button(WX + WW + 90, WY + 365, 85, 25, cursorcolor, offstrokecolor);
    tc2minus = new Button(WX + WW + 90, WY + 415, 85, 25, cursorcolor, offstrokecolor);

    bcc = new Button(WX + WW + 5, WY + 450, 180, 40, cursorcolor, offstrokecolor);
    
    ON = 1;
    OFF = 0;
    
  ampcursor = data.getBoolean(spos + 2);                       
  timecursor = data.getBoolean(spos + 3);                    
    
   mcg = OFF;
    
   ampcursors[savepos / 2] = WH / 4;
     ampcursors[(savepos / 2) + 1] =  - WH / 4;
     deltaampcursor[savepos / 4] = ampcursors[savepos / 2] - ampcursors[(savepos / 2) + 1]; 
   timecursors[savepos / 2] = WW / 2;
     timecursors[(savepos / 2) + 1] = WW / 4;
     deltatimecursor[savepos / 4] = timecursors[savepos / 2] - timecursors[(savepos / 2) + 1];
  }
  
void drawclines()
{
     stroke(cursorcolor[0], cursorcolor[1], cursorcolor[2]);
     strokeWeight(cursorweight);
 if(data.getBoolean(savepos + 2) == true)
 {
   line(WX, WY + (WH / 2) - ampcursors[savepos / 2], WX + WW, WY + (WH / 2) - ampcursors[savepos / 2]);                //Amp 01
   line(WX, WY + (WH / 2) - ampcursors[(savepos / 2) + 1], WX + WW, WY + (WH / 2) - ampcursors[(savepos / 2) + 1]);    //Amp 02
 }
 if(data.getBoolean(savepos + 3) == true)
 {
   line(WX + timecursors[savepos / 2], WY, WX + timecursors[savepos / 2], WY + WH);                                    //Time 01
   line(WX + timecursors[(savepos / 2) + 1], WY, WX + timecursors[(savepos / 2) + 1], WY + WH);                        //Time 02
 }
}
  
 void drawampcon()
 {
   bamp.drawon("ampcursor  ON");
   
     ac1plus.drawon(" ");
  ac1minus.drawon(" ");
  ac2plus.drawon(" ");
  ac2minus.drawon(" ");
  
    deltaampcursor[savepos / 4] = ampcursors[savepos / 2] - ampcursors[(savepos / 2) + 1];
    
     stroke(cursorcolor[0], cursorcolor[1], cursorcolor[2]);
     strokeWeight(cursorweight);
         line(WX, WY + (WH / 2) - ampcursors[savepos / 2], WX + WW, WY + (WH / 2) - ampcursors[savepos / 2]);
         line(WX, WY + (WH / 2) - ampcursors[(savepos / 2) + 1], WX + WW, WY + (WH / 2) - ampcursors[(savepos / 2) + 1]);

       fill(buttonbcolor[0], buttonbcolor[1], buttonbcolor[2]);
       stroke(cursorcolor[0], cursorcolor[1], cursorcolor[2]);
     strokeWeight(2);
     rect(WX + WW + 5, WY + 270, 180, 85);
     rect(WX + WW + 10, WY + 275 , 170, 25);
     rect(WX + WW + 10, WY + 300 , 170, 25);
     rect(WX + WW + 10, WY + 325 , 170, 25);
     
               line(WX + WW + 95, WY + 275, WX + WW + 95, WY + 350);
   
     triangle(WX + WW +52, WY + 280, WX + WW + 32, WY + 295, WX + WW + 72, WY + 295);
     triangle(WX + WW +137, WY + 280, WX + WW + 117, WY + 295, WX + WW + 157, WY + 295);
     
     triangle(WX + WW +52, WY + 345, WX + WW + 32, WY + 330, WX + WW + 72, WY + 330);
     triangle(WX + WW +137, WY + 345, WX + WW + 117, WY + 330, WX + WW + 157, WY + 330);
     
       fill(cursortxtcolor[0], cursortxtcolor[1], cursortxtcolor[2]);
     text(ampcursors[savepos / 2],WX + WW + 37, WY + 318);
     text(ampcursors[(savepos / 2) + 1],WX + WW + 122, WY + 318);
    
       fill(buttonbcolor[0], buttonbcolor[1], buttonbcolor[2]);
    stroke(cursorcolor[0], cursorcolor[1], cursorcolor[2]);
     strokeWeight(2);
        rect(WX + WW + 5, WY + 180, 180, 40);
        
     textSize(15);
     fill(cursortxtcolor[0], cursortxtcolor[1], cursortxtcolor[2]);
        text("delta amp cursor: " + deltaampcursor[savepos / 4], WX + WW + 10, WY + 205);
 }
  
 void drawtimecon()
 {
     btime.drawon("timecursor ON");
     
  tc1plus.drawon(" ");
  tc1minus.drawon(" ");
  tc2plus.drawon(" ");
  tc2minus.drawon(" ");
     
    deltatimecursor[savepos / 4] = timecursors[savepos / 2] - timecursors[(savepos / 2) + 1];
    
   stroke(cursorcolor[0], cursorcolor[1], cursorcolor[2]);
   strokeWeight(cursorweight);
       line(WX + timecursors[savepos / 2], WY, WX + timecursors[savepos / 2], WY + WH);
       line(WX + timecursors[(savepos / 2) + 1], WY, WX + timecursors[(savepos / 2) + 1], WY + WH);
     
     fill(buttonbcolor[0], buttonbcolor[1], buttonbcolor[2]);
   stroke(cursorcolor[0], cursorcolor[1], cursorcolor[2]);
        strokeWeight(2);
   rect(WX + WW + 5, WY + 360, 180, 85);
   rect(WX + WW + 10, WY + 365 , 170, 25);
   rect(WX + WW + 10, WY + 390 , 170, 25);
   rect(WX + WW + 10, WY + 415 , 170, 25);
     
          line(WX + WW + 95, WY + 365, WX + WW + 95, WY + 440);
   
     triangle(WX + WW + 52, WY + 370, WX + WW + 32, WY + 385,WX + WW + 72, WY + 385);
     triangle(WX + WW + 137, WY + 370, WX + WW + 117, WY + 385,WX + WW + 157, WY + 385);
    
     triangle(WX + WW +52, WY + 435, WX + WW + 32, WY + 420, WX + WW + 72, WY + 420);
     triangle(WX + WW +137, WY + 435, WX + WW + 117, WY + 420, WX + WW + 157, WY + 420);
     
     fill(cursortxtcolor[0], cursortxtcolor[1], cursortxtcolor[2]);
   text(timecursors[savepos / 2],WX + WW + 37, WY + 408);
   text(timecursors[(savepos / 2) + 1],WX + WW + 122, WY + 408);
    
     fill(buttonbcolor[0], buttonbcolor[1], buttonbcolor[2]);
   stroke(cursorcolor[0], cursorcolor[1], cursorcolor[2]);
   strokeWeight(2);
   rect(WX + WW + 5, WY + 225, 180, 40);
         
   textSize(15);
     fill(cursortxtcolor[0], cursortxtcolor[1], cursortxtcolor[2]);
   text("delta time cursor: " + deltatimecursor[savepos / 4], WX + WW + 10, WY + 250);
 }
 
 void drawampcoff()
 {
   bamp.drawoff("ampcursor OFF");

     if(bimage == false)
     {
   stroke(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over ampcursor + - buttons 
   strokeWeight(3);                                                     //draws over ampcursor + - buttons
     fill(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over ampcursor + - buttons
   rect(WX + WW + 190, WY + 90, 180, 85);                               //draws over ampcursor + - buttons
                                                                        //draws over ampcursor + - buttons
     fill(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over delta y
   stroke(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over delta y
   strokeWeight(2);                                                     //draws over delta y
   rect(WX + WW + 375, WY , 180, 40);                                   //draws over delta y
     }
 }
 
 void drawtimecoff()
 {
   btime.drawoff("timecursor OFF");

     if(bimage == false)
     {
   stroke(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over timecursor + - buttons 
   strokeWeight(3);                                                     //draws over timecursor + - buttons 
     fill(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over timecursor + - buttons 
   rect(WX + WW + 190, WY + 180, 180, 85);                              //draws over timecursor + - buttons 
                                                                         //draws over timecursor + - buttons 
     fill(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over delta t
   stroke(backroundcolor[0], backroundcolor[1], backroundcolor[2]);     //draws over delta t
   strokeWeight(3);                                                     //draws over delta t
   rect(WX + WW + 375, WY + 45 , 180, 40);                              //draws over delta t    
     }
 }
 
 void drawcc()
 {
  if(data.getInt(SICC) == savepos)
  {
    bcc.drawon("currend cursor " + channelname);
  }
 }
  
 void mcampc()
 {
  if(bamp.clicked() == true)
  {
   if(ampcursor == true)
   {
    ampcursor = false;
       data.setBoolean(savepos + 2, false);
   }
   else if(ampcursor == false)
   {
     ampcursor = true;
     data.setBoolean(savepos + 2, true);
   }
   
}
 else if(ac1plus.clicked() == true)
  {
    ampcursors[savepos / 2]++;
  }
  else if(ac1minus.clicked() == true)
  {
    ampcursors[savepos / 2]--;
  }
  else if(ac2plus.clicked() == true)
  {
    ampcursors[(savepos / 2) + 1]++;
  }
  else if(ac2minus.clicked() == true)
  {
    ampcursors[(savepos / 2) + 1]--;
  }
 }
 
 void mctimec()
 {
  if(btime.clicked() == true)
  {
     
   if(timecursor == true)
   {
     timecursor = false;
       data.setBoolean(savepos + 3, false);
   }
   else if(timecursor == false)
   {
     timecursor = true;
        data.setBoolean(savepos + 3, true);
   }
   
   
  }
    else if(tc1plus.clicked() == true)
    {
      timecursors[savepos / 2]++;
    }
    else if(tc1minus.clicked() == true)
    {
      timecursors[savepos / 2]--;
    }
    else if(tc2plus.clicked() == true)
    {
      timecursors[(savepos / 2) + 1]++;
    }
    else if(tc2minus.clicked() == true)
    {
      timecursors[(savepos / 2) + 1]--;
    }
}
 
void cc()
{
 if(bcc.clicked() == true && mcc == true)
 { 
     if(data.getInt(SICC) == savepos)
     { 
     mcc = false;
      if(data.getInt(SICC) == SICH1)
      { 
        if(data.getBoolean(SICCH2) == true && data.getBoolean(SICH2) == true) 
        {
          data.setInt(SICC, SICH2);
        }
        else if(data.getBoolean(SICCH3) == true && data.getBoolean(SICH3) == true)
        {
        data.setInt(SICC, SICH3);
        }
    }
    else if(data.getInt(SICC) == SICH2)
    { 
      if(data.getBoolean(SICCH3) == true && data.getBoolean(SICH3) == true) 
      {
      data.setInt(SICC, SICH3);
      }
      else if(data.getBoolean(SICCH1) == true && data.getBoolean(SICH1) == true) 
      {
      data.setInt(SICC, SICH1);
      }
    }
    else if(data.getInt(SICC) == SICH3)
    {
      if(data.getBoolean(SICCH1) == true && data.getBoolean(SICH1) == true) 
      {
      data.setInt(SICC, SICH1);
      }
      else if(data.getBoolean(SICCH2) == true && data.getBoolean(SICH2) == true) 
      {
      data.setInt(SICC, SICH2);
      }
    }
   }
   else if(data.getInt(SICC) != savepos)
   {
      if(data.getBoolean(SICCH1) == true && data.getBoolean(SICH1) == true) 
      {
        data.setInt(SICC, SICH1);
      }
      else if(data.getBoolean(SICCH2) == true && data.getBoolean(SICH2) == true) 
      {
        data.setInt(SICC, SICH2);
      }
      else if(data.getBoolean(SICCH3) == true && data.getBoolean(SICH3) == true)
      {
        data.setInt(SICC, SICH3); 
      }
   }
 }

}

void mccursor(int mc)
{
 
  if(data.getBoolean(savepos + 1) == true)
  {
 if(mc == ON && data.getInt(SICC) == savepos)
 {
   
 mcampc();
 mctimec();
 
cc();
 }
 else if(data.getInt(SICC) == savepos)
 { 
    if(data.getBoolean(savepos + 2) == true)
    {
      drawampcon();   
    }
      else 
    {
      drawampcoff(); 
    }
    if(data.getBoolean(savepos + 3) == true)
    {
      drawtimecon();
    }
      else 
    {
      drawtimecoff(); 
    }
    drawcc();
 }
 else if(data.getInt(SICC) != savepos && data.getBoolean(data.getInt(SICC) + 1) == false)
   {
      if(data.getBoolean(SICCH1) == true && data.getBoolean(SICH1) == true) 
      {
        data.setInt(SICC, SICH1);
      }
      else if(data.getBoolean(SICCH2) == true && data.getBoolean(SICH2) == true) 
      {
        data.setInt(SICC, SICH2);
      }
      else if(data.getBoolean(SICCH3) == true && data.getBoolean(SICH3) == true)
      {
        data.setInt(SICC, SICH3); 
      }
   }
  data.setBoolean(savepos + 2, ampcursor); 
  data.setBoolean(savepos + 3, timecursor); 
  }
}

void kc()
{
  int tmaxdigits = 4;
 if(data.getInt(SICC) == savepos) 
 {
  int ac1p = ac1plus.keyint(cymax, cymin); 
  int ac1m = ac1minus.keyint(cymax, cymin); 
  int ac2p = ac2plus.keyint(cymax, cymin); 
  int ac2m = ac2minus.keyint(cymax, cymin); 
  int tc1p = tc1plus.keyint(cxmax, cxmin, tmaxdigits); 
  int tc1m = tc1minus.keyint(cxmax, cxmin, tmaxdigits); 
  int tc2p = tc2plus.keyint(cxmax, cxmin, tmaxdigits); 
  int tc2m = tc2minus.keyint(cxmax, cxmin, tmaxdigits); 
  
 if(ac1p != cymax + 1) ampcursors[savepos / 2] = ac1p;
 if(ac1m != cymax + 1) ampcursors[savepos / 2] = ac1m;
 if(ac2p != cymax + 1) ampcursors[(savepos / 2) + 1] = ac2p;
 if(ac2m != cymax + 1) ampcursors[(savepos / 2) + 1] = ac2m;
 if(tc1p != cxmax + 1) timecursors[savepos / 2] = tc1p;
 if(tc1m != cxmax + 1) timecursors[savepos / 2] = tc1m;
 if(tc2p != cxmax + 1) timecursors[(savepos / 2) + 1] = tc2p;
 if(tc2m != cxmax + 1) timecursors[(savepos / 2) + 1] = tc2m;
}
}
}
