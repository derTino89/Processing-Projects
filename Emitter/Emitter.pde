//partikelsystem
PartSys gPS;

void setup(){
  size(1000,1000);
  gPS=new PartSys();
}

void draw(){
  background(0);
  gPS.tic();
  gPS.render();
}

void mouseReleased(){
  gPS.make(mouseX,mouseY); 
}