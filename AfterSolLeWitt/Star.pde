
class Star
{
  PVector center;
  int numberOfPoints;
  float outerRadius;
  float innerRadius;
  float ratio;
  color starColor;
  float theta; // angle  between vertex = (angle between points of star) /2
  float alpha; //angle rotates star 
  // boolean stroked;
  // boolean filled;
  
 Star() 
  {
     numberOfPoints=5;
     outerRadius= 20;
     innerRadius = 10;
     ratio = 0.5;
    // stroked=false;
    // filled=true;
     //starColor = color(0,100,100,100);
     center = new PVector(30,30);
     //center =new PVector(150.0,150.0);
     theta= PI/numberOfPoints;
     alpha= theta*0.5;
  }
  
  Star(color c, PVector centerPoint , float radius) 
  {
     numberOfPoints=5;
     outerRadius= radius;
     ratio = 1/sqrt(5);
     innerRadius = radius*ratio;
     starColor = c;
    
     center = centerPoint;
     
     theta= PI/numberOfPoints;
     alpha= theta*0.5;
  }
  
  void evolve()
  {
    outerRadius += 0.5 ;
    innerRadius = outerRadius*ratio;
  }
  
  void display()
  {
     fill(starColor);
     stroke(starColor);
     pushMatrix();
       translate( center.x, center.y);
       rotate(alpha);
       beginShape(TRIANGLE_FAN);
         vertex(0,0);
         for(int i=0;  i<2*numberOfPoints;  i=i+2)
         {
           vertex(  innerRadius*cos(i*theta)     ,  innerRadius*sin(i*theta) );
           vertex( outerRadius*cos((i+1)*theta) ,   outerRadius*sin((i+1)*theta));
         }
         vertex(  innerRadius , 0);
         vertex(0,0);
       endShape();
     popMatrix();

  } 
}