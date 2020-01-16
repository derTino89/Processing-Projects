class Balls{
  
Vektor VBall;
float speedX;
float speedY = -15;   //Ballfluggeschwindigkeit für alle Bälle gleich
float diam = 20;      //Balldurchmesser für alle gleich
int farbe = 30;       //Ballfarbe für alle gleich

Tracer T;
float Tracerlaenge;

boolean stirb;        // Terminationsvariable zum terminieren des Balles bei Verlassen des Bildschirmes im äußersten Süden


  
  Balls(float x, float y){
    VBall = new Vektor(x,y);        //Ballkoordinaten bekommen eigenen Vektor
    speedX = random(-10,10);        //jeder Ball hat neuen Zufallswert
    Tracerlaenge = random(10,20);   //jeder Ball hat unterschiedlich langen Tracer
    T = new Tracer(Tracerlaenge);
  }
  
  void move(){     
    
    //Bewegung des Balles und Abprallen am Bildschirmrand plus Tracer:
    
    VBall.addiereY(speedY);
    VBall.addiereX(speedX);
    
    if(VBall.getY()-diam<0){
      speedY=-speedY;
    }
    if (VBall.getX()+diam>width || VBall.getX()-diam<0){
      speedX=-speedX;
    }
    
    T.move(VBall.getX(),VBall.getY());
    
    
  //Abprallen des Balles am sich verlängernden Balken:
      
   if(b.isInside(VBall.getX(),VBall.getY(),diam/2)){
     speedY=-speedY;
     b.changecolorofbalken();
     b.werdebreiter();
   }
  }
  
  
  void render(){
    fill(farbe++,120,50);
    rectMode(CENTER);
    rect(VBall.getX(),VBall.getY(),diam,diam);
    T.render();
    if(VBall.getY()>height){
       b.breitenreset();
    }
  
  }

  boolean kill(){   //Prüft ob Ball unten aus dem Bildschirmrand verschwindet
   if(VBall.getY()>height)
     stirb = true;     
     return stirb;   
  }
}