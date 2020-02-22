class Triangle {
Matrix2D _barCentre;  
Vektor2D _punktA;
Vektor2D _punktB;
Vektor2D _punktC;

float gamma;
float beta;

Vektor2D _ab;
Vektor2D _ac;

  Triangle(Vektor2D punkt1, Vektor2D punkt2, Vektor2D punkt3) { 
    _punktA=punkt1.clone();
    _punktB=punkt2.clone();
    _punktC=punkt3.clone();
    _ab=_punktB.subt(_punktA);
    _ac=_punktC.subt(_punktA);
    _barCentre=new Matrix2D(_ab,_ac);
    
  }
  
Vektor2D _cramer(Vektor2D attacker){

  Matrix2D attBeta = new Matrix2D(_ab,new Vektor2D(attacker.getX()-_punktA.getX(),attacker.getY()-_punktA.getY()));
  Matrix2D attGamma = new Matrix2D(new Vektor2D(attacker.getX()-_punktA.getX(),attacker.getY()-_punktA.getY()),_ac);
  gamma=attGamma.det()/_barCentre.det();
  beta=attBeta.det()/_barCentre.det();
  return new Vektor2D(gamma,beta);  
}

boolean hasInside(Vektor2D primeAttacker){
  return !isOutside(primeAttacker);
}
boolean isOutside(Vektor2D attacker){
  _cramer(attacker);
  if(gamma<0)
    return true;
  if(gamma>1)
    return true;
  if(beta<0)
    return true;
  if(beta>1)
    return true;
  if(gamma+beta>1)
    return true;
  return false;

}
  
void renderFilledRed(){
  fill(255,10,10);
  triangle(_punktA.getX(),_punktA.getY(),_punktB.getX(),_punktB.getY(),_punktC.getX(),_punktC.getY());
}

void renderEmpty(){
  strokeWeight(2);
  noFill();
  triangle(_punktA.getX(),_punktA.getY(),_punktB.getX(),_punktB.getY(),_punktC.getX(),_punktC.getY());
  //strokeWeight(10);
  //line(_punktA.getX(),_punktA.getY(),_ab.getX(),_ab.getY());
}






}