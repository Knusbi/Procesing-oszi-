class Trigger{
  
Button btsettings;                     //Button trigger setings  
Button btlevel;                        //Button that changes triggerlevel
Button btupdown;                       //Button selects if trigger triggers when value increses or decreases

int tmax = 250;                               //max trigger value
int tmin = - 250;                             //min trigger value

int i = 0;

int triggerlevel = 100;

boolean trigger = true;   //true up false down
boolean tsettings = false;

Trigger(int yoff, int[] bcolor)
{
 btsettings = new Button(WX + 185, WY + WH + 95 + yoff, 180, 40, bcolor, offstrokecolor); 
 btlevel = new Button(WX + 185, WY + WH + 410, 180, 40, bcolor, offstrokecolor);
 btupdown = new Button(WX, WY + WH + 410, 180, 40, bcolor, offstrokecolor);
}

void draweverything()
{
  if(tsettings == true)
  {
   btsettings.drawon("hide trigger setings"); 
   btlevel.drawon("Triggerlevel: " + triggerlevel);
   if(trigger == true) btupdown.drawon("UP");
   else if(trigger == false) btupdown.drawon("DOWN");
   drawline();
  }
  else if(tsettings == false)
  {
    btsettings.drawoff("show trigger setings"); 
  }
  
}


void mc()
{
 if(btsettings.clicked() == true)
 {
   tsettings =! tsettings;    
 }
 if(tsettings == true)
 {
  if(btupdown.clicked() == true)
  {
   trigger =! trigger; 
  }
  else if(btlevel.clickedR() == true && triggerlevel > -250)
  {
    triggerlevel--;
  }
  else if(btlevel.clickedL() == true && triggerlevel < 250)
  {
    triggerlevel++;
  }
   
 }
}

void kc()
{
  if(tsettings == true)
  {
    int kintl = btlevel.keyint(tmax, tmin);
      if(kintl != tmax + 1)
      {
       triggerlevel = kintl;
      }
}
}

void drawline()
{
for(i = 0;i < WW; i++)
{
  if(i % 5 == 0)
  {
    strokeWeight(3);
   point(WX + i + 3, WY + WH / 2 - triggerlevel); 
  }
}
}

  int gettl()
  {
   return triggerlevel; 
  }
  
  String gett()
  {
    String r = "true";
    
    if(trigger == false)
    {
     r = "false"; 
    }
    
    
    return r;
  }



}
