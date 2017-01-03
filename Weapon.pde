class Weapon{
float power;
float shootRate;
int num;
int distance;
PImage can;//汽油桶
float x;
float y;

Weapon(){
 can=loadImage("img/can.png");
 x=random(float(560));
 y=random(float(410));
}

void display(){
 image(can,x,y);
}

void move(){

}




}
