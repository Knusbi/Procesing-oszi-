//****************************************************************************************************
// FunctionScope
// March 2021
// Tobias Reisenthaler 
//****************************************************************************************************
import processing.serial.*;
  Serial serport;
  
 JSONArray data;
 
 String jsonfilename = "data.jason";
 
static int SICH1 = 0;         //save index Chanel 1  
static int SICCH1 = 1;        //save index cursor Chanel 1  
static int SIACCH1 = 2;       //save index amp cursor Chanel 1
static int SITCCH1 = 3;       //save index time cursor Chanel 1


static int SICH2 = 4;         //save index Chanel 2 
static int SICCH2 = 5;        //save index cursor Chanel 2  
static int SIACCH2 = 6;       //save index amp cursor Chanel 2
static int SITCCH2 = 7;       //save index time cursor Chanel 2

 
static int SICH3 = 8;         //save index Chanel 3 
static int SICCH3 = 9;        //save index cursor Chanel 3  
static int SIACCH3 = 10;      //save index amp cursor Chanel 3
static int SITCCH3 = 11;      //save index time cursor Chanel 3

static int SICC = 12;         //save index cursor change
static int SICVMM = 13;       //save index currend v max min

static int SIVLCH1 = 14;    //save index v lines Chanel 1 
static int SIVPCH1 = 15;    //save index v pointsChanel 1

static int SIVLCH2 = 16;    //save index v line Chanel 2
static int SIVPCH2 = 17;    //save index v points Chanel 2

static int SIVLCH3 = 18;    //save index v line Chanel 3
static int SIVPCH3 = 19;    //save index v points Chanel 3





int i = 0;
int LEN = 1000;
String intval;   

int LF = 10;
  
//Cursor cursor;
Exit exit;
//Fgen func;
Getcode getcode;
Save save;
Serialread ch1;
Serialread ch2;
Serialread ch3;

static int ON = 1;   //YES
static int OFF = 0;  //NO
static int YES = 1;   //YES
static int NO = 0;  //NO

int mp = NO;               //Mouse pressed 
int mpt = 0;               //Mouse pressed time

 int cvmax = 0;
 int cvmin = 0;

static int WX = 100;   
static int WY = 50;
static int WW = 1000; 
static int WH = 500;

static int PD = 5;
/*
float vmin = 0;
float vmax = 0;
float vmint = 0;
float vmaxt = 0;
float deltav;
*/
int[] ampcursors = new int[6];
    int[] deltaampcursor = new int[3];
  int[] timecursors = new int[6];
    int[] deltatimecursor = new int[3];
    
    boolean bimage = true;
    PImage bimg;                                            //Background image

static int onstrokecolor[] = {0, 255, 0};
static int offstrokecolor[] = {255, 0, 0};
static int buttonbcolor[] = {50 ,50, 50};
static int cursorcolor[] = {255, 255, 255};
static int cursortxtcolor[] = {0, 0, 255};
static int linecolor[] = {255, 255, 0};
static int gfillcollor[] = {0, 0, 0};
static int outlinecolor[] = {98, 252, 74};
static int backroundcolor[] = {43, 20, 122};
static int funccolor[] = {61, 167, 233};
static int g1color[] = {61, 167, 233};
static int g2color[] = {255, 255, 0};
static int g3color[] = {230, 174, 240};

int vmaxminxline;
int vmaxminypoints;

boolean mcc = false;

void setup()
{
  data = loadJSONArray(jsonfilename);
  /*
   data.setBoolean(13, true);
   data.setBoolean(14, true);
   data.setBoolean(15, true);
     data.setBoolean(16, false);
     data.setBoolean(17, false);
     data.setBoolean(18, false);
   data.setBoolean(19, true);
   data.setBoolean(SIACCH2, true);
   data.setBoolean(SIACCH3, true);
     data.setBoolean(SITCCH1, false);
     data.setBoolean(SITCCH2, false);
     data.setBoolean(SITCCH3, false);
    
    saveJSONArray(data, "data.jason");
    */
    
      fullScreen();
//size(1920, 1080);
     background(backroundcolor[0], backroundcolor[1], backroundcolor[2]);
   
    bimg = loadImage("background.PNG");
     
    // cursor = new Cursor(WX, WY, WW, WH, onstrokecolor, buttonbcolor, cursortxtcolor ,cursorcolor, offstrokecolor);
     exit = new Exit();
//     func = new Fgen();
//     freq = new Freq();
     getcode = new Getcode();
     save = new Save();
      serport = new Serial(this, "COM4", 9600);
     ch1 = new Serialread("CH1", g1color, - 180, 5, SICH1);
     ch2 = new Serialread("CH2", g2color, - 365, 6, SICH2);
     ch3 = new Serialread("CH3", g3color, - 550, 7, SICH3);
     
}
void draw()
{
  saveJSONArray(data, jsonfilename);
    data = loadJSONArray(jsonfilename);
 
  if(bimage == true)
  {
  image(bimg, 0, 0);
  }
    strokeWeight(2);
    fill(gfillcollor[0], gfillcollor[1], gfillcollor[2]);
  stroke(outlinecolor[0], outlinecolor[1], outlinecolor[2]);
  rect(WX, WY, WW, WH);
  
    stroke(linecolor[0], linecolor[1], linecolor[2]);
  line(WX, WY + (WH / 2), WX + WW, WY + (WH / 2));
  
 getcode.d();
  
    // func.gensin();
   //func.drawsin();
 
 // cursor.mccursor(OFF);
  
  save.drawoszib();

//  freq.gethz(); 
  
  if(mp == YES && mpt + 500 <= millis())
  {
  //   cursor.mccursor(ON); 
     
     ch1.mc();
     ch2.mc();
     ch3.mc();
  }
  
  ch1.drawserin();
  ch2.drawserin();
  ch3.drawserin();
  
  exit.nomc();
 //  saveJSONArray(data, "data.jason");
}

void mouseClicked()
{   
    saveJSONArray(data, jsonfilename);
    data = loadJSONArray(jsonfilename);
    
  mcc = true;
  
  getcode.mc();
    
 // cursor.mccursor(ON);
  
    save.changesavedatatype();
  save.oszibild(); 
  
  ch1.mc();
  ch2.mc();
  ch3.mc();
       
         //saveJSONArray(data, "data.jason");
  exit.mc();
}

void mousePressed()
{
  mp = YES;
  mpt = millis();  
}

void mouseReleased()
{
  mp = NO;
}

void keyPressed()
{
 ch1.kc();
 ch2.kc();
 ch3.kc();
}




   
  
  
