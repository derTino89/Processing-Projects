// jb20180515 Habe den Tab so benannt, wie die Klasse heisst.

class TTracer {
  FloatList _tx; // jb20180515 _tx,_ty ist ein Vektor2D, warum also nicht mit einer ArrayList aus Vektoren arbeiten?
  FloatList _ty;
  float _tposx; // jb20180515 _tposx,_tposy ist ein Vektor2D, warum nicht auch so deklarieren?
  float _tposy;
  float _diameter; // Diameter
  int _nMax; // jb20180515 Gemeint ist hier ein maximaler Index - Daher Typwechsel auf integer. Begriff umbenannt, length könnte man missverstehen



  TTracer(int nMax, float radius) {    //Tracer mit abnehmendem Durchmesser
    _nMax = nMax;
    _tx = new FloatList();
    _ty = new FloatList();
    _diameter = radius; // jb20180515 kognitive Dissonanz: _diameter steht für Durchmesser. Radius steht für den halben Durchmesser.
  }


  void move(float x, float y) {

    _tx.append(x);
    _ty.append(y);

    if (_tx.size()<=_nMax) // jb20180515 Habe die If-Bedingung umgedreht, um Schachtelung zu vermeiden
      return;

    _tx.remove(0);
    _ty.remove(0);
  }

  void render() {

    for (int i=_tx.size()-2; i>=0; i--) 
    {
      _tposx = _tx.get(i);
      _tposy = _ty.get(i);
      float size=i*_diameter/_nMax; // j20180515 doppelte Berechung aus der Folgezeile herausgezogen
      rect(_tposx, _tposy, size, size);
    }
  }
}