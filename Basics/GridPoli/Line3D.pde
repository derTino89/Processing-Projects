//geändert gem. Hinweis, (hätte ich selbst sehen müssen :D)

class Line3D {
  Vektor3D _pointA;
  Vektor3D _pointB;


  Line3D(Vektor3D point1, Vektor3D point2) {
    _pointA=point1.clone();
    _pointB=point2.clone();
  }

  void render() {
    line(_pointA.getX(), _pointA.getY(), _pointA.getZ(), _pointB.getX(), _pointB.getY(), _pointB.getZ());
  }
}
