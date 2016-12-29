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