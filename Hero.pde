class Hero{
float hp;
int x = width/2;
int y = height/2;
int speed = 3;
int gunNum;
String nowDirection = "Down";
PImage heroImg;
PImage heroUp; PImage heroDown; PImage heroLeft;PImage heroRight;
Hero(int x , int y ){
  this.x = x;
  this.y = y;
    heroImg = loadImage("img/playerDown.png");
    heroDown = loadImage("img/playerDown.png");
    heroUp = loadImage("img/playerUp.png");
    heroLeft = loadImage("img/playerLeft.png");
    heroRight = loadImage("img/playerRight.png");
}

void display(){

  image(heroImg,x,y);
    if (isMovingUp) {
      this.move(Direction.UP);
      nowDirection = "Up";
      heroImg = heroUp;
    }
    if (isMovingDown) {
      this.move(Direction.DOWN);
      nowDirection = "Down";
      heroImg = heroDown;
    }
    if (isMovingLeft) {
      this.move(Direction.LEFT);
      nowDirection = "Left";
      heroImg = heroLeft;
    }
    if (isMovingRight) {
      this.move(Direction.RIGHT);
      nowDirection = "Right";
      heroImg = heroRight;
    }
}

void move(int direct){
  switch (direct) {
      case Direction.UP:
        this.y-= speed;
       
        break;
      case Direction.DOWN:
        this.y+= speed;
        
        break;
      case Direction.LEFT:
        this.x-= speed;
        
        break;
      case Direction.RIGHT:
        this.x+= speed;
        
        break;
      }
}


}