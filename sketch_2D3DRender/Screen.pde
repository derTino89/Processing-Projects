class Screen {

  Scene _scene;

  Screen(Scene objects) {
    _scene=objects;
  }

  void render(PGraphics rendermap) {
    for (int ix=0; ix<=width; ix++) {
      for (int iy=0; iy<=height; iy++) {
        _fillPixel(ix, iy,rendermap);
      }
    }
  }
  
  void _fillPixel(int x, int y, PGraphics rendermap) {
    Ray primRay = new Ray(new Vektor3D(x, y, 0), new Vektor3D(0, 0, 1));
    Tracer tracer = new Tracer(_scene);
    Hit primHit = tracer.trace(primRay);
    Shader shader = new Shader(_scene);
    color c;

    if (!primHit.isEmpty()) {
      c =color(shader.shade( primHit.getNormV(), primHit.getHitLoc()));
    } else {
      c = color(40, 40, 40);
    }
    rendermap.set(x, y, c);
  }
}
