class Command3D {
  VisualObject3D _ball;

  Command3D(VisualObject3D SuperObject) {
    _ball=SuperObject;
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
    _ball.moveLeft();
  }
}

class moveRight3D extends Command3D {

  moveRight3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _ball.moveRight();
  }
}

class moveUp3D extends Command3D {

  moveUp3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _ball.moveUp();
  }
}

class moveDown3D extends Command3D {

  moveDown3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _ball.moveDown();
  }
}

class fillMe3D extends Command3D {

  fillMe3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _ball.fillMe();
  }
}

class unfillMe3D extends Command3D {

  unfillMe3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _ball.unFillMe();
  }
}

class enlarge3D extends Command3D {

  enlarge3D(VisualObject3D Object) {
    super(Object);
  }

  void execute() {
    _ball.enlarge();
  }
}