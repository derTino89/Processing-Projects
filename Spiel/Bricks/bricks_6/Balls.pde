class Balls{
  
Vektor2D VBall;       //Ortsvektor Ball
float speedX;         //Anfangsrichtung Ball in X
float speedY = -10;   //Ballfluggeschwindigkeit für alle Bälle gleich
float diam;           //Balldurchmesser
int farbe = 30;       //Ballfarbe für alle gleich

TTracer T;
float Tracerlaenge;
  
  Balls(float x, float y, float r){
    diam = r;
    VBall = new Vektor2D(x,y);      //Ballkoordinaten bekommen eigenen Vektor
    speedX = random(-10,10);        //jeder Ball hat neuen Zufallswert
    Tracerlaenge = random(10,20);   //jeder Ball hat unterschiedlich langen Tracer
    T = new TTracer(Tracerlaenge,diam);
  }
  
  void move(){     
    
    //Bewegung des Balles und Abprallen am Bildschirmrand:
    
    VBall.addiereY(speedY);
    VBall.addiereX(speedX);
    
    if(VBall.getY()<=0){
      speedY=-speedY;
    }
    if (VBall.getX()+diam>=width || VBall.getX()<0){
      speedX=-speedX;
    }
            
  //Abprallen des Balles am sich verlängernden Balken:
      
   if(b.isInside(VBall,diam)){
     speedY=-speedY;
     b.changecolorofbalken();
     b.werdebreiter();
   }
   
   T.move(VBall.getX(),VBall.getY()); // Tracerbewegung
  }
  
  //Rendern des Balles/Quadrates + seinen Tracer
  void render(){
    fill(farbe++,120,50);    
    rect(VBall.getX(),VBall.getY(),diam,diam);
    T.render();
    if(VBall.getY()>height){
       b.breitenreset();
    } 
  }
  

  boolean kill(){   //Prüft ob Ball unten aus dem Bildschirmrand verschwindet
   if(VBall.getY()>height){
     return true; 
   }return false;
  }
}