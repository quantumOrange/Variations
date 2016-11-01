int  lambda=200;
void setup() 
{
  size(400,400);
  frameRate(60);
  colorMode(HSB,360,100,100);
  background(0,0,100,100);
  noStroke();

}

void draw()
{
  background(0,0,100);
  
  
  fill(0,0,0);
  lambda=(lambda+1)%width;
  
  quad(0,lambda,  lambda,height,   width,height-lambda,   width-lambda, 0  );
}

void keyPressed() {
   if (key == 's'){
     save("AfterMalevich.png");
   }
 }