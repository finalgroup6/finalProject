boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;
PImage block;
float bX1,bY1,bX2,bY2;

Hero hero;

int zombieMax = 300;
int zombieNow = 0;
Zombie[] zombieArray = new Zombie[zombieMax];

int gunMax = 5;
int gunLimit = 3;//第n支槍還不能用
int gunNow = 1;
Gun[] gunArray = new Gun[gunMax];

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

void setup(){
size(640, 480);
hero = new Hero(width/2,height/2);
treasure = new Treasure();
gunArray[gunNow] = new Gun(gunNow); //預設使用第1隻槍
changeStage();
frameRate(60);
}

void draw(){
  background(#D6C38F);

  //Treasure
  treasure.display();
  treasure.eaten();
  
  //Hero
  hero.display();
  hero.move(isMovingUp,isMovingDown,isMovingLeft,isMovingRight);
  
  //Gun
  if(gunArray[gunNow] != null){
    gunArray[gunNow].display();
  }
  
  //Zombie
  for (int i=0; i<zombieNow; i++){
    if(zombieArray[i].x != width && zombieArray[i].y != height){
      zombieArray[i].move();
      zombieArray[i].display();
      zombieArray[i].hpCheck();
      if(hero.shooting){
        if(zombieArray[i].shooted (hero.nowDirectionNum, i)){
          zombieArray[i].hp -= gunArray[gunNow].power;
          hero.shooting = false;
        }
      }
    }
  }
  //Block
  for(int i=0; i<blockMax; i++){
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
  if(key>='1' && key<='9'){
    gunNow = key-48;
    if(gunNow < gunLimit){
      if(gunArray[gunNow] == null){
        gunArray[gunNow] = new Gun(gunNow);
      }
    }
  }
  //開槍
  if(key == ' '){
    if(gunArray[gunNow].bulletNow>0){
      hero.shooting = true;
      gunArray[gunNow].bulletNow --;
    }
  }
  
  if(key == 'z'){
    if(zombieNow < zombieMax){
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
  if(key == ' '){
    hero.shooting = false;
  }
}
