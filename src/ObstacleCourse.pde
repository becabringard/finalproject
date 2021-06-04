//ObstacleCorse Game
//By Beca Bringard

Alien s1;
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<Point> pts;
Timer laserTimer, puTimer, rockTimer;
int points, score, health, speed;
boolean play;

void setup() {
  size(500, 900);
  background (41, 0, 102);
  s1 = new Alien(#CB741D);
  lasers = new ArrayList();
  rocks = new ArrayList();
  pts = new ArrayList();
  laserTimer = new Timer (int(random(2000, 5000)));
  laserTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer = new Timer (int(random(3000, 4000)));
  rockTimer.start();
  points = 0;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(41, 0, 102);
    
    if (laserTimer.isFinished()) {
      lasers.add(new Laser(int(random(width)), -50));
      laserTimer.start();
    }
    
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.move();
      if (s1.laserIntersection(laser)) {
        lasers.remove(laser);
        points-=laser.health;
      }
      if (laser.reachedBottom()) {
        lasers.remove(laser);
      }
    }
    
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      rockTimer.start();
    }
    
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.rockIntersection(rock)) {
        rocks.remove(rock);
        points-=rock.health;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    
    if (puTimer.isFinished()) {
      pts.add(new Point(int(random(width)), -50));
      puTimer.start();
    }
    
    for (int i = 0; i<pts.size(); i++) {
      Point pu = pts.get(i);
      pu.move();
      pu.display();
      if (s1.puIntersection(pu)) {
        if (pu.pu == 0) {
          s1.points+=1;
        } else if (pu.pu == 1) {
          s1.points+=5;
        } else if (pu.pu == 2) {
          s1.points+=10;
        } 
        pts.remove(pu);
      }
      if (pu.reachedBottom()) {
        pts.remove(pu);
      }
    }
    
    s1.display(mouseX, mouseY);
    infoPanel();
    
    //GameOver Logic
    if (s1.points>10) {
      play = false;
      gameOver();
    }
  }
}

void startScreen() {
  background(0, 51, 102);
  textAlign(CENTER);
  text("Welcome to the Alien Obstacle Course", width/2, height/2);
  text("Use the mouse to move your alien around the obstacles. Try to get 100 points while", width/1.78, height/2+20);
  text("avoid the obstacles to complete the game. Obstacles will also decrease your health,", width/2, height/2+40);
  text("so try to get all the points before you die!", width/2, height/2+60);
  text("Click to countinue...", width/2, height/2+100);
  
  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(153, 153, 255);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  text("Points" + s1.points, 50, height+20);
}

void gameOver() {
  background(0, 51, 102);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2+20);
  text("Points " + points, width/2, height/2+40);
  noLoop();
}
