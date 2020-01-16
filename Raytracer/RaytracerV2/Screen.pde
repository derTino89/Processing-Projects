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
    _tracer = new Tracer();
    _tracer.lookForHitArray(_primRay, _scene);
    _shader = new Shader(_scene);
    //_tracer.lookForHitObject(_primRay, _objects);
    //println("pixel", _x,_y);

    if (_tracer.hit()) {
      c =color(_shader.shade(_scene.getLight(), _tracer.surfaceNormV(), _tracer.hitPointLoc()));
    } else 
    c = color(50, 0, 50);
    set(x, y, c);
  }
}
