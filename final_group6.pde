boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;

Hero hero;

int zombieMax = 30;
int zombieNow = 0;
Zombie[] zombieArray = new Zombie[zombieMax];

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

}

void draw(){
  
  background(#D6C38F);
  hero.display();
  
  //1227 zombie array
  for (int i=0; i<zombieNow; i++){
    zombieArray[i].move();
    for (int j=i; j<zombieNow; j++){
      if(i != j){
          switch(isHitNew(zombieArray[i].x, zombieArray[i].y, zombieArray[i].img.width, zombieArray[i].img.height,zombieArray[j].x, zombieArray[j].y, zombieArray[j].img.width, zombieArray[j].img.height)){
            case 0:
            zombieArray[i].y -= zombieArray[i].speed;
            //zombieArray[i].x += zombieArray[i].speed*3;
            break;
            
            case 1:
            //zY=preZY;
            zombieArray[i].y += zombieArray[i].speed;
            //zombieArray[j].x += zombieArray[i].speed*3;
            break;
            
            case 2:
            //zX=preZX;
            zombieArray[i].x -= zombieArray[i].speed;
            //zombieArray[i].y -= zombieArray[i].speed*3;
            break;
            
            case 3:
            //zX=preZX;
            zombieArray[i].x += zombieArray[i].speed;
            //zombieArray[i].y += zombieArray[i].speed*3;
            break;
            
            case 4:
            break; 
          }
          zombieArray[i].display();
      }
    }
  }
  
}

void keyPressed() {
  switch(keyCode) {
  case UP : 
    isMovingUp = true ;
    break ;
  case DOWN : 
    isMovingDown = true ; 
    break ;
  case LEFT : 
    isMovingLeft = true ; 
    break ;
  case RIGHT : 
    isMovingRight = true ; 
    break ;
  default :
    break ;
  }
  if(key == ' '){
    if(zombieNow < zombieMax){
      zombieArray[zombieNow] = new Zombie();
      zombieNow++;
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
}