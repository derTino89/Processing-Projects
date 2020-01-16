class Intervall {
  float _from;
  float _to;


  Intervall(float from, float to) {
    _from=from;
    _to=to;
  }
  void tic(float from, float to) {
    _from=from;
    _to=to;
  }

  boolean hasInside(Intervall another) {
    if (another.getFrom()<_from || another.getFrom()>_to) {
      if (another.getTo()<_from || another.getTo()>_to) {
        return false;
      }else{
      return true;
      }
    } else {
      return true;
    }
  }
  float getFrom() {
    return _from;
  }
  float getTo() {
    return _to;
  }
}