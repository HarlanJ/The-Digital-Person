class Node{
  PVector pos, mot;
  String name, brand, type, price;
  int year;
  String[] intendedFunction, usedFor;
  PShape skin;
  PImage texture;
  Random gen;
  int motState, motCool, id;
  int spin = int(random(360));
  
  
  final float speed = random(.1, .5) * 3;
  
  Node(int ident, PVector p, String[] ins, int y, String[] intFunc, String[] used, PImage looksLike){
    id = ident;
    
    gen = new Random(int(random(100000)));
    
    motState = int(gen.generate(0, 3));
    
    mot = new PVector(gen.generate(-1, 1), gen.generate(-1, 1), gen.generate(-1, 1));
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
    temp.fill(0, 0, 0);
    temp.line(temp.width / 2, 0, temp.width / 2, height);
    temp.textSize(temp.width / 50);
    temp.text("Name: " + name + "\nBrand: " + brand + "\nType: " + type + "\nPrice: " + price + "\nIntended uses: " + intUses + "\nMy use: " + myUses, 0, 0, temp.width / 2, temp.height);
    temp.image(looksLike, temp.width / 2, 0, temp.width / 2, temp.height);
    temp.endDraw();
    
    texture = temp;
    
    //image(temp, 0, 0, width, height);
    
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
    if(pos.x > space){
      pos.x = 0;
    } else if(pos.x < 0){
      pos.x = space;
    }
    
    if(pos.y > space){
      pos.y = 0;
    } else if(pos.y < 0){
      pos.y = space;
    }
    
    if(pos.z > space){
      pos.z = 0;
    } else if(pos.z < 0){
      pos.z = space;
    }
    
    if(motCool < 100){
      motCool ++;
      switch(motState){
        case 0:
        mot = rotX(mot, radians(.5));
        break;
        case 1:
        mot = rotY(mot, radians(.5));
        break;
        case 2:
        mot = rotZ(mot, radians(.5));
        break;
      }
    } else {
      motCool = int(gen.generate(15, 150));
      motState = int(gen.generate(0, 4));
    }
  }
  
  void disp(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    
    if(mouseX > screenX(pos.x, pos.y, pos.z) - 100 && mouseX < screenX(pos.x, pos.y, pos.z) + 100 && attached == -1){
      if(mouseY > screenY(pos.x, pos.y, pos.z) - 100 && mouseY < screenY(pos.x, pos.y, pos.z) + 100){
        scale(2);
        if(mousePressed){
          attached = id;
        }
      }
    }
    scale(200);
    rotateY(radians(float(frameCount) / 6 % 360 + spin));
    shape(skin);
    popMatrix();
    
    
  }
}