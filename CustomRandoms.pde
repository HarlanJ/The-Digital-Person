class Random{
  int seed, last;
  int top, mult, add;
  
  Random(int s){
    seed = s;
    last = s;
    
    top = MAX_INT;
    mult = 2147483543;
    add  = 2147483579;
  }
  
  Random(int s, int t, int m, int a){
    seed = s;
    last = s;
    
    top = t;
    mult = m;
    add = a;
  }
  
  float generate(float lo, float high){
    float temp = abs(((last + add) * mult) % top);
    last = int(temp);
    temp /= top;
    temp *= (high - lo);
    temp += lo;
    return temp;
  }
}