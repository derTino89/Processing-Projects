class Command {
  VisualObject2D _circle;
  VisualObject3D _sphere;
  Screens _screen;

  Command(VisualObject2D SuperObject) {
    _circle=SuperObject;
  }
  Command() {
  }
  Command(Screens screen) {
    _screen=screen;
  }
  Command(VisualObject2D circle, VisualObject3D sphere){
    _circle=circle;
    _sphere=sphere;
  }

  void execute() {
    println("überschreibe mich!!");
  }
}




class moveLeft extends Command {

  moveLeft(VisualObject2D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveLeft();
  }
}

class enlarge extends Command {

  enlarge(VisualObject2D Object, VisualObject3D Obj) {
    super(Object, Obj);
  }

  void execute() {
    _circle.enlarge();
    _sphere.enlarge();
  }
}

class moveRight extends Command {

  moveRight(VisualObject2D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveRight();
  }
}

class moveUp extends Command {

  moveUp(VisualObject2D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveUp();
  }
}

class moveDown extends Command {

  moveDown(VisualObject2D Object) {
    super(Object);
  }

  void execute() {
    _circle.moveDown();
  }
}

class fillMe extends Command {

  fillMe(VisualObject2D Object) {
    super(Object);
  }

  void execute() {
    println(_circle.filled());
    _circle.fillMe();
  }
}

class unfillMe extends Command {

  unfillMe(VisualObject2D Object) {
    super(Object);
  }

  void execute() {
    _circle.unFillMe();
  }
}

class switchToo2D extends Command {
  Screens _screen;
  switchToo2D(Screens screen) {
    super();
    _screen=screen;
  }

  void execute() {
    _screen.twoDforeGround();
  }
}
class switchToo3D extends Command {
  Screens _screen;
  switchToo3D(Screens screen) {
    super();
    _screen=screen;
  }

  void execute() {
    _screen.threeDforeGround();
  }
}