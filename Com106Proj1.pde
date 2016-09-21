Node[] devices;
Connector[] cons;

final int space = 4000;
PVector[] stars;
PGraphics world;
final PVector eye = new PVector(space * -.1, 0, space * -.1);
int attached = -1;

void setup(){
  fullScreen(P3D);
  //size(700, 700, P3D);
  
  textureMode(NORMAL);
  background(0);
  
  stars = new PVector[300];
  for(int i = 0; i < stars.length; i ++){
    switch(i % 6){
      case 0:
      stars[i] = new PVector(space, random(space), random(space));
      break;
      case 1:
      stars[i] = new PVector(random(space), space, random(space));
      break;
      case 2:
      stars[i] = new PVector(random(space), random(space), space);
      break;
      case 3:
      stars[i] = new PVector(0, random(space), random(space));
      break;
      case 4:
      stars[i] = new PVector(random(space), 0, random(space));
      break;
      case 5:
      stars[i] = new PVector(random(space), random(space), 0);
      break;
    }
  }
  
  devices = new Node[15];
  devices[0]  = new Node(0,  new PVector(random(space), random(space), random(space)), new String[]{"Asus W/ Touchscreen", "Asus", "Laptop", "$750"}, 2016, new String[]{"Gaming", "General Computing", "Accessing Internet"}, new String[]{"Gaming", "General Computing", "Accessing Internet"}, loadImage("ASUS.jpg"));
  devices[1]  = new Node(1,  new PVector(random(space), random(space), random(space)), new String[]{"Asus W/out Touchsreen", "Asus", "Laptop", "$700"}, 2012, new String[]{"Gaming", "General Computing", "Accessing Internet"}, new String[]{"Gaming", "General Computing", "Accessing Internet"}, loadImage("ASUSold.jpg"));
  devices[2]  = new Node(2,  new PVector(random(space), random(space), random(space)), new String[]{"Samsung Galaxy S6", "Samsung", "Smart Phone", "$600"}, 2016, new String[]{"Contacing People", "Accessing Internet", "Music"}, new String[]{"Contacing People", "Accessing Internet", "Music"}, loadImage("Galaxy.jpg"));
  devices[3]  = new Node(3,  new PVector(random(space), random(space), random(space)), new String[]{"Droid RAZR", "Motorola", "Smart Phone", "$250"}, 2012, new String[]{"Contacting People", "Accessing Internet", "Music"}, new String[]{"Contacing People", "Accessing Internet", "Music"}, loadImage("RAZR.jpg"));
  devices[4]  = new Node(4,  new PVector(random(space), random(space), random(space)), new String[]{"Gameboy Advance", "Nintendo", "Mobile Console", "Given To Me"}, 2006, new String[]{"Gaming"}, new String[]{"Gaming", "Video"}, loadImage("GBA.png"));
  devices[5]  = new Node(5,  new PVector(random(space), random(space), random(space)), new String[]{"Gameboy advnace SP", "Nitendo", "Mobile Console", "$100"}, 2004, new String[]{"Gaming"}, new String[]{"Gaming", "Video"}, loadImage("GBASP.jpg"));
  devices[6]  = new Node(6,  new PVector(random(space), random(space), random(space)), new String[]{"HP Laptop", "Hewlett-Packard", "Laptop", "$600"}, 2011, new String[]{"General Computing", "Accessing Internet"}, new String[]{"Gaming", "Accesing Internet", "General Computing"}, loadImage("HPPavilion.jpg"));
  devices[7]  = new Node(7,  new PVector(random(space), random(space), random(space)), new String[]{"Nintendo DS", "Nintendo", "Mobile Console", "$130"}, 2005, new String[]{"Gaming"}, new String[]{"Gaming"}, loadImage("DS.png"));
  devices[8]  = new Node(8,  new PVector(random(space), random(space), random(space)), new String[]{"Nintendo Entertainment System", "Nintendo", "Home Console", "$200"}, 2015, new String[]{"Gaming"}, new String[]{"Gaming"}, loadImage("NES.jpg"));
  devices[9]  = new Node(9,  new PVector(random(space), random(space), random(space)), new String[]{"Xbox", "Microsoft", "Home Console", "Given To Me"}, 2013, new String[]{"Gaming"}, new String[]{"Gaming"}, loadImage("XBOX.jpg"));
  devices[10] = new Node(10, new PVector(random(space), random(space), random(space)), new String[]{"Samsung Smart TV", "Samsung", "Smart TV", "Given To Me"}, 2013, new String[]{"Video"}, new String[]{"Video"}, loadImage("TV.jpg"));
  devices[11] = new Node(11, new PVector(random(space), random(space), random(space)), new String[]{"Nintendo DSI", "Nintendo", "Mobile Console", "$190"}, 2009, new String[]{"Gaming"}, new String[]{"Gaming"},loadImage("DSI.jpg"));
  devices[12] = new Node(12, new PVector(random(space), random(space), random(space)), new String[]{"iPod touch 2nd Generation", "Apple", "Music Player", "Given To Me"}, 2008, new String[]{"Music", "Gaming", "Accessing Internet"}, new String[]{"Music", "Gaming", "Accessing Internet"}, loadImage("IPOD.png"));
  devices[13] = new Node(13, new PVector(random(space), random(space), random(space)), new String[]{"DSLR", "Canon", "Camera", "Given To Me"}, 2011, new String[]{"Pictures", "Video"}, new String[]{"Pictures", "Video"}, loadImage("CAMERA.jpg"));
  devices[14] = new Node(14, new PVector(random(space), random(space), random(space)), new String[]{"MP3 Player", "SanDisk", "Music Player", "Given To Me"}, 2005, new String[]{"Music"}, new String[]{"Music"}, loadImage("MP3.jpg"));
  
  cons = new Connector[0];
  for(int i = 0; i < devices.length; i ++){
    for(int j = i +1; j < devices.length; j ++){
      Connector temp = new Connector(devices[i], devices[j]);
      if(temp.thick > 1){
        cons = (Connector[])append(cons, temp);
      }
    }
  }
}

void draw(){
  colorMode(RGB, 255, 255, 255);
  background(50, 50, 100);
  
  if(attached == -1){
    stroke(255);
    for(int i = 0; i < stars.length; i ++){
      strokeWeight((float(frameCount % (i + 1)) / (stars.length + 1) * 5));
      point(stars[i].x, stars[i].y, stars[i].z);
    }
    
    switch(frameCount % 6){
      case 0:
      stars[frameCount % stars.length] = new PVector(space, random(space), random(space));
      break;
      case 1:
      stars[frameCount % stars.length] = new PVector(random(space), space, random(space));
      break;
      case 2:
      stars[frameCount % stars.length] = new PVector(random(space), random(space), space);
      break;
      case 3:
      stars[frameCount % stars.length] = new PVector(0, random(space), random(space));
      break;
      case 4:
      stars[frameCount % stars.length] = new PVector(random(space), 0, random(space));
      break;
      case 5:
      stars[frameCount % stars.length] = new PVector(random(space), random(space), 0);
      break;
    }
    
    camera(eye.x, eye.y, eye.z, space, space * .9, space, 0, 1, 0);
    //translate(width / 2, height / 2);
    //rotateY(radians(frameCount));
    
    for(int i = 0; i < devices.length; i ++){
      devices[i].drift();
      devices[i].disp();
    }
    
    for(int i = 0; i < cons.length; i ++){
      cons[i].disp();
      cons[i].update();
    }
  } else if(attached > -1){
    camera(devices[attached].pos.x - 150, devices[attached].pos.y, devices[attached].pos.z - 150, devices[attached].pos.x + 1, devices[attached].pos.y, devices[attached].pos.z, 0, 1, 0);
    devices[attached].disp();
  } else {
    attached ++;
  }
}

void mousePressed(){
  if(attached > -1){
    attached = -10;
  }
}