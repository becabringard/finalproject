class Laser {
  int x, y, speed, rad, health;
  
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(3, 5));
    rad = 25;
    health = 10;
  }
  
  void move() {
    y += speed;
  }
  
  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    noStroke();
    fill(255, 153, 255);
    rectMode(CENTER);
    rect(x, y, rad, rad*2);
  }
}
