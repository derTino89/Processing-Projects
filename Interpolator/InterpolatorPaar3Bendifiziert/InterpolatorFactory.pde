class InterpolatorFactory
{
 // Counter _pairNumber; // jb20180528 Habe den Verdacht, dass der Counter ein lokales Attribut sein könnte
 // Counter _pairMember;

  ArrayList<InterpolationCalculator> _deliverHere;
  InterpolatorFactory(ArrayList<InterpolationCalculator> feedMe)
  {
    _deliverHere=feedMe; // jb20180528 bewusst kein .clone
    _deliverHere.add(new InterpolationCalculator()); // jb20180528 es gibt immer mindestens 1 element
    // jb20180528 ich grübele nun erstmal, wozu Sie zwei counter anlegen und den einen
    // auf 0 setzen, den anderen aber auf 2. Beobachten wir das mal.
    //_pairNumber = new Counter();
    //_pairNumber.setCounter(0);// jb20180528 finde ich klarer
    //_pairMember = new Counter();
    //_pairMember.setCounter(2);// jb20180528 finde ich klarer
  }

  void userClicked(float mx, float my)
  {
    Vektor2D here=new Vektor2D(mx,my); // jb20180528 Da will der user einen Pol setzen
    InterpolationCalculator lastElement=_deliverHere.get(_deliverHere.size()-1);
    if (lastElement.isFull())
    {
      lastElement=new InterpolationCalculator();
      _deliverHere.add(lastElement);
    }
    // Jetzt ist das LastElement entweder leer oder halbvoll
    lastElement.add(here);
  }
  
  //void userClickedDeprecated(float mx, float my)
  //{
  //  if (_pairMember.currentCounter()==2) {  
  //    _deliverHere.add(new InterpolationCalculator());
  //    _deliverHere.get(_pairNumber.currentCounter())._addPoint1(new Vektor2D(mx, my));   
  //    _pairMember.setCounter(1);
  //  } else if (_pairMember.currentCounter()==1) {
  //    _deliverHere.get(_pairNumber.currentCounter())._addPoint2(new Vektor2D(mx, my));
  //    _pairMember.countForward();
  //    _pairNumber.countForward();
  //  }
  //}
}