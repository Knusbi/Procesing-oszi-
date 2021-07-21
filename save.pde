class Save{
  Button boszibild;
  Button bchangedatatype;
  
  PImage everything;                                  //Screenshot vom ganzen Fenster
  PImage oszibild = createImage(WW, WH, RGB);         //Fertiges Oszibild
  
//String aldata[] = {"1","1","0","1",".png","1"};  
String aldata[];


String tiff[] = {"TIFF (.tif) ",".tif"};
String targa[] = {"TARGA (.tga)",".tga"};
String jpeg[] = {"JPEG (.jpg)",".jpg"};
String png[] = {"PNG (.png)",".png"};

String oszibildname;

int ri;

int count = 0;
  boolean cont;
  
  
int i = 0;
int x = 0;
int y = 0;

int savenametextcolor[] = {0, 0, 0};

  Save(){  // saveStrings("save.txt", aldata);
     
    boszibild = new Button(WX + WW +5, WY, 180, 40);
    bchangedatatype = new Button(WX + WW + 5, WY + 45, 180, 40);
    
    boszibild.drawon("Save to Saved Images");
    
        aldata = loadStrings("save.txt");
    
    if(aldata[4].equals(tiff[1]) == true)
    {
      aldata[4] = tiff[1];
       bchangedatatype.drawon(tiff[0]);
    }
    else if(aldata[4].equals(jpeg[1]) == true)
    {
      aldata[4] = jpeg[1];
      bchangedatatype.drawon(jpeg[0]);
    }
     else if(aldata[4].equals(png[1]) == true)
    {
      aldata[4] = png[1];
      bchangedatatype.drawon(png[0]);
    }
     else if(aldata[4].equals(targa[1]) == true)
    {
      aldata[4] = targa[1];
      bchangedatatype.drawon(targa[0]);
    }

  } 
  
  void everything(int maxminline, int maxminpoints, int ampc, int timec, int ch1)
  {
    aldata = loadStrings("save.txt");
    
    aldata[0] = str(maxminline);
    aldata[1] = str(maxminpoints);
    aldata[2] = str(ampc);
    aldata[3] = str(timec);
    aldata[5] = str(ch1);
    saveStrings("save.txt", aldata);
  }
  
  void sint(int pos, int val)
  {
    aldata = loadStrings("save.txt");
    
    aldata[pos] = str(val);
    
    saveStrings("save.txt", aldata);
  }
  
  int getint(int pos)
  {
      aldata = loadStrings("save.txt");
      
    int ri;                                      //return int
    
    ri = int(aldata[pos]);
    
    return ri;
  }
  
void oszibild()
{

  if(boszibild.clicked() == true)
  {
        aldata = loadStrings("save.txt");
        
  x = 0;
  y = 0;
  
  save("everything.tiff");
  
  everything = loadImage("everything.tiff");
  
  for(i = 0; i < (WW * WH); i++)
  {
    if(x == WW)
    {
      x = 0;
      y++;
    }
    
  oszibild.pixels[i] = everything.get((WX + x), (WY + y)); 

  x++;
  }
  
  oszibildname ="C:/Users/Tobias/Pictures/Saved Pictures/oszibilder/"; 

  oszibildname = oszibildname + str(day());
    oszibildname = oszibildname + ".";
  oszibildname = oszibildname + str(month());
    oszibildname = oszibildname + ".";
  oszibildname = oszibildname + str(year());
    oszibildname = oszibildname + "_";
  oszibildname = oszibildname + str(hour());
    oszibildname = oszibildname + ".";
  oszibildname = oszibildname + str(minute());
    oszibildname = oszibildname + ".";
  oszibildname = oszibildname + str(second());
  
    oszibildname = oszibildname + aldata[4];
  
  oszibild.save(oszibildname);

fill(backroundcolor[0],backroundcolor[1],backroundcolor[2]);
stroke(backroundcolor[0], backroundcolor[1], backroundcolor[2]);
rect(1200, 670, 700, 50);

fill(savenametextcolor[0], savenametextcolor[1], savenametextcolor[2]);
  text(oszibildname,1200,700 );
  
}
}
void changesavedatatype()
{
  if(bchangedatatype.clicked() == true)
  {
    aldata = loadStrings("save.txt");

    if(aldata[4].equals(tiff[1]) == true)
    {
      aldata[4] = targa[1];
       bchangedatatype.drawon(targa[0]);
    }
    else if(aldata[4].equals(targa[1]) == true)
    {
      aldata[4] = jpeg[1];
      bchangedatatype.drawon(jpeg[0]);
    }
     else if(aldata[4].equals(jpeg[1]) == true)
    {
      aldata[4] = png[1];
      bchangedatatype.drawon(png[0]);
    }
     else if(aldata[4].equals(png[1]) == true)
    {
      aldata[4] = tiff[1];
      bchangedatatype.drawon(tiff[0]);
    }
   
        saveStrings("save.txt", aldata);
      
  }

}
  
void drawoszib()
{
     aldata = loadStrings("save.txt");
 boszibild.drawon("Save to Saved Images");
 
 if(aldata[4].equals(targa[1]) == true)
    {
       bchangedatatype.drawon(targa[0]);
    }
    else if(aldata[4].equals(jpeg[1]) == true)
    {
      bchangedatatype.drawon(jpeg[0]);
    }
     else if(aldata[4].equals(png[1]) == true)
    {
      bchangedatatype.drawon(png[0]);
    }
     else if(aldata[4].equals(tiff[1]) == true)
    {
      bchangedatatype.drawon(tiff[0]);
    }
  
}
  
}
