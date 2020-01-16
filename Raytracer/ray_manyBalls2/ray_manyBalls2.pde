Scene gScene;
int ix=0;
int iy=0;

void setup() {
  frameRate(9999);
  size(1200, 900);
  gScene=new Scene();

  //for(int ix=0;ix<=width;ix++){
  //  for(int iy=0;iy<=height;iy++){
  //    color c = gScene.raytrace(new Ray(new Vektor(ix,iy,0)));
  //    set(ix,iy,c);
  //    println(ix,iy,c);
  //  }
  //}
}

void draw() {
  for (int i =0; i<1000; i++)
    if (i<1000)
      _trace();
}

void _trace() {
  ix++;
  if (ix>width) {
    ix=0;
    iy++;
    if (iy>height)
      iy=0;
  }
  color c = gScene.raytrace(new Ray(new Vektor(ix, iy, 0)));
  set(ix, iy, c);
}