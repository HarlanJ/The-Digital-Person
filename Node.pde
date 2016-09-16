class Node{
  PVector pos, mot;
  String name, brand, type, price;
  int year;
  String[] intendedFunction, usedFor;
  PShape skin;
  
  
  final float speed = random(.1, .5) * 10;
  
  Node(PVector p, String[] ins, int y, String[] intFunc, String[] used, PImage looksLike){
    //println(looksLike);
    
    mot = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
    mot.setMag(speed);
    
    pos = p;
    
    name = ins[0];
    brand = ins[1];
    type = ins[2];
    price = ins[3];
    
    year = y;
    
    intendedFunction = intFunc;
    usedFor = used;
    
    
    PGraphics temp = createGraphics(800, 400);
    
    String intUses = new String();
    for(int i = 0; i < intendedFunction.length; i ++){
      intUses += intendedFunction[i];
      if(i < (intendedFunction.length - 1)){
        intUses += ", ";
      }
    }
    String myUses = new String();
    for(int i = 0; i < usedFor.length; i ++){
      myUses += usedFor[i];
      if(i < usedFor.length - 1){
        myUses += ", ";
      }
    }
    
    temp.beginDraw();
    color c = color(random(100, 255), random(100, 200), random(100, 200));
    temp.background(c);
    temp.fill(255 - red(c), 255 - green(c), 255 - blue(c));
    temp.line(temp.width / 2, 0, temp.width / 2, height);
    temp.text("Name: " + name + "\nBrand: " + brand + "\nType: " + type + "\nPrice: " + price + "\nIntended uses: " + intUses + "\nMy use: " + myUses, 0, 0, temp.width / 2, temp.height);
    temp.image(looksLike, temp.width / 2, 0, temp.width / 2, temp.height);
    temp.endDraw();
    
    image(temp, 0, 0, width, height);
    
    skin = createShape();
    skin.beginShape(QUADS);
    skin.texture(temp);
    skin.noStroke();
    
    skin.vertex(-1, -1, -1,  0, 0);
    skin.vertex( 1, -1, -1, .5, 0);
    skin.vertex( 1,  1, -1, .5, 1);
    skin.vertex(-1,  1, -1,  0, 1);
    
    skin.vertex( 1, -1, -1, .5, 0);
    skin.vertex( 1, -1,  1,  1, 0);
    skin.vertex( 1,  1,  1,  1, 1);
    skin.vertex( 1,  1, -1, .5, 1);
    
    skin.vertex( 1, -1,  1,  0, 0);
    skin.vertex(-1, -1,  1, .5, 0);
    skin.vertex(-1,  1,  1, .5, 1);
    skin.vertex( 1,  1,  1,  0, 1);
    
    skin.vertex(-1, -1,  1, .5, 0);
    skin.vertex(-1, -1, -1,  1, 0);
    skin.vertex(-1,  1, -1,  1, 1);
    skin.vertex(-1,  1,  1, .5, 1);
    
    skin.vertex(-1, -1, -1, 0, 0);
    skin.vertex( 1, -1, -1, 0, 0);
    skin.vertex( 1, -1,  1, 0, 0);
    skin.vertex(-1, -1,  1, 0, 0);
    
    skin.vertex(-1,  1, -1, 0, 0);
    skin.vertex( 1,  1, -1, 0, 0);
    skin.vertex( 1,  1,  1, 0, 0);
    skin.vertex(-1,  1,  1, 0, 0);
    
    skin.endShape();
  }
  
  void drift(){
    pos.add(mot);
  }
  
  void disp(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    scale(200);
    shape(skin);
    popMatrix();
  }
}