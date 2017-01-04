class Hero{
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
boolean shooting = false;

Hero(int x , int y ){
  this.x = x;
  this.y = y;
  img = loadImage("img/player"+nowDirection+".png");
  playerUp = loadImage("img/playerUp.png");
  playerDown = loadImage("img/playerDown.png");
  playerLeft = loadImage("img/playerLeft.png");
  playerRight = loadImage("img/playerRight.png");
}

void display(){
  image(img,x,y);
  rect(x,y-10,hp,5);//HERO血量
  fill(#ff0000);//血量紅色
}

void move(boolean up, boolean down, boolean left, boolean right){
  preX = x;
  preY = y;
  if(up){
    y-= speed;
    img = playerUp;
    nowDirectionNum = Direction.UP;
  }
  if(down){
    y+= speed;
    img = playerDown;
    nowDirectionNum = Direction.DOWN;
  }
  if(left){
    x-= speed;
    img = playerLeft;
    nowDirectionNum = Direction.LEFT;
  }
  if(right){
    x+= speed;
    img = playerRight;
    nowDirectionNum = Direction.RIGHT;
  }
}

void shooting(int gunNum){
   this.gunNum = gunNum;
   switch(gunNum){
   case 1:
    if (nowDirectionNum==Direction.UP) {
      line(x+30,y-20,x+30,y-120);
    }
    if (nowDirectionNum==Direction.DOWN) {
      line(x+5,y+30+20,x+5,y+30+120);
    }
    if (nowDirectionNum==Direction.LEFT) {
      line(x-120,y+10,x-20,y+10);
    }
    if (nowDirectionNum==Direction.RIGHT) {
     line(x+40+20,y+25,x+40+120,y+25); 
    }
    break;
    case 2:
      if (nowDirectionNum==Direction.UP) {
      line(x+30,y-20,x+30,y-220);
    }
    if (nowDirectionNum==Direction.DOWN) {
      line(x+5,y+30+20,x+5,y+30+220);
    }
    if (nowDirectionNum==Direction.LEFT) {
      line(x-220,y+10,x-20,y+10);
    }
    if (nowDirectionNum==Direction.RIGHT) {
     line(x+40+20,y+25,x+40+220,y+25); 
    }
    break;
   }
}

}