class Balls{
  
Vektor2D VBall;       //Ortsvektor Ball
float speedX;         //Anfangsrichtung Ball in X
float speedY;         //Ballfluggeschwindigkeit
//Vektor2D Vspeed;
float diam;           //Balldurchmesser
int farbe = 30;       //Ballfarbe für alle gleich

TTracer T;
float Tracerlaenge;
 
  
  
 Balls(float x, float y, float r){
    diam = r;                       //Balldurchmesser
    VBall = new Vektor2D(x,y);      //Ballkoordinaten bekommen eigenen Vektor
    speedX = random(-10,10);        //Ballrichtung
    speedY = -5;                    //Ballgeschwindigkeit
    
    Tracerlaenge = random(10,20);          //jeder Ball hat unterschiedlich langen Tracer
    T = new TTracer(Tracerlaenge,diam);
    //Vspeed = new Vektor2D(speedX,speedY);
  }
  
  
 void move(){     
    
    //Bewegung des Balles und Abprallen am Bildschirmrand:
    
    VBall.addiereY(speedY);
    VBall.addiereX(speedX);
    //VBall.addiereV(Vspeed);
    
    if(VBall.getY()<=0){
      speedY=-speedY;
    }
    if (VBall.getX()+diam>=width || VBall.getX()<0){
      speedX=-speedX;
    }
            
  //Abprallen am Balken: (sollte die Hitbox von der Seite getroffen werden, ändert sich trotzdem die Y-Richtung  ==>  DOOF)
      
   if(bar.isInside(VBall,diam)){
     speedY=-speedY;
     
   }
   
  //Abprallen an den Bricks  
   
   for(int i=0;i<gBrick.size();i++){
     if(gBrick.get(i).isInside(VBall,diam)){
       if(gBrick.get(i).ausgabeFarbe()!=200){    // Blaue Bricks verbreitern den Balken
         speedY=-speedY;
         bar.werdebreiter();
       }else{                                    // Rote Bricks setzen ihn auf die Anfangslänge zurück und ändern seine Farbe
         speedY=-speedY;
         bar.breitenreset();
         bar.changecolorofbalken();
       }
     }
   }
 
   T.move(VBall.getX(),VBall.getY());            // Tracerbewegung
 }
  
  
  //Rendern des Balles/Quadrates + seinen Tracer
  
  void render(){
    fill(farbe++,120,50);    
    rect(VBall.getX(),VBall.getY(),diam,diam);
    T.render();
    if(VBall.getY()>height){
       bar.breitenreset();
    } 
  }

  boolean kill(){   //Prüft ob Ball unten aus dem Bildschirmrand verschwindet
   if(VBall.getY()>height){
     return true; 
   }return false;
  }
  
  
  // AUSGABEN
  
  Vektor2D ausgabeOrt(){
    return VBall;
  }
  
  float ausgabeRad(){
    return diam;
  }
  
  float ausgabeX(){
    return VBall.getX();
  }
  
  float ausgabeY(){
    return VBall.getY();
  }

  
  
}