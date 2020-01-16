Scene gScene;
int ix=0;
int iy=0;

void setup() {
  frameRate(1000);
  size(800, 600);
  gScene=new Scene();

}

void draw() {
for(int i =0; i<1000;i++)
  if(i<1000)
    _trace();
  
}

void _trace(){
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