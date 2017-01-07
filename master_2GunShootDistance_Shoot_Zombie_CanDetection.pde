//class Gun裡面改
//void addbullet(){
//  if(treasure.treasureEaten == true){

//  int r =  floor(random(1,gunLimit));

//  if (bulletNow != bulletMax && bulletNow < bulletMax){
//   gunArray[r].bulletNow = gunArray[r].bulletMax;

//   treasure.treasureEaten = false;  
//  }
//}

//}

//class Treasure 增加假設人的血量夠就不能++
//void eaten(){
//  if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
//    treasureEaten = true;
//    x = width;
//    y = height;
//   if(hero.hp < 100){
//    hero.hp += 20; 
//    println("hp++");
//   }
//  }
//}

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
int gunLimit = 5;//第n支槍還不能用
int gunNow = 1;
Gun[] gunArray = new Gun[gunMax];

int canMax =10;
int canNow =0;
Can[] canArray=new Can[canMax];

JSONObject json;
int stageState = -1; //遊戲關卡 用來變換場景
int blockMax = 3; //每關的block數量 預設第一關3個
int bX[] = new int[blockMax]; //每個block的x
int bY[] = new int[blockMax];
Block[] blockArray = new Block[blockMax];

Treasure treasure;


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
  gunArray[gunNow] = new Gun(gunNow); //預設使用第1隻槍
  changeStage();
  frameRate(60);
}

void draw() {
  background(#D6C38F);
  //Treasure
  treasure.display();
  treasure.eaten();

  //Hero
  hero.display();
  hero.move(isMovingUp, isMovingDown, isMovingLeft, isMovingRight);

  //Gun
  if (gunArray[gunNow] != null) {
    gunArray[gunNow].display();
  }


 //can
  for (int i=0; i<canNow; i++) {
    canArray[i].display();
  }
  //當射擊can時，如果殭屍同時在can的方圓10pixle內，則can爆炸&殭屍死掉(can&殭屍在畫面外)
  for (int i=0; i<zombieNow; i++) {
    for (int j=0; j<canNow; j++) {
      if (hero.shooting) {
        if(gunNow==1||gunNow==2){
        if (canArray[j].shooted (hero.nowDirectionNum, j,gunArray[gunNow].num, 0 )) {
            canArray[j].x = width;
            canArray[j].y = height;
          if (isHit(zombieArray[i].x, zombieArray[i].y, zombieArray[i].img.width, zombieArray[i].img.height, canArray[j].x-50, canArray[j].y-50, canArray[j].img.width+100, canArray[j].img.height+100)) {
            zombieArray[i].x = width;
            zombieArray[i].y = height;
            hero.shooting = false;
          }
        }
        }
        if(gunNow==4){
        if (canArray[j].shooted (hero.nowDirectionNum, j,gunArray[gunNow].num, 30 )) {
            canArray[j].x = width;
            canArray[j].y = height;
          if (isHit(zombieArray[i].x, zombieArray[i].y, zombieArray[i].img.width, zombieArray[i].img.height, canArray[j].x-50, canArray[j].y-50, canArray[j].img.width+100, canArray[j].img.height+100)) {
            zombieArray[i].x = width;
            zombieArray[i].y = height;
            hero.shooting = false;
          }
        }
      }
      
      
    }
    }
  }
  //Zombie
  for (int i=0; i<zombieNow; i++) {


    if (zombieArray[i].x != width && zombieArray[i].y != height) {
      zombieArray[i].move();
      zombieArray[i].display();
      zombieArray[i].hpCheck();
    }
    if (hero.shooting) {
      if (gunNow==1 ||gunNow==2) {
        if (zombieArray[i].shooted (hero.nowDirectionNum, i, gunArray[gunNow].num, 0)) {
          zombieArray[i].hp -= gunArray[gunNow].power;
          zombieArray[i].x = width;
          zombieArray[i].y = height;
          hero.shooting = false;
        }
      }else if(gunNow==4 ){
         if (zombieArray[i].shooted (hero.nowDirectionNum, i, gunArray[gunNow].num, 30)) {
          zombieArray[i].hp -= gunArray[gunNow].power;
          zombieArray[i].x = width;
          zombieArray[i].y = height;
          hero.shooting = false;
        }        
      }
    }
  }

 

  //Block
  for (int i=0; i<blockMax; i++) {
    blockArray[i].display();
    blockArray[i].collision();
  }
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
  case ENTER : //暫時用來變換場景
    changeStage();
    break;
  default :
    break ;
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
  //開槍
  if (key == ' ') {
    if (gunArray[gunNow].bulletNow>0 && gunNow!=3) {
      hero.shooting = true;
      gunArray[gunNow].bulletNow --;
      //if (gunNow==1) {
      //  hero.shooting(1);
      //  if ((can.x<(hero.x+40+100)&& can.y<(hero.y+25) && (can.y+60) > (hero.y+25))
      //    ||((can.x+40)>(hero.x-100) && can.y<(hero.y+10) && (can.y+60) > (hero.y+10))
      //    ||( can.x<(hero.x+30) && (can.x+40)>(hero.x+30) && (can.y+60)> (hero.y-100))
      //    ||( can.x<(hero.x+5)&& (can.x+40) > (hero.x+30) && can.y <(hero.y+30+100))) {
      //    can.x =width;
      //    can.y=height;
      //  }
      //}
      //if (gunNow==2) {
      //  hero.shooting(2);
      //  if (can.x<(hero.x+40+200)&& can.y<(hero.y+25) && (can.y+70) > (hero.y+25)
      //    ||((can.x+40)>(hero.x-200) && can.y<(hero.y+10) && (can.y+60) > (hero.y+10))
      //    ||(can.x<(hero.x+30) && (can.x+40)>(hero.x+30) && (can.y+60)> (hero.y-200))
      //    ||(can.x<(hero.x+5)&& (can.x+40) > (hero.x+30) && can.y <(hero.y+30+200))) {
      //    can.x =width;
      //    can.y=height;
      //  }
      //}

      if (gunNow == gunArray[gunNow].num) {
        hero.shooting(gunNow);
      }
    }
  }

  if (key == 'c' && gunNow==3) {
    if (gunArray[gunNow].bulletNow>0 ) {
      gunArray[gunNow].bulletNow --;
      if (canNow < canMax) {
        canArray[canNow] = new Can();
        canNow++;     
        println(canNow);
      }
      //image(hero.img,hero.x,hero.y);//讓主角在can的上方
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