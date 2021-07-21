class Button {
  
  int bstrokeWeight;
  
  int ts;
  
  int tx;
  int ty;
  int bx;
  int by;
  int bw;
  int bh;
  
 int onstrokecolor[] = {0, 255, 0};
 
 int i = 0;
 String keyins;
 int keyini;
 boolean keyinpos = true;                 //true keyinput positive false keyinput negative
 
  Button(int Bx, int By, int Bw, int Bh)
  {
    bw = Bw;
    bh = Bh;
    
      bx = Bx;
      by = By;
  
  tx = 10; 
  ty = 25;
   bstrokeWeight = 2; 
   
   ts = 15;
   
  }
  
   Button(int Bx, int By, int Bw, int Bh,int onsc[], int offsc[])
  {
    bw = Bw;
    bh = Bh;
    
      bx = Bx;
      by = By;
  
    tx = 10; 
    ty = 25;
      bstrokeWeight = 2; 
   
   ts = 15;
  onstrokecolor[0] = onsc[0];
  onstrokecolor[1] = onsc[1]; 
  onstrokecolor[2] = onsc[2];
   
  }

  void drawon(String bt)
  {
   
    fill(buttonbcolor[0], buttonbcolor[1], buttonbcolor[2]);
    stroke(onstrokecolor[0], onstrokecolor[1], onstrokecolor[2]);
    strokeWeight(bstrokeWeight);
    rect(bx, by, bw, bh);
    
    fill(onstrokecolor[0], onstrokecolor[1], onstrokecolor[2]);
    textSize(ts);
    text(bt, bx + tx, by + ty);
    
  }
  
  void drawoff(String bt)
  {
    fill(buttonbcolor[0], buttonbcolor[1], buttonbcolor[2]);
    
    stroke(offstrokecolor[0], offstrokecolor[1], offstrokecolor[2]);
    strokeWeight(bstrokeWeight);
    rect(bx, by, bw, bh);
    
   
   fill(offstrokecolor[0], offstrokecolor[1], offstrokecolor[2]);
    
    textSize(ts);
    text(bt, bx + tx, by + ty);
  }
  
  void drawover()
  {
     fill(backroundcolor[0], backroundcolor[1], backroundcolor[2]);
    stroke(backroundcolor[0], backroundcolor[1], backroundcolor[2]);
    strokeWeight(bstrokeWeight + 1);
    rect(bx, by, bw, bh);
  }
  
  boolean clicked()
  {
   boolean bc = false;
    
    if(mouseX >= bx && mouseX <= bx + bw && mouseY >= by && mouseY <= by + bh)
      {
       bc = true; 
      }
    
    return bc;
  }
  
  boolean clickedR()
  {
    boolean r = false;
    
    if(clicked() == true && mouseButton == RIGHT) r = true;
    
    return r;
  }
  
  boolean clickedL()
  {
   boolean r = false;
   
       if(clicked() == true && mouseButton == LEFT) r = true;
   
    return r; 
  }
  
  int keyint(int max, int min)
  {
    if(max < min)
    {
     println("max < min");
     exit();
    }
    
    int r = max + 1;
    
    if(clicked() == true)
    {
      if(key == 45)
      {
        keyinpos = false;
      }  
      else if(key >= 48 && key <= 57)
      { 
        i++;
      if(keyins == null)
      {
        keyins = str(key);
      }
      else
      {
        keyins = keyins + key; 
      }
      }
      if(keyCode == 10 || i >= 3)
      { 
      if(keyins != null)
      {
          i = 0;
          keyini = int(keyins);
        if(keyinpos == false)
        {
          keyini = keyini * -1;
        }
          keyins = null;
        if(keyini > max) 
        {
          keyini = max;
        }
        else if(keyini < min)
        {
          keyini = min; 
        }
        keyinpos = true;
        r = keyini;
      }
      }
    
  }
  return r;
}

 int keyint(int max, int min, int maxdigits)
  {
    if(max < min)
    {
     println("max < min");
     exit();
    }
    
    int r = max + 1;
    
    if(clicked() == true)
    {
      if(key == 45)
      {
        keyinpos = false;
      }  
      else if(key >= 48 && key <= 57)
      { 
        i++;
      if(keyins == null)
      {
        keyins = str(key);
      }
      else
      {
        keyins = keyins + key; 
      }
      }
      if(keyCode == 10 || i >= maxdigits)
      { 
      if(keyins != null)
      {
          i = 0;
          keyini = int(keyins);
        if(keyinpos == false)
        {
          keyini = keyini * -1;
        }
          keyins = null;
        if(keyini > max) 
        {
          keyini = max;
        }
        else if(keyini < min)
        {
          keyini = min; 
        }
        keyinpos = true;
        r = keyini;
      }
      }
    
  }
  return r;
}

}
