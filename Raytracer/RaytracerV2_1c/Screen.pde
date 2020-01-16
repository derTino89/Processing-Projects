class Screen {

  Scene _scene;

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
    Ray primRay = new Ray(new Vektor(x, y, 0), new Vektor(0, 0, 1));
    Tracer tracer = new Tracer(_scene);
    Hit primHit = tracer.trace(primRay);
    Shader shader = new Shader(_scene);
    color c;

    if (!primHit.isEmpty()) {
      c =color(shader.shade( primHit.getNormV(), primHit.getHitLoc()));
    } else {
      c = color(50, 0, 50);
    }
    set(x, y, c);
  }
}