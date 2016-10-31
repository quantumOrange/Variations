PVector center;
color kleinBlue;
float a = 1.0,b = 1.0,c = 1.0,d = 1.0; //insets
float ds = 20; //scale of insets

float gamma;//cylclic parameter
int framesPerCycle = 2000;
float gammaIncrement;

void setup() {
  size(1000,1000);
  colorMode(HSB, 360, 100, 100); 
  kleinBlue = color(241,54,58);
  fill(kleinBlue);
  noStroke();
  gamma = 0.0;
  gammaIncrement =  TWO_PI/ framesPerCycle;
}


void draw() {
  gamma +=  gammaIncrement;
  a = 1.0 + cos(gamma);
  b = 1.0 + sin(gamma);
  c = 1.0 + cos(-gamma + HALF_PI);
  d = 1.0 + sin(-gamma + HALF_PI);
  
  
  
  
   background(0,0,100);
   fill(kleinBlue);
   //ellipse(center.x,center.y,250,250);
   rect(0+a*ds,0+b*ds,width -(a+c)*ds,height - (b+d)*ds);
}


void keyPressed() {
   if (key == 's'){
     save("AfterKlein.png");
   }
}