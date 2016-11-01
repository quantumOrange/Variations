class RandomGridWalkAgent {
  int p,q,p_,q_;
 
  
  RandomGridWalkAgent() {
     p=int(random(numPerSide));
     q=int(random(numPerSide));
  }
  
  
  
  void evolve() 
  {
     p_ = p +int(random(-2,2));
    if(p_>=0 && p_<numPerSide)
    {
      p=p_;
      
    }
    
    q_ = q +int(random(-2,2));
    if(q_>=0 && q_<numPerSide)
    {
      q=q_;
      
    }
  }
  
void display() {
  ellipse(x,y,d,d);
}
  
  
}
