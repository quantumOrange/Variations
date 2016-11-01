Agent[] agents;

int  numAgents =387;
boolean increasing=true;
int p,q,p_,q_;


PVector center, vertex;

void setup() {
  size(500, 500);
  colorMode(RGB,1.0,1.0,1.0);
  background(1.0,1.0,1.0);
  agents= new Agent[numAgents];
 center = new PVector( width/2.0, height/2.0);
    for (int i = 0; i< numAgents; i++)
   {
      vertex = goldenPoint(i+1);
  vertex.mult(12.0);
  vertex.add(center);
  float grey=0.5;
       color c=color(grey,grey,grey);
       
        agents[i] = new Agent(vertex.x,vertex.y,7, c);
      
    }
    
    p=0;
    
}


void draw() {
   background(1.0,1.0,1.0);
   
if(increasing)
{
  p++;
}
else
{
  p--;
}

if(p== numAgents-1)
{
  increasing=false;
}
if(p==0)
{
  increasing=true;
}


agents[p].evolve();


   for (int i =0; i< numAgents; i++)
   {
   agents[i].display();
   }
    
   println(frameRate);  
  
}



class Agent {
  color c;
  float r,g,b;
  float x, y;
  float p_x, p_y;
  float radius,d;
 
  
  Agent() {
    
  x=1;
  y=1;
  p_x =1;
  p_y =1;
  radius=1;
  }
  
  Agent(float x_pos, float y_pos,float rad,color col)
  {
    x = x_pos;
    y = y_pos;
    radius=rad;
    d=2*rad;
    c=col;
    r=red(c);
    g=green(c);
    b=blue(c);
  }
  
  void evolve() 
  {
  //p_x = p_x+ dp_x;
  //p_y = p_y+ dp_y;
    c =color(random(1.0),random(1.0),random(1.0));
  
   
   // x = x + p_x;
   // y = y + p_y;
   
    
  }
  
void display() {
  noStroke();
  fill(c);
  ellipse(x,y,d,d);
}
  
  
}

PVector goldenPoint(int n)
{
  float theta = 2.39996*n;
  float r=sqrt(n);
 return new PVector(r*sin(theta),r*cos(theta));
}

void keyPressed() {
   if (key == 's'){
     save("AfterHirstV.png");
   }
 }