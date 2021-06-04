class Point {
  //member variables
  int x, y, speed, rad, pu;
  String[] puInfo = {"1", "5", "10"};

  //constructor
  Point(int x, int y) {
    rad = 80;
    this.x = x;
    this.y = y;
    speed = int(random(2, 8));
    pu = int(random(3));
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + rad*4) {
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display() {
    noStroke();
    switch(pu) {
    case 0: //1
      fill(255, 204, 102);
      ellipse(x, y, rad, rad);
      fill(0);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[0], x, y);
      break;
    case 1: //5
      fill(153, 255, 102);
      ellipse(x, y, rad, rad);
      fill(0);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[1], x, y);
      break;
    case 2: //10
      fill(51, 204, 255);
      ellipse(x, y, rad, rad);
      fill(0);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[2], x, y);
      break;
    }
  }
}
