Table devs;

Node[] devices;

void setup(){
  //fullScreen(P3D);
  size(700, 700, P3D);
  //surface.setTitle("Hello");
  
  devs = loadTable("Digital Me Devices - Sheet1.csv", "header");
  
  devices = new Node[devs.getRowCount()];
  
  for(int i = 0; i < devs.getRowCount(); i ++){
    devices[i] = new Node(new PVector(350, 350, -700), 
                          new String[]{devs.getString(i, "Name"), devs.getString(i, "Brand"), devs.getString(i, "Type"), devs.getString(i, "Price")},
                          devs.getInt(i, "When I Got It"), split(devs.getString(i, "Intended Function"), ';'), split(devs.getString(i, "How I Use(d) It"), ';'),
                          loadImage("IMG_0636.jpg"));
                          
    //println(
  }
  
  textureMode(NORMAL);
  background(0);
  
  //devices = new Node[1];
  //devices[0] = new Node(new PVector(350, 350, 0), new String[]{"N", "B", "T", "$"}, 2012, new String[]{"Gaming", "Video"}, new String[]{"Gaming"}, loadImage("IMG_0636.jpg"));
}

void draw(){
  background(0);
  
  //translate(350, 350);
  //rotateY(radians(frameCount));
  
  for(int i = 0; i < devices.length; i ++){
    devices[i].drift();
    devices[i].disp();
  }
}