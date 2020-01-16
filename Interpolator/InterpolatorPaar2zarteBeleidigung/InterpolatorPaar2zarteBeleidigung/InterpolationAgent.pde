// jb20180524 Klasse vermutlich ungünstig benannt, aus Sicht des Klassenbenutzers.
// habe mal eine alternative Benennung versucht

class InterpolationAgent {
  Ball _ball1; // jb20180524 _ball1 und _ball2 könnte man als ein Ballpair sehen
  Ball _ball2;
  InterpolationCalculator _calculator; // jb20180524 Aha, das habe ich mir gedacht: Die Klasse heisst Ballpair, ist aber ein Wrapper des Interpolators

  InterpolationAgent(Ball ball1, Ball ball2) {
    _ball1 = ball1; // jb20180524 Kapselbruch - Absicht?
    _ball2 = ball2; // jb20180524 Kapselbruch - Absicht?
    _calculator = new InterpolationCalculator(_ball1.ort(), _ball2.ort());
  }

  void interpolTicLoop() // jb20180524 könnte man einfach tic nennen (information hiding)
  {
    _calculator.ticloop(); // jb20180524 könnte man einfach tic nennen (information hiding)
  } 

  void interpolTicLoopRender() // 20180524 könnte man einfach render nennen (information hiding)
  {
    _calculator.render(); // 20180524 könnte man einfach render nennen (information hiding)
  }
}