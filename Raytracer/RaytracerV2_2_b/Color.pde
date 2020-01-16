class Color{
float _r;
float _g;
float _b;

Color(float r, float g, float b){
  _r=r;
  _g=g;
  _b=b;
}


Color plus(float r, float g, float b){
  return new Color(_r+r, _g+g, _b+b);
}

color paint(){
  return color(_r,_g,_b);
}


}