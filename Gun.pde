class Gun{
float power;
float shootRate;
int num;
int distance;
int bulletMax;
int bulletNow;
int stopFrame;

boolean stop1 = false;
boolean stop2 = false;
PImage img;
int bulletAdd = floor(random(0,5));

Gun(int num){
  img = loadImage("img/gun"+num+".png");
  this.num = num;
  switch(num){
    case 1:
      power = 10;
      shootRate = 10;
      distance = 100;
      bulletMax = 100;
      bulletNow = 100;
      
      break;
      
    case 2:
      power = 20;
      shootRate = 5;
      distance = 200;
      bulletMax = 10;
      bulletNow = 10;
      break;
  }
  
}

void display(){
  image(img,hero.x,hero.y);
  textSize(32);
  text("Bullet: "+bulletNow+"/"+bulletMax,100,100);
  text("Gun: No."+num,100,50);
}

void addbullet(){
  if(treasure.treasureEaten == true){
   
  int r =  floor(random(1,gunLimit));
  
  if (bulletNow != bulletMax && bulletNow < bulletMax){
   gunArray[r].bulletNow = gunArray[r].bulletMax;
 
   treasure.treasureEaten = false;  
  }
}
    
}

void stopCount(){
  if(stop1==true){
    stopFrame = frameCount-1; //<>//
    stop1 = false;
  }
   if(stop1 == false && stop2 == true){
    if( (frameCount-stopFrame)%shootRate == 0){
      stop2 = false; //<>//
    }
  }
}
void move(){

}


}