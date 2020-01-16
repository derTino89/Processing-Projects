class Matrix3D{
Vektor _column1;
Vektor _column2;
Vektor _column3;

Matrix3D(Vektor vek1, Vektor vek2, Vektor vek3){
_column1=vek1.clone();
_column2=vek2.clone();
_column3=vek3.clone();

}

float det(){
float step1=_column1._x*_column2._y*_column3._z;
float step2=_column1._y*_column2._z*_column3._x;
float step3=_column1._z*_column2._x*_column3._y;
float step4=_column1._z*_column2._y*_column3._x;
float step5=_column1._y*_column2._x*_column3._z;
float step6=_column1._x*_column2._z*_column3._y;
return step1+step2+step3-step4-step5-step6;

}

}