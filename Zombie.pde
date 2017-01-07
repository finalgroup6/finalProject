public class Zombie{
float hp;
int x,y;
int preX, preY;
float speed = 1;
int direction;
PImage img,img2;
PImage zombieUp;
PImage zombieDown;
PImage zombieLeft;
PImage zombieRight;
PImage zombieRight2;
int passedTime, savedTime;
int zombieHitPassedTime, zombieHitSavedTime;
boolean startNow,shooted = false;


/* 暫停殭屍
boolean stop1 =false;
boolean stop2 =false;
int stopFrame;
*/

Zombie(){
  x = 0;
  y = 0;
  hp = 100;
  img = loadImage("img/zombieDown.png");
  zombieUp = loadImage("img/zombieUp.png");
  zombieDown = loadImage("img/zombieDown.png");
  zombieLeft = loadImage("img/zombieLeft.png");
  zombieRight = loadImage("img/zombieRight.png");
  zombieRight2 = loadImage("img/zombieRight2.png");
}

void display(){
  
  if(shooted==true){
    image(img2,x,y);
  }else{image(img,x,y);}
}

void move(){
    if(x<hero.x){
      preX=x;
      x += speed;
      img = zombieRight;
      img2 = zombieRight2;
    }
    if(x>hero.x){
      preX=x;
      x -= speed;
      img = zombieLeft;
    }
    if(y<hero.y){
      preY=y;
      y += speed;
      img = zombieDown;
    }
    if(y>hero.y){
      preY=y;
      y -= speed;
      img = zombieUp;
    }
    //殭屍碰到HERO的碰撞偵測
    if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
     x = preX;
     y = preY;
     startNow = true;
     if(attackTimer(500,startNow)){
       hero.hp-=1;//被殭屍打到扣血
     }
    }
    if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
     if(hero.y<=y+img.height||hero.y+hero.img.height>=y){
       hero.y=hero.preY;//HERO被殭屍擋到Y座標
     }
     if(hero.x<=x+img.width||hero.x+hero.img.height>=x){
       hero.x=hero.preX;//HERO被殭屍擋到X座標
     }
    }
    
}
void hpCheck(){
  if(hp < 0){
    x = width;
    y = height;
  }
}
boolean shooted(int heroDirection, int zombieNum){
  switch(heroDirection){
    case Direction.UP:
     if(zombieArray[zombieNum].x>hero.x-zombieArray[zombieNum].img.width && zombieArray[zombieNum].x < hero.x+hero.img.width){
       if(zombieArray[zombieNum].y < hero.y){
         return true;
       }
     }
    break;
    case Direction.DOWN:
    if(zombieArray[zombieNum].x>hero.x-zombieArray[zombieNum].img.width && zombieArray[zombieNum].x < hero.x+hero.img.width){
      if(zombieArray[zombieNum].y > hero.y){
        return true;
      }
    }
    break;
    case Direction.LEFT:
    if(zombieArray[zombieNum].y>hero.y-zombieArray[zombieNum].img.width && zombieArray[zombieNum].y < hero.y+hero.img.width){
      if(zombieArray[zombieNum].x < hero.x){
        return true;
      }
    }
    break;
    case Direction.RIGHT:
    if(zombieArray[zombieNum].y>hero.y-zombieArray[zombieNum].img.width && zombieArray[zombieNum].y < hero.y+hero.img.width){
      if(zombieArray[zombieNum].x > hero.x){
        return true;
      }
    }
    break;
  }
  return false;
} 

//---------------------計時器--每隔totalTime秒回傳一次true(單位毫秒)---//  
boolean attackTimer(int totalTime, boolean startNow){  //startNow是指你要開始計時的時間點
//for(int i = 0 ; i< zombieNow; i++){
  if(startNow ==true){
    passedTime = millis()-savedTime;
  }
  if(passedTime>totalTime){
      savedTime = millis();
      return true;
  }
  return false;
}
 //殭屍被打到的硬直   
boolean zombieHitimer(int totalTime, boolean startNow){  //startNow是指你要開始計時的時間點
  if(startNow ==true){
    zombieHitPassedTime = millis()-zombieHitSavedTime;
  }
  if(zombieHitPassedTime>totalTime){
      zombieHitSavedTime = millis();
      return true;
  }
  return false;
}
 //殭屍被打到的硬直   
//---------------------計時器--------------------------//
}