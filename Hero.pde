class Hero {
  float hp;
  int x = width/2;
  int y = height/2;
  int preX, preY;
  int speed = 5;
  int gunNum;
  String nowDirection = "Down";
  int nowDirectionNum; //用來傳送給player.shooted
  PImage img;
  PImage playerUp;
  PImage playerDown;
  PImage playerLeft;
  PImage playerRight;
  PImage [] rocketImg =new PImage [5];
  int [] rocketX =new int [5];
  int [] rocketY =new int [5];
  boolean shooting = false;


  Hero(int x, int y ) {
    this.x = x;
    this.y = y;
    img = loadImage("img/player"+nowDirection+".png");
    playerUp = loadImage("img/playerUp.png");
    playerDown = loadImage("img/playerDown.png");
    playerLeft = loadImage("img/playerLeft.png");
    playerRight = loadImage("img/playerRight.png");
    for (int i=0; i<5; i++) {
      rocketImg[i]=loadImage("img/rocket.png");
      rocketX[i]=x;
      rocketY[i]=y;
    }
  }

  void display() {
    image(img, x, y);

    rect(x, y-10, hp, 5);//HERO血量
    fill(#ff0000);//血量紅色
  }

  void move(boolean up, boolean down, boolean left, boolean right) {
    preX = x;
    preY = y;
    if (up) {
      y-= speed;
      img = playerUp;
      nowDirectionNum = Direction.UP;
    }
    if (down) {
      y+= speed;
      img = playerDown;
      nowDirectionNum = Direction.DOWN;
    }
    if (left) {
      x-= speed;
      img = playerLeft;
      nowDirectionNum = Direction.LEFT;
    }
    if (right) {
      x+= speed;
      img = playerRight;
      nowDirectionNum = Direction.RIGHT;
    }
  }

  void shooting(int gunNum) {
    this.gunNum = gunNum;
    if (gunNum ==1 || gunNum==2) {
      if (nowDirectionNum==Direction.UP) {
        line(x+30, y-20, x+30, y-20-gunArray[gunNum].distance);
      }
      if (nowDirectionNum==Direction.DOWN) {
        line(x+5, y+50, x+5, y+50+gunArray[gunNum].distance);
      }
      if (nowDirectionNum==Direction.LEFT) {
        line(x-20-gunArray[gunNum].distance, y+10, x-20, y+10);
      }
      if (nowDirectionNum==Direction.RIGHT) {
        line(x+60, y+25, x+60+gunArray[gunNum].distance, y+25);
      }
    }
    if (gunNum==4) {
      if (nowDirectionNum==Direction.UP) {
        line(x+30, y-20, x+30, y-20-gunArray[gunNum].distance);
        line(x+30+5, y-20, x+30+30, y-20-gunArray[gunNum].distance);
        line(x+30-5, y-20, x+30-30, y-20-gunArray[gunNum].distance);
      }
      if (nowDirectionNum==Direction.DOWN) {
        line(x+5, y+50, x+5, y+50+gunArray[gunNum].distance);
        line(x+5+5, y+50, x+5+30, y+50+gunArray[gunNum].distance);
        line(x+5-5, y+50, x+5-30, y+50+gunArray[gunNum].distance);
      }
      if (nowDirectionNum==Direction.LEFT) {
        line(x-20, y+10, x-20-gunArray[gunNum].distance, y+10);
        line(x-20, y+10-5, x-20-gunArray[gunNum].distance, y+10-30);
        line(x-20, y+10+5, x-20-gunArray[gunNum].distance, y+10+30);
      }
      if (nowDirectionNum==Direction.RIGHT) {
        line(x+60, y+25, x+60+gunArray[gunNum].distance, y+25);
        line(x+60, y+25-5, x+60+gunArray[gunNum].distance, y+25-30);
        line(x+60, y+25+5, x+60+gunArray[gunNum].distance, y+25+30);
      }
    }
  }
}