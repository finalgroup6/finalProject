public class Zombie{
float hp;
int x;
int y;
int speed = 1;
int direction;
String nowDirection = "Down";
PImage img ;
PImage zombieUp;
PImage zombieDown;
PImage zombieLeft;
PImage zombieRight;

Zombie(){
  x = 0;
  y = 0;
  img = loadImage("img/zombieDown.png");  //預設朝下
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
}
}