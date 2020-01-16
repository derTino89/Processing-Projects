class Tracer{

  FloatList lx; //Speicherreservierung für Listen halt
  FloatList ly;
  int Tlaenge;
  float Tbreite; //Durchmesser vong Kreis her
  
  
  Tracer(int TL){ //Bekommt TL aus der Ball-Klasse
    lx=new FloatList(); //Liste für X-Koordinaten des Balles wird erstellt
    ly=new FloatList(); //Liste für Y-Koordinaten des Balles wird erstellt
    Tlaenge=TL;
    Tbreite=3;
    
  }
  
  void move(float x, float y){ //bekommt Koordinaten aus der Ballklasse übergeben
    lx.append(x); //Speichert die Koordinaten in den Listen
    ly.append(y);
    
    if(lx.size()>Tlaenge){ //beschränkt die Listenlänge aud die Tracerlänge und überschreibt danach von vorn beginnend
     lx.remove(0);
     ly.remove(0);
    }
  }
  
  void render(){
    for(int i=lx.size()-2;i>=0;i--){ //Zeichnet rückwärts an den letzten gespeicherten Koordianten des Balles kleine Kreise
      float kx = lx.get(i);
      float ky = ly.get(i);
      ellipse(kx,ky, Tbreite, Tbreite);
    }
    
  }
  
}