// jb20180515 Sehr geehrter Herr Liebenow, ich habe hier mal ein bischen aufgeräumt.
// Sie neigen zu Doppelberechnungen und Doppelten Wert-Speicherungen, weil Sie auf praktische
// Methoden Ihrer enthaltenen Klassen wie z.b. _myBox verzichten.
// Wenn Sie diese Methodenangebote verbessern, werden Ihre nutzenden Klassen kürzer, einfacher und fehlerfreier
// Es wäre noch einiges zu tun. Ich gebe nun erstmal wieder an Sie ab.
// Wenn Sie sich damit angefreundet haben und Ihr Projekt wieder zu ihrem eigenen gemacht haben,
// schaue ich gern wieder drüber.
// Ich sehe da noch ein Problem in Ihrem Konzept der Kollisionsberechnung. 
// Aber eines nach dem anderen.
class Balken {
  Box _myBox; // jb20180515 umbenannt
  //float _breite;  //wird im Programm verändert  jb20180515 redundante Information - steckt schon in _myBox
  //float _hoehe;   //bleibt konst. jb20180515 redundante Information - steckt schon in _myBox
  //Vektor2D _balkenGroesse; jb20180515 redundante Information - steckt schon in _myBox
  //Vektor2D _balkenOrt; jb20180515 redundante Information - steckt schon in _myBox

  int _speed;    //Balkengeschwindigkeit
  int _balkenwachstumsrate=20;
//  int _anfangsbreite; jb20180515 überflüssig

  Color _col;

  //Konstruktor erschafft Balken
  Balken() {
    _col=new Color();
    //_balkenGroesse = new Vektor2D(_breite, _hoehe);
    _speed=25;
    //_balkenOrt=new Vektor2D(width/2-(_balkenGroesse.getX()/2), height-60);
    _myBox=new Box(new Vektor2D(width/2, height-60), new Vektor2D(120, 20));
    _myBox.moveHorizontal(-_myBox.width()/2); // jb20180515 _myBox mittig setzen
  }

  // jb20180515 habe move() zerlegt
  void moveRight()
  {    
    if (_myBox.position().getX()+_speed>width)
      return; 
    _myBox.moveHorizontal(_speed);
  }

  void moveLeft() 
  {    

    if (_myBox.position().getX()-_speed<0) 
      return;

    _myBox.moveHorizontal(-_speed);
  }


  // jb20180515 Habe move() ausgemustert. Hohe Schachtelungstiefe, Komplizierte If-Bedingung
  // Im Objekt versteckte Tastaturabfrage - alles problematisch
  //void move{    
  //  if (keyPressed) {
  //    if (key==CODED) { 
  //      if (keyCode==LEFT && _balkenOrt.getX()>0) {
  //        _balkenOrt.setX(_balkenOrt.getX()-_speed);
  //      }
  //      if (keyCode==RIGHT && _balkenOrt.getX()<width-_balkenGroesse.getX()) {
  //        _balkenOrt.setX(_balkenOrt.getX()+_speed);
  //      }
  //    }
  //  }
  //  _myBox.setPosition(_balkenOrt);
  //}

  void render() {
    fill(_col.asProcessingColor());
    //_myBox.grow(_balkenGroesse); // jb20180515 Das gehoert nicht zu render
    _myBox.render();
  } 
  
  void changeColor()
  {
    _col.randomize();
  }


  // Hitbox
  boolean isInside(Vektor2D here, float r) {
    return _myBox.isInside(here, r); // jb20180515 kuerzere Schreibweise
  }

  void werdebreiter() {
    //    _balkenGroesse.setX(_breite+_balkenwachstumsrate);
    _myBox.growX(_balkenwachstumsrate); // jb20180515 hierher gelegt, thematisch
    //_breite=_breite+_balkenwachstumsrate; // jb2080515 redundante berechnung 
    //    _balkenOrt.setX(_balkenOrt.getX()-_balkenwachstumsrate/2);
  }

  void breitenreset() {
    // float mitte = _balkenOrt.getX()+_balkenGroesse.getX()/2; // jb20180515 das kann doch die box machen
    //_balkenGroesse.setX(_breite=_anfangsbreite);    
    float oldWidth=_myBox.width();
    _myBox.setSize(new Vektor2D(120, 20)); // jb20180515 hierher gelegt, thematisch
    float deltaX=_myBox.width()/2-oldWidth/2; //jb20180515 Korrekturterm, eigentlich interna von mybox
    _myBox.moveHorizontal(-deltaX); // jb20180515 sollte myBox intern automatisch machen
  }


  // Ausgabe von Variablen
  float ausgabex() {
    return _myBox.position().getX(); // jb20180515 umgestellt auf Box
  }
  float ausgabey() {
    return _myBox.position().getY(); // jb20180515 umgestellt auf Box
  }
  float ausgabebreite() {
    return _myBox.width(); // jb20180515 umgestellt auf Box
  }
  float ausgabehoehe() {
    return _myBox.height(); // jb20180515 umgestellt auf Box
  }
}