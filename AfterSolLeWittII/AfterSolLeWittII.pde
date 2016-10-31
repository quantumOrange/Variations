PVector center;

Star[] stars;
int n = 26;
float dR,r,r0, rMax, deltaAlpha;
void setup() {
  size(400,600);
  colorMode(HSB, 360, 100, 100,100); 
  center = new PVector(0.5*width,0.5*height,0.0);
  deltaAlpha =0.05;
  r0 = 30;//initial radius of smallest star
  dR =33;//radius increment;
  rMax = r0 + dR*n; //radius of largest star;
  r = rMax;
  stars = new Star[n];
  float transparency = 100;
  color[] colorArray = {color(212,81,61,transparency),
                        color(357,83,55,transparency),
                        color(232,45,19,transparency),
                        color(21,67,49,transparency),
                        color(357,84,55,transparency),
                        color(215,57,27,transparency),
                        color(11,83,59,transparency),
                        color(213,73,42,transparency),
                        color(357,68,41,transparency),
                        color(21,23,47,transparency),
                        color(2,74,39,transparency),
                        color(359,71,58,transparency),
                        color(21,67,66,transparency),
                        };
  
  for(int i=0;i<n;i++) {
     r -= dR;
    color starColor = colorArray[(n-i-1)%13];
    stars[i] = new  Star(starColor, color(360,0,100,0),center,r ); 
    stars[i].alpha = PI*0.1+ i*deltaAlpha;
  }
  
}


void draw() {
   background(0,0,100);
   for(int i=0;i<n;i++) {
     stars[i].evolve();//they get bigger! and rotate!
     stars[i].display();
  }
  
  if (stars[0].outerRadius > rMax) {
      stars[0].outerRadius = 0;
      stars[0].innerRadius = 0;
      stars[0].alpha =stars[n-1].alpha - deltaAlpha;
      //we'ver made the biggest star into the smallest star.
      //now we need to move it to the end of the array so that its drawn on top;
      Star[] reorderdStars = new Star[n];
      for(int i=0; i<n-1;i++) {
        reorderdStars[i] = stars[i+1];
      }
      reorderdStars[n-1]=  stars[0];
      stars = reorderdStars;
  }
  
  
}


void keyPressed() {
   if (key == 's'){
     //save("AfterSolLeWitt.png");
   }
}