public class Zombie{
float hp;
int x,y;
int preX, preY;
float speed = 1;
int direction;
boolean shotGunShooted; 
PImage img ;
PImage zombieUp;
PImage zombieDown;
PImage zombieLeft;
PImage zombieRight;

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
}

void display(){
  image(img,x,y);
}

void move(){
    if(x<hero.x){
      x += speed;
      img = zombieRight;
    }
    if(x>hero.x){
      x -= speed;
      img = zombieLeft;
    }
    if(y<hero.y){
      y += speed;
      img = zombieDown;
    }
    if(y>hero.y){
      y -= speed;
      img = zombieUp;
    }
    //殭屍碰到HERO的碰撞偵測
    //婷：如果這段寫出來的話，就會發生主角碰到殭屍即會死，跟我寫的(用槍的射程去偵測殭屍讓殭屍被射死)矛盾，所以被我隱藏了
    //if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
    // x = preX;
    // y = preY;
    // hero.hp-=1;//被殭屍打到扣血
    //}
    //if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
    // if(hero.y<=y+img.height||hero.y+hero.img.height>=y){
    //   hero.y=hero.preY;//HERO被殭屍擋到Y座標
    // }
    // if(hero.x<=x+img.width||hero.x+hero.img.height>=x){
    //   hero.x=hero.preX;//HERO被殭屍擋到X座標
    // }
    //}
}
void hpCheck(){
  if(hp < 0){
    x = width;
    y = height;
  }
}

boolean shooted(int heroDirection, int zombieNum, int gunNum,int gunFourDectection){
  switch(heroDirection){
    case Direction.UP:
     if(zombieArray[zombieNum].x+zombieArray[zombieNum].img.width > hero.x+30 -gunFourDectection && hero.x+30+gunFourDectection > zombieArray[zombieNum].x){
       if(zombieArray[zombieNum].y+zombieArray[zombieNum].img.height > hero.y-20-gunArray[gunNum].distance && hero.y-20>zombieArray[zombieNum].y){
         return true;
       }
     }
    break;
    case Direction.DOWN:
    if(zombieArray[zombieNum].x+zombieArray[zombieNum].img.width > hero.x+5-gunFourDectection && hero.x+5+gunFourDectection > zombieArray[zombieNum].x){
      if(zombieArray[zombieNum].y < hero.y+hero.img.height+20+gunArray[gunNum].distance&&hero.y+hero.img.height+20<zombieArray[zombieNum].y+zombieArray[zombieNum].img.height){
      }
    }
    break;
    case Direction.LEFT:
    if(zombieArray[zombieNum].y+zombieArray[zombieNum].img.height > hero.y+10-gunFourDectection && hero.y+10+gunFourDectection> zombieArray[zombieNum].y){
      if(zombieArray[zombieNum].x+zombieArray[zombieNum].img.width > hero.x-20-gunArray[gunNum].distance &&hero.x-20>zombieArray[zombieNum].x){
        return true;
      }
    }
    break;
    case Direction.RIGHT:
    if(zombieArray[zombieNum].y+zombieArray[zombieNum].img.height > hero.y+25-gunFourDectection && hero.y+25+gunFourDectection > zombieArray[zombieNum].y){
      if(zombieArray[zombieNum].x < hero.x+hero.img.width+20+gunArray[gunNum].distance&&hero.x+hero.img.width+20< zombieArray[zombieNum].x+zombieArray[zombieNum].img.width ){
        return true;
      }
    }
    break;
  }
  return false;
} 

/*
void stopCount(){
   if(stop1 == false && stop2 == true){
    if( (frameCount-stopFrame)%15== 0){
      stop2 = false;
    }
  }
  if(stop1==true){
    stopFrame = frameCount;
    stop1 = false;
  }
}
*/
}
