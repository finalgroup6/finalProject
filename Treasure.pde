class Treasure{
int x,y;
int gunNum;
PImage img;
boolean treasureEaten ;

Treasure(){
  x = 400;
  y = 400;
  img = loadImage("img/treasure.png");
  treasureEaten = false;
}

void display(){
  image(img,x,y);
}

void eaten(){
  if(isHit(hero.x,hero.y,hero.img.width,hero.img.height,x,y,img.width,img.height)){
    treasureEaten = true;
    x = width;
    y = height;
   if(hero.hp < 100){
    hero.hp += 20; 
    println("hp++");
   }
  }
}

void move(){

}


}