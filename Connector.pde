class Connector{
  color col;
  int thick;
  Node beg, end;
  
  Connector(Node a, Node b){
    beg = a;
    end = b;
    
    int similarities = 0;
    if(a.brand.equals(b.brand)){
      similarities ++;
    }
    if(a.type.equals(b.type)){
      similarities ++;
    }
    if(a.year < b.year  + 1 && a.year > b.year - 1){
      similarities ++;
    }
    
    int temp = 0;
    for(int i = 0; i < a.intendedFunction.length; i ++){
      for(int j = 0; j < b.intendedFunction.length; j ++){
        if(a.intendedFunction[i].equals(b.intendedFunction[j])){
          temp ++;
        }
      }
    }
    temp /= 2;
    similarities += temp;
   
    temp = 0;
     for(int i = 0; i < a.usedFor.length; i ++){
       for(int j = 0; j < b.usedFor.length; j ++){
         if(a.usedFor[i].equals(b.usedFor[j])){
           temp ++;
         }
       }
     }
     temp /= 2;
     similarities += temp;
     
     
     //similarites should max at 8
     
     thick = int(sq(similarities));
     colorMode(HSB, 255, 100, 100);
     col = color(random(255), (50 / 8) * thick, 50);
  }
  
  void disp(){
    pushStyle();
    strokeWeight(thick);
    stroke(col);
    line(beg.pos.x, beg.pos.y, beg.pos.z, end.pos.x, end.pos.y, end.pos.z);
    popStyle();
  }
}