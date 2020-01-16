class Grid {
  ArrayList<Line3D> FloorLines;

  Grid() {
    FloorLines=new ArrayList<Line3D>();
  }

  void addLineZ(float amount, float distance, float lenght) {
    for (int i=0; i<amount; i++) {
      FloorLines.add(new Line3D(new Vektor3D(i*distance, 0, 0), new Vektor3D(i*distance, 0, lenght)));
    }
  }

  void addLineX(float amount, float distance, float lenght) {
    for (int i=0; i<amount; i++) {
      FloorLines.add(new Line3D(new Vektor3D(0, 0, i*distance), new Vektor3D(lenght, 0, i*distance)));
    }
  }

  void showZero() {         // Ursprung als Orientierung
    fill(190, 0, 30);
    noStroke();
    sphere(3);
    noFill();
  }


  void render() {
    stroke(20, 190, 10);
    strokeWeight(1);
    for (int i=0; i<FloorLines.size(); i++) {
      FloorLines.get(i).render();
    }
    noStroke();
  }

  void addLineXBiDirect(float amount, float distance, float lenght) {
    addLineX(amount, distance, lenght);
    addLineX(amount, distance, -lenght);
    addLineX(amount, -distance, -lenght);
    addLineX(amount, -distance, lenght);
  }
  void addLineZBiDirect(float amount, float distance, float lenght) {
    addLineZ(amount, distance, lenght);
    addLineZ(amount, distance, -lenght);
    addLineZ(amount, -distance, -lenght);
    addLineZ(amount, -distance, lenght);
  }
  void defaultGreyGrid() {         //bewusst mit der render(), um das "globale" Grid mit nur einer Methode zu aktivieren
    addLineXBiDirect(80, 50, 4000);
    addLineZBiDirect(80, 50, 4000);    
    strokeWeight(0.5);
    stroke(50, 50, 50);
    render();
  }
}
