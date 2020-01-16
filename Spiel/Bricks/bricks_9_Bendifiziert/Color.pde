// jb20180515 Klasse Color aus balken herausgezogen
class Color
{
  float _r=80;
  float _g=80;
  float _b=0;

  color asProcessingColor()
  {
    return color(_r, _g, _b);
  }

  void randomize()
  {
    _r=_myRandom();
    _g=_myRandom();
    _b=_myRandom();
   }
   
   float _myRandom()
   {
     return random(0, 255);
   }
}