
PVector crossPoint;
float hue=0;
float proportionOfWhite=0.618;
//color[] pallet =new color[9];

float delta;
boolean topLeftToBottomRight = true;
void setup() 
{
  size(400, 400);
  frameRate(1);
  colorMode(HSB,360,100,100,100);
  background(0,0,100,100);
  
 
  
  stroke(0,0,0);
}

void draw() 
{
if(topLeftToBottomRight)
{
  
  //coloroed(or white) squares top left and bottom right with black cross over the top
  crossPoint = new PVector(random(width),random(width));
  delta= 5 + 10* random(1);
  
  if(random(1)>proportionOfWhite)
  {
    
  }
  fill(randomColor(proportionOfWhite));
  rect(0,0,crossPoint.x,crossPoint.y);
  fill(randomColor(proportionOfWhite));
  
  rect(crossPoint.x,crossPoint.y,width,width);
  cross(crossPoint,delta);
  
topLeftToBottomRight=false;
}
else
{
    //coloroed(or white) squares bottom left and top right with black cross over the top
  crossPoint = new PVector(random(width),random(width));
   delta= 5 + 10* random(1);
  fill(randomColor(proportionOfWhite));
  rect(crossPoint.x,0,width,crossPoint.y);
  fill(randomColor(proportionOfWhite));
  
  rect(0,crossPoint.y,crossPoint.x,width);
  cross(crossPoint,delta);
  
  topLeftToBottomRight=true;
}
 


  
}
 
 color randomColor(float proportionOfWhite)
 {
    int[] pallet = new int[3];
   
   //colors plugged in by hand 
     pallet[0]=10;
     pallet[1]=50;
    pallet[2]=210;
 
   
   
   if(random(1)>proportionOfWhite)
  {
    return  color( pallet[int(random(3))],100,100,random(100));
  }
  else
  {
   return color(0,0,100,random(100)); 
  }
  
 }
 
 void cross(PVector crossPoint, float thickness)
{
  strokeWeight(thickness);
  stroke(0,0,0);
  line(0,crossPoint.y,width ,crossPoint.y);
  line(crossPoint.x,0,  crossPoint.x ,width);
} 

void keyPressed() {
   if (key == 's'){
     save("AfterModrianI.png");
   }
 }