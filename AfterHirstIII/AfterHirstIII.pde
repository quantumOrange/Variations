
Agent[] agents;
int numPerSide =10;
int  numAgents =numPerSide*numPerSide;




void setup() {
  size(500, 500);
  
  colorMode(RGB,1.0,1.0,1.0);
  
  background(1.0,1.0,1.0);
  
  agents= new Agent[numAgents];
  
  float unit = width/numPerSide;
  
    for (int i = 0; i< numPerSide; i++)
   {
      for (int j = 0; j< numPerSide; j++)
      {
       color c=color(1.0,1.0,1.0);
        agents[i*numPerSide +j] = new Agent(i*unit+0.5*unit,j*unit+0.5*unit,unit*0.25, c);
      }
    }
}


void draw() {
   background(1.0,1.0,1.0);



agents[q*numPerSide +p].evolve();


   for (int i =0; i< numAgents; i++){
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
