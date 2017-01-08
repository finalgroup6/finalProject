class Gun { //<>// //<>//
  int num; //槍枝編號
  float power;
  float shootRate;
  int distance;
  int bulletMax;
  int bulletNow;
  int range;
  PImage img;


  Gun(int num) {
    if (num!=3) {
      img = loadImage("img/gun"+num+".png");
    }
    this.num = num;
    switch(num) {
    case 1:
      power = 100;
      shootRate = 2;
      distance = 500;
      bulletMax = 100;
      bulletNow = 100;
      range =0;
      break;
    case 2:
      power = 20;
      shootRate = 30;
      distance = 200;
      bulletMax = 10;
      bulletNow = 10;
      range =0;
      break;
    case 3:
        bulletMax  = 200;
        bulletNow  = 200;
      break;
     case 4:
      power = 200;
      shootRate = 2;
      distance = 500;
      bulletMax = 100;
      bulletNow = 100;
      range = 30 ;
      break;
     case 5:
      power = 10;
      shootRate = 2;
      bulletMax = 50;
      bulletNow = 50;
      break;     
    }
  }

  void display() { 
      if(num!=3 && num<6){
      image(img, hero.x, hero.y);
      textSize(32);
      text("Bullet: "+bulletNow+"/"+bulletMax, 100, 100);
      text("Gun: No."+num, 100, 50);
      }
      if(num==3){
      textSize(32);
      text("Bullet: "+bulletNow+"/"+bulletMax, 100, 100);
      text("Gun: No."+num, 100, 50);
      }  
  } //<>// //<>//
}