class Gun{
int num; //槍枝編號
float power;
int shootRate;
int distance;
int bulletMax;
int bulletNow;
PImage img;
AudioSample gunSounds;


Gun(int num){
  img = loadImage("img/gun"+num+".png");
  this.num = num;
  switch(num){
    case 1:
      power = 10;
      shootRate = 50;
      distance = 100;
      bulletMax = 100;
      bulletNow = 100;
      this.gunSounds = uziGunSounds;
      break;
    case 2:
      power = 20;
      shootRate = 1500;
      distance = 200;
      bulletMax = 10;
      bulletNow = 10;
      this.gunSounds = shotGunSounds;
      break;
  }
}

void display(){
  image(img,hero.x,hero.y);
  textSize(32);
  text("Bullet: "+bulletNow+"/"+bulletMax,100,100);
  text("Gun: No."+num,100,50);
} //<>// //<>// //<>// //<>//


}