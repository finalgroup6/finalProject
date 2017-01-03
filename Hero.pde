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
  if(isHit(x,y,img.width,img.height,bX1,bY1,block.width,block.height)){
   x = preX;
   y = preY;
  }
  if(isHit(x,y,img.width,img.height,bX2,bY2,block.width,block.height)){
   x = preX;
   y = preY;
  }
}

void shooting(int gunNum){
   this.gunNum = gunNum;
   switch(gunNum){
   case 1:
    if (nowDirectionNum==Direction.UP) {
      line(x+30,y,x+30,y-100);
    }
    if (nowDirectionNum==Direction.DOWN) {
      line(x+5,y+30,x+5,y+30+100);
    }
    if (nowDirectionNum==Direction.LEFT) {
      line(x-100,y+10,x,y+10);
    }
    if (nowDirectionNum==Direction.RIGHT) {
     line(x+40,y+25,x+40+100,y+25); 
    }
    break;
    case 2:
      if (nowDirectionNum==Direction.UP) {
      line(x+30,y,x+30,y-200);
    }
    if (nowDirectionNum==Direction.DOWN) {
      line(x+5,y+30,x+5,y+30+200);
    }
    if (nowDirectionNum==Direction.LEFT) {
      line(x-200,y+10,x,y+10);
    }
    if (nowDirectionNum==Direction.RIGHT) {
     line(x+40,y+25,x+40+200,y+25); 
    }
    break;
   }
}

}
