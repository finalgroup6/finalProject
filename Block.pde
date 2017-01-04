class Block{

float x,y;
PImage img;

Block(int state, int num, float x, float y){
  this.x = x;
  this.y = y;
  img = loadImage("img/block"+state+"_"+num+".png");
}

void display(){
  image(img,x,y);
}
void collision(){
  if(isHit(x,y,img.width,img.height,hero.x,hero.y,hero.img.width,hero.img.height)){
   hero.x = hero.preX;
   hero.y = hero.preY;
  }
}

}

//class Block{ 屬性:寬高xy座標/ display type 0 畫牆壁 type 1 畫屋頂
//  int w, h;
//  int x,y;
  
//  Block(){
//    w = 65;
//    h = 100;
//    x = 200;
//    y = 200;
//  }

//  void display(int type){
//    if(type == 0){
//      stroke(0);
//      fill(128);
//      rect(x, y+h*3.0/7.0, w, h*4.0/7.0);
//    }
//    if(type == 1){
//      stroke(0);
//      fill(255);
//      rect(x, y, w, h*3.0/7.0);
//    }
//  }

//}