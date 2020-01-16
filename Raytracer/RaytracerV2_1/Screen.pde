class Screen {

  Ray _primRay;
  Tracer _tracer; 
  Scene _scene;
  Shader _shader;

  Screen(Scene objects) {
    _scene=objects;
  }

  void render() {
    for (int ix=0; ix<=width; ix++) {
      for (int iy=0; iy<=height; iy++) {
        _fillPixel(ix, iy);
      }
    }
  }
  void _fillPixel(int x, int y) {
    color c;
    _primRay = new Ray(new Vektor(x, y, 0), new Vektor(0, 0, 1));
    _tracer = new Tracer(_scene);
    Hit primHit = _tracer.trace(_primRay);
    _shader = new Shader(_scene);
    //println("pixel", _x,_y);

    if (!primHit.isEmpty()) {
      c =color(_shader.shade( primHit.surfaceNormV(), primHit.getHitLoc()));
    } else 
    c = color(50, 0, 50);
    set(x, y, c);
  }
}
