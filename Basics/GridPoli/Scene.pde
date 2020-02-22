class Scene {
  //Idee: Zwei Interpolatoren konstruieren dessen Punkte auf den Ecken einer Fläche (mit beliebig vielen Ecken) liegen und deren "Runner" auf den Kanten entlang laufen,
  //Die Eckpunkte wechseln dabei im Uhrzeigersinn, sodass 2 Runner "um" die Fläche laufen...
  //Ein weiterer Interpolator nimmt diese 2 "Runner" nun als Ausgangspunkte und bewegt sich innerhalb des Netzes
  //Benötigt: 3 Interpolatoren, und eine Liste in der die Ecken einer Fläche als Vektoren gelagert sind
  //          Variablen um innerhalb der Liste auf die Eckpunkte zuzugreifen (für die Rotation)

  ArrayList<Vektor3D> corners;
  IPoli3D _mainPoli;
  IPoli3D _movablePoint1;  
  IPoli3D _movablePoint2;

  int _p1CornerComingFrom;
  int _p1CornerGoingTo;

  int _p2CornerComingFrom;
  int _p2CornerGoingTo;

  Scene() {
    corners = new ArrayList<Vektor3D>();
    _movablePoint1 = new IPoli3D(0.5);
    _movablePoint2 = new IPoli3D(0.1);
    _mainPoli=new IPoli3D(0);

    //Startpunkte
    _p1CornerComingFrom = 0;
    _p1CornerGoingTo = 1;
    _p2CornerComingFrom = 2;
    _p2CornerGoingTo = 3;

    //Ausgangsfläche das Grid-Quadraht in XZ-Richtung mit Kantenlänge 350
    corners.add(new Vektor3D(0, 0, 0));
    corners.add(new Vektor3D(350, 0, 0));
    corners.add(new Vektor3D(350, 0, 350));
    corners.add(new Vektor3D(0, 0, 350));
  }


  void tik() {
    _setPoints();
    _movablePoint1.tik();
    _movablePoint2.tik();

    //Wechsel der Punkte im Uhrzeigersinn
    _circulationP1();
    _circulationP2();

    //Festlegen der "Runner" als Punkte des dritten Interpolators
    _mainPoli.setPoint1(_movablePoint1.getRunner());
    _mainPoli.setPoint2(_movablePoint2.getRunner());
    _mainPoli.tikLoop();
  }

  void _setPoints() {
    //Festlegen der Ausgangspunkte für die "Runner" entlang der Fläche
    _movablePoint1.setPoint1(corners.get(_p1CornerComingFrom));
    _movablePoint1.setPoint2(corners.get(_p1CornerGoingTo));
    _movablePoint2.setPoint1(corners.get(_p2CornerComingFrom));
    _movablePoint2.setPoint2(corners.get(_p2CornerGoingTo));
  }

  Vektor3D mainRunner() {
    return new Vektor3D(_mainPoli.getRunner().getX(), _mainPoli.getRunner().getY(), _mainPoli.getRunner().getY());
  }

  void render() {
    fill(255);   
    _mainPoli.render();
    noFill();
    _floor();
  }

//Ich bin mir nicht sicher, ob ich eine Methode hinbekomme, die als Parameter Interpolatoren bekommt und die "Hits" prüft mit auswirkungen auf die Variablen
//Daher habe ich gegen DRY verstoßen und 2 Methoden geschrieben:
  void _circulationP1() {
    if (_movablePoint1.Hit()) {
      _p1CornerComingFrom++;
      _p1CornerGoingTo++;
      if (_p1CornerComingFrom>=corners.size())
        _p1CornerComingFrom=0;
      if (_p1CornerGoingTo>=corners.size())
        _p1CornerGoingTo=0;
    }
  }
  void _circulationP2() {
    if (_movablePoint2.Hit()) {
      _p2CornerComingFrom++;
      _p2CornerGoingTo++;
      if (_p2CornerComingFrom>=corners.size())
        _p2CornerComingFrom=0;
      if (_p2CornerGoingTo>=corners.size())
        _p2CornerGoingTo=0;
    }
  }
  
  //Optionale Ebene für mich zum Testen des Lichtes....ich vermute das Licht benötigt jedoch mehr Polygone, also müsste der Floor aus einer Reihe an Flächen bestehen.
  void _floor() {
    pushMatrix();
    noStroke();
    translate(175, 50, 175);
    fill(200, 200, 20);
    box(350, 2, 350);
    noFill();
    popMatrix();
  }
  void runnerGlow() {
    pointLight(200, 200, 200, _mainPoli.getRunner().getX(), _mainPoli.getRunner().getY(), _mainPoli.getRunner().getZ());
  }
}
