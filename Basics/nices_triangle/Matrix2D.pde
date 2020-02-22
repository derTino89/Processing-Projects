class Matrix2D{
Vektor2D _spalte1;
Vektor2D _spalte2;


Matrix2D(Vektor2D vek1, Vektor2D vek2){
  _spalte1=vek1.clone();
  _spalte2=vek2.clone();
}

float det(){
return _spalte1.getX()*_spalte2.getY()-_spalte1.getY()*_spalte2.getX();
}


}