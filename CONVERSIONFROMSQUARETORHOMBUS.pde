//Converting square pixelation of an image rotated 45 degree in photoshop to rhombus(rotated 45 degree )square pixelation 

import processing.svg.*;

PGraphics pG;
PImage img;

//co-ordinates for Pgraphics image
int xW;
int yH;

//storing color values of pixels on the left of center column & right of center column in Pgraphics image
color c1; 
color c2;

//co-ordinates for diagonal rectangles
int xD;
int yD;
int spacing;

//variable to change yD after every diagonal line
int colyD;

//variable to identify column no. on either side of center column in image
int colG;

void setup()
{ 
  size(940, 940);
  //background(255);
  img=loadImage("arotated.png");
  pG=createGraphics(img.width, img.height);
  pG.beginDraw();
  pG.image(img, 0, 0);
  pG.endDraw();

  spacing=5;
  xD=spacing;
  yD=spacing;

  colyD= spacing;
  colG=0;

  xW=pG.width/2;
  beginRecord(SVG, "filename.svg");
  noLoop();
}

void draw()
{  
  for (int i=0; i<=93; i++)
  {
    xD=spacing;
    yD=colyD;
    for ( yH=colyD; yH<(pG.height-colG); yH+=spacing*2)
    { 
      //Getting colors of pixel on the left of center column & right of center column in Pgraphics image
      c1=pG.get(xW + colG, yH);
      c2=pG.get(xW - colG, yH);
      
      //Drawing rectangle above the diagonal
      push();
      translate(yD, xD);
      rotate(radians(45));
      fill(c1);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, 10/1.41421356237, 10/1.41421356237);
      pop();

      //Drawing rectangle below the diagonal
      push();
      translate(xD, yD);
      rotate(radians(45));
      fill(c2);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, 10/1.41421356237, 10/1.41421356237);
      pop();

      xD=xD+spacing;
      yD=yD+spacing;
    }
    colyD+=spacing*2;
    println(colyD);
    colG+=spacing*2;
  }
  endRecord();
}
