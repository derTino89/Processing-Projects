class Command3D {
  VisualObject3D _circle;

  Command3D(VisualObject3D SuperObject) {
    _circle=SuperObject;
  }

  void execute() {
    println("überschreibe mich!!");
  }
}




class moveLeft3D extends Command3D {

  moveLeft3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveLeft();
  }
}

class moveRight3D extends Command3D {

  moveRight3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveRight();
  }
}

class moveUp3D extends Command3D {

  moveUp3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveUp();
  }
}

class moveDown3D extends Command3D {

  moveDown3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveDown();
  }
}

class fillMe3D extends Command3D {

  fillMe3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    println(_circle.filled());
    _circle.fillMe();
  }
}

class unfillMe3D extends Command3D {

  unfillMe3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _circle.unFillMe();
  }
}
