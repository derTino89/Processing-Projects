class Bricks{
Box Brick;
Vektor2D BrickSize;
int Farbe;
  
  Bricks(Vektor2D Location){                     // Jeder Brick ist Blau(80%) oder Rot(20%)
    BrickSize = new Vektor2D(80,20);
    Brick = new Box(Location,BrickSize);
    int zufall = int(random(100));
    if(zufall<=20){
      Farbe=200;
    }else Farbe =0;
  }
  
  void render(){        
    fill(Farbe,20,50);
    Brick.render();   
  }
  
  // HITBOX
  
  boolean isInside(Vektor2D killer, float diam){
    if(Brick.isInside(killer, diam)){
     return true; 
    }
    return false;
  }
  
  // AUSGABEN
  
  float ausgabeFarbe(){
    return Farbe;
  }
  
  float ausgabeBreite(){
    return BrickSize.getX();
  }
  
  float ausgabeHoehe(){
   return BrickSize.getY(); 
  }
  
}