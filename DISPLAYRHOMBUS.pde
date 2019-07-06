import processing.svg.*;

PShape image;

void setup()
{ beginRecord(SVG,"square.svg");
  size(600,600);
  image=loadShape("squares.svg");
  noLoop();
  
}

void draw()
{
  shapeMode(CENTER);
  shape(image,width/2,height/2,width,height);
  endRecord();
  //saveFrame("a.png");
}
