boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;
PImage block;
float bX1, bY1, bX2, bY2;

Hero hero;

int zombieMax = 300;
int zombieNow = 0;
Zombie[] zombieArray = new Zombie[zombieMax];

int gunMax = 5;
int gunLimit = 3;//第n支槍還不能用
int gunNow = 0;
Gun[] gunArray = new Gun[gunMax];

Treasure treasure;
Weapon can;

//---------------------計時器--------------------------//
int savedTime;
int passedTime;
int totalTime = 50;
//---------------------計時器--------------------------//

boolean Timer(int totalTime, boolean startNow) { //startNow是指要開始計時的時間點
  if (startNow == true) {
    passedTime = millis()-savedTime;
  }
  if (passedTime>totalTime) {
    savedTime = millis();
  }
  return false;
}

class Direction
{
  static final int LEFT = 0;
  static final int RIGHT = 1;
  static final int UP = 2;
  static final int DOWN = 3;
}


void setup() {
  size(640, 480);
  hero = new Hero(width/2, height/2);
  treasure = new Treasure();

  block = loadImage("img/block0_0.png");
  block = loadImage("img/block0_1.png");
  block = loadImage("img/block0_2.png");
  block = loadImage("img/block1_0.png");
  block = loadImage("img/block1_1.png");
 
  can = new Weapon();//汽油桶
  bX1 = 150;
  bY1 = 150;
  bX2 = 300;
  bY2 = 150;
  frameRate(60);

  //---------------------計時器--------------------------//
  savedTime = millis();
  //---------------------計時器--------------------------//
}

void draw() {


  background(#D6C38F);

  //Block
  image(block, bX1, bY1);
  image(block, bX2, bY2);

  //Treasure
  treasure.display();
  treasure.eaten();

  //Hero
  hero.display();
  hero.move(isMovingUp, isMovingDown, isMovingLeft, isMovingRight);

  //Gun

  if (gunArray[gunNow] != null) {
    gunArray[gunNow].display();
    gunArray[gunNow].addbullet();
  }


  //Zombie
  for (int i=0; i<zombieNow; i++) {
    if (zombieArray[i].x != width && zombieArray[i].y != height) {
      zombieArray[i].move();
      zombieArray[i].display();
      zombieArray[i].hpCheck();
      if (hero.shooting) {
        if (zombieArray[i].shooted(hero.nowDirectionNum, i)) {
          zombieArray[i].hp -= gunArray[gunNow].power;
          hero.shooting = false;
          println(zombieArray[i].hp);
        }
      }
    }
    if(isHit(zombieArray[i].x,zombieArray[i].y,zombieArray[i].img.width,zombieArray[i].img.height,can.x,can.y,can.can.width,can.can.height)){
      can.x =width;
      can.y=height;
    }
    
  }
  //Weapon
  can.display();//汽油桶
}

/*-----------------操控--------------------*/
void keyPressed() {
  switch(keyCode) {
  case UP : 
    isMovingUp = true ;
    hero.nowDirectionNum =Direction.UP;
    break ;
  case DOWN : 
    isMovingDown = true ;
    hero.nowDirectionNum =Direction.DOWN;
    break ;
  case LEFT : 
    isMovingLeft = true ; 
    hero.nowDirectionNum =Direction.LEFT;
    break ;
  case RIGHT : 
    isMovingRight = true ;
    hero.nowDirectionNum =Direction.RIGHT;
    break ;
  default :
    break ;
  }

  if (key == ' ') {
    //gunArray[gunNow].stopCount();
    //if (gunArray[gunNow].stop1 == false && gunArray[gunNow].stop2 == false) {
    hero.shooting = true;
    //gunArray[gunNow].stop1 = true;
    //gunArray[gunNow].stop2 = true;
    //}

    gunArray[gunNow].bulletNow --;
    if (gunNow==1) {
      hero.shooting(1);
      if ((can.x<(hero.x+40+100)&& can.y<(hero.y+25) && (can.y+60) > (hero.y+25))
        ||((can.x+40)>(hero.x-100) && can.y<(hero.y+10) && (can.y+60) > (hero.y+10))
        ||( can.x<(hero.x+30) && (can.x+40)>(hero.x+30) && (can.y+60)> (hero.y-100))
        ||( can.x<(hero.x+5)&& (can.x+40) > (hero.x+30) && can.y <(hero.y+30+100))) {
        can.x =width;
        can.y=height;
      }
    }
    if (gunNow==2) {
      hero.shooting(2);
      if (can.x<(hero.x+40+200)&& can.y<(hero.y+25) && (can.y+70) > (hero.y+25)
        ||((can.x+40)>(hero.x-200) && can.y<(hero.y+10) && (can.y+60) > (hero.y+10))
        ||(can.x<(hero.x+30) && (can.x+40)>(hero.x+30) && (can.y+60)> (hero.y-200))
        ||(can.x<(hero.x+5)&& (can.x+40) > (hero.x+30) && can.y <(hero.y+30+200))) {
        can.x =width;
        can.y=height;
      }
    }
  }

  //槍枝變換 從1號開始 跟鍵盤按鍵、圖片編號一致
  if (key>='1' && key<='9') {
    gunNow = key-48;
    if (gunNow < gunLimit) {
      if (gunArray[gunNow] == null) {
        gunArray[gunNow] = new Gun(gunNow);
      }
    }
  }
  if (key == 'z') {
    if (zombieNow < zombieMax) {
      zombieArray[zombieNow] = new Zombie();
      zombieNow++;
      println(zombieNow);
    }
  }
}

void keyReleased() {
  switch(keyCode) {
  case UP : 
    isMovingUp = false ;
    break ;
  case DOWN : 
    isMovingDown = false ; 
    break ;
  case LEFT : 
    isMovingLeft = false ; 
    break ;
  case RIGHT : 
    isMovingRight = false ; 
    break ;
  default :
    break ;
  }
  if (key == ' ') {
    hero.shooting = false;
  }
}