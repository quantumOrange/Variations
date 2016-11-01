Agent[] agents;
int  numAgents =30;
int a=1;

float margin=100;

void setup() {
  size(1000, 1000);
 
   colorMode(RGB,1.0,1.0,1.0,255);
    background(1.0,1.0,1.0);
  agents= new Agent[numAgents];
   
    
    for (int i = 0; i< 10; i++) 
    {
     color  c =color(1.0,1.0,0.0);
     PVector pos= new PVector(random(2*margin,width-2*margin),random(2*margin,height-2*margin));
     PVector mom= new PVector(0.0,0.0);
      agents[i] = new Agent(pos,mom,random(2.0,7.0),c );
    }
    
    
    for (int i = 10; i< 20; i++) 
    {
     color  c =color(1.0,1.0,1.0);
     PVector pos= new PVector(random(2*margin,width-2*margin),random(2*margin,height-2*margin));
     PVector mom= new PVector(0.0,0.0);
      agents[i] = new Agent(pos,mom,random(2.0,7.0),c );
    }
    
     for (int i = 20; i< numAgents; i++) 
    {
     color  c =color(0.0,0.0,0.0);
     PVector pos= new PVector(random(2*margin,width-2*margin),random(2*margin,height-2*margin));
     PVector mom= new PVector(0.0,0.0);
      agents[i] = new Agent(pos,mom,random(2.0,7.0),c );
    }
}

void draw() {
  
  //background(1.0,1.0,1.0);
  fill(1.0,1.0,1.0,1);
//  rect(0,0,width,height);
  
   for (int i =0; i< numAgents; i++){
     
     
     // for each agent sum over all other agents
    float sum=0;
    float dx, dy;
    float dr=0;
    float dv_x = 0;
    float dv_y = 0;
    
    
    for (int j =0; j< numAgents; j++){
       // dx = agents[j].x-agents[i].x;
      //  dy = agents[j].y-agents[i].y;
      //  dr =sqrt(sq(dx)+sq(dy));
       // if(dr!=0){
       //  dv_x = dv_x +a*dx/pow(dr,3);
       //  dv_y = dv_y +a* dy/pow(dr,3);
        }
          
       
  
    
     
  agents[i].display();
  //PVector dp = new PVector(dv_x,dv_y);
  PVector dp =Guassian();
  dp.mult(0.5);
  agents[i].evolve(dp);
   }
}



class Agent {
 
 PVector q,p;
 // float x, y;
 // float p_x, p_y;
  float radius,diameter;
  color c;
  float r,g,b;
  float temp;
  Agent() {
    
 
  }
  
  Agent(PVector position,PVector momentum,float r,color ellipseColor) {
   q=position;
   p=momentum;
    radius=r;
    diameter=2*r;
    c = ellipseColor;
    r=red(c);
    g=green(c);
    b=blue(c);
  }
  
  void evolve( PVector dp) {
    
    if(q.x>width-margin && dp.x>0)
    {
     dp.x=-dp.x; 
    }
    
    if(q.x<margin && dp.x<0)
    {
     dp.x=-dp.x; 
    }
    
    if(q.y>height-margin && dp.y>0)
    {
     dp.y=-dp.y; 
    }
    
    if(q.y<margin && dp.y<0)
    {
     dp.y=-dp.y; 
    }
    
    
 p.add(dp);
    p.normalize();
    p.mult(3.0);
    q.add(p);
   
   
   
   
   temp = diameter+random(-1,1);
   if(temp>0.0 && temp<4*radius)
   {
     diameter=temp;
   }
  }
  
void display() {
  fill(c);
  noStroke();
  ellipse(q.x,q.y,diameter,diameter);
}
  
  
}

PVector Guassian()
{
  float R = sqrt( -2*log(random(1)) );
  float theta =   2*PI*random(1) ;
  
  //Box–Muller method 
  return new PVector(R*cos(theta), R*sin(theta));  
}
