class UI extends Listener{
  
  
  UI(){
    super();
  }
  
  void tic(){
  
  }
  void render(PGraphics bitmap2D){
    bitmap2D.stroke(255);
    bitmap2D.line((width/2)-10,height/2,width/2+10, height/2);
    bitmap2D.line(width/2,(height/2)-10, width/2, (height/2)+10);
    bitmap2D.noStroke();
  }

}