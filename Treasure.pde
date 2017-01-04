class Treasure{
int x,y;
int gunNum;
PImage img;

Treasure(){
  x = 400;
  y = 400;
  img = loadImage("img/treasure.png");
}

void display(){
  image(img,x,y);
}
boolean eaten(){
  if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
    x = width;
    y = height;
  }
  if(x == width && y == height){
    return true;
  }
  return false;
}
void move(){

}


}