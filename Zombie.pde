public class Zombie{
float hp;
int x,y;
int preX, preY;
float speed = 1;
int direction;
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
    if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
     x = preX;
     y = preY;
     hero.hp-=1;
    }
    if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
     if(hero.y<=y+img.height||hero.y+hero.img.height>=y){
       hero.y=hero.preY;
     }
     if(hero.x<=x+img.width||hero.x+hero.img.height>=x){
       hero.x=hero.preX;
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
