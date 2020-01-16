class Command {
  VisualObject _circle;

  Command(VisualObject SuperObject) {
    _circle=SuperObject;
  }

  void execute() {
    println("überschreibe mich!!");
  }
}




class moveLeft extends Command {

  moveLeft(VisualObject Object) {
    super(Object);
  }

  void execute() {
    _circle.moveLeft();
  }
}

class moveRight extends Command {

  moveRight(VisualObject Object) {
    super(Object);
  }

  void execute() {
    _circle.moveRight();
  }
}

class moveUp extends Command {

  moveUp(VisualObject Object) {
    super(Object);
  }

  void execute() {
    _circle.moveUp();
  }
}

class moveDown extends Command {

  moveDown(VisualObject Object) {
    super(Object);
  }

  void execute() {
    _circle.moveDown();
  }
}

class fillMe extends Command {

  fillMe(VisualObject Object) {
    super(Object);
  }

  void execute() {
    println(_circle.filled());
    _circle.fillMe();
  }
}

class unfillMe extends Command {

  unfillMe(VisualObject Object) {
    super(Object);
  }

  void execute() {
    _circle.unFillMe();
  }
}
