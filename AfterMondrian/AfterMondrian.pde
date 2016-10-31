
PVector crossPoint;
float hue=0;
int framecount = 0;
float freqencyOfWhite=0.618;//We will draw colored squares and white sqaure. This value determines the proportion that will be drawn as white

color firstColor;
color secondColor;


float delta;
boolean topLeftToBottomRight = true;


void setup() 
{
  size(400, 400);
  frameRate(60);
  colorMode(HSB,360,100,100,100);
  background(0,0,100,100);
  stroke(0,0,0);
  width
  height 
  hieght
}

void draw() 
{
 
 if (framecount % 60 == 0) {
  firstColor = randomColor(freqencyOfWhite);
  secondColor = randomColor(freqencyOfWhite);
  delta= 2 + 5* random(1);
  crossPoint = new PVector(random(width),random(height));
  topLeftToBottomRight= !topLeftToBottomRight;
 }
 
if(topLeftToBottomRight)
{

  //coloroed(or white) squares top left and bottom right with black cross over the top
  
  fill(firstColor);
  rect(0,0,crossPoint.x,crossPoint.y);
  
  fill(secondColor);
  rect(crossPoint.x,crossPoint.y,width,height);
  
}
else
{
    //coloroed(or white) squares bottom left and top right with black cross over the top
 
  fill(firstColor);
  rect(crossPoint.x,0,width,crossPoint.y);
  
  fill(secondColor);
  rect(0,crossPoint.y,crossPoint.x,height);
}


 cross(crossPoint,delta); 
 framecount++;
}
 
 
 void keyPressed() {
   if (key == 's'){
     save("AfterModrian.png");
   }
 }
 
 color randomColor(float frequencyOfWhite)
 {
    int[] pallet = new int[3];
   
   //colors plugged in by hand - should have an aloragrith for this
     pallet[0]=10;//red
     pallet[1]=50;//yellow
     pallet[2]=210;//blue
 
   
   
   if(random(1)>frequencyOfWhite)
  {
    return  color( pallet[int(random(3))],100,100,20);
  }
  else
  {
   return color(0,0,100,20); 
  }
  
 }
 
 void cross(PVector crossPoint, float thickness)
{
  strokeWeight(thickness);
  stroke(0,0,0,20);
  line(0,crossPoint.y,width ,crossPoint.y);
  line(crossPoint.x,0,  crossPoint.x ,width);
} 