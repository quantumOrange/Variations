
int n =15;  //number of columns/rows
 float radius = 12;
float diameter; //diameter of spots
float space; // spacing of spots
Agent[] agents;


int  numAgents =n*n;




void setup() {
  size(600, 600);
  colorMode(RGB,1.0,1.0,1.0);
  background(1.0,1.0,1.0);
  agents= new Agent[numAgents];
   diameter = 2*radius;
  space = ( width - n*diameter)/(n-1);
  
  float unit = width/n;
    for (int i = 0; i< n; i++)
   {
      for (int j = 0; j< n; j++)
      {
       color c=color(random(1.0),random(1.0),random(1.0));
        agents[i*n +j] = new Agent(i*space +(2*i+1)*radius,j*space +(2*j+1)*radius,radius, c);
      }
    }
}


void draw() {
   background(1.0,1.0,1.0);

   for (int i =0; i< numAgents; i++){
 agents[i].display();
  agents[i].evolve(0.05);
   }
    
  // println(frameRate);  
  
}



class Agent {
  color c;
  float r,g,b;
  float x, y;
  float p_x, p_y;
  float radius;
 float r0;
  
  Agent() {
    
  x=1;
  y=1;
  p_x =1;
  p_y =1;
  radius=1;
  r0=1;
  r=1;
  }
  
  Agent(float x_pos, float y_pos,float rad,color col)
  {
    x = x_pos;
    y = y_pos;
    radius=rad;
    r0=rad;
    r=1.0;
    
    c=col;
    r=red(c);
    g=green(c);
    b=blue(c);
  }
  
  void evolve(float dt) 
  {
  //p_x = p_x+ dp_x;
  //p_y = p_y+ dp_y;
    
  float temp =  r + random(-dt,dt); 
  //A random walk in color space
  
  temp =  r + random(-dt,dt); 
      if(temp<=1.0 && temp>=0.2)
     {
      r=temp;
      radius = r0*r;
     }  
  
     if(temp<=1.0 && temp>=0.0)
     {
      r=temp;
     } 
     temp =  g + random(-dt,dt); 
      if(temp<=1.0 && temp>=0.0)
     {
      g=temp;
     }  
      temp =  b + random(-dt,dt);  
  
      if(temp<=1.0 && temp>=0.0)
     {
      b=temp;
     } 
     
     println("r:"+r+"g:"+g +"b:"+b);
      c = color(r,g,b);
   // x = x + p_x;
   // y = y + p_y;
   
    
  }
  
void display() {
  noStroke();
  fill(c);
  ellipse(x,y,2*radius,2*radius);
}
  
  
}