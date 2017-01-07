class Gun { //<>// //<>//
  int num; //槍枝編號
  float power;
  float shootRate;
  int distance;
  int bulletMax;
  int bulletNow;
  PImage img;

  Gun(int num) {
    if (num!=3) {
      img = loadImage("img/gun"+num+".png");
    }
    this.num = num;
    switch(num) {
    case 1:
      power = 10;
      shootRate = 2;
      distance = 100;
      bulletMax = 100;
      bulletNow = 100;
      break;
    case 2:
      power = 20;
      shootRate = 30;
      distance = 200;
      bulletMax = 10;
      bulletNow = 10;
      break;
    case 3:
        bulletMax  = 10;
        bulletNow  = 10;
      break;
     case 4:
      power = 10;
      shootRate = 2;
      distance = 200;
      bulletMax = 100;
      bulletNow = 100;
      break;
     
    }
  }

  void display() {  
    switch(num) {
    case 1:
      image(img, hero.x, hero.y);
      textSize(32);
      text("Bullet: "+bulletNow+"/"+bulletMax, 100, 100);
      text("Gun: No."+num, 100, 50);
      break;
    case 2:
      image(img, hero.x, hero.y);
      textSize(32);
      text("Bullet: "+bulletNow+"/"+bulletMax, 100, 100);
      text("Gun: No."+num, 100, 50);
      break;
    case 3:       
      textSize(32);
      text("Can: "+bulletNow+"/"+ bulletMax, 100, 100);
      text("Gun: No."+num, 100, 50);
      break;
    case 4:
      image(img, hero.x, hero.y);
      textSize(32);
      text("Bullet: "+bulletNow+"/"+bulletMax, 100, 100);
      text("Gun: No."+num, 100, 50);
      break;
    }
  } //<>// //<>//
}