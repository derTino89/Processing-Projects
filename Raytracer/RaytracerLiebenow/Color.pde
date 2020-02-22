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
  if(r<0) 
    r=0;
  if(g<0)
    g=0;
  if(b<0)
    b=0;
  return new Color(_r+r, _g+g, _b+b);
}

color asProcessingColor() 
{
  return color(_r,_g,_b);
}


}
