public class Can{
int x;
int y;
int preX;
int preY;
PImage img;
  
Can(){
    x=hero.x;
    y=hero.y;
    img=loadImage("img/can.png");  
  }
  
void display(){
    image(img,x,y);
}
//can與主角的槍偵測
boolean shooted(int heroDirection, int canNum, int gunNum){
  switch(heroDirection){
    case Direction.UP:
     if(canArray[canNum].x+canArray[canNum].img.width > hero.x+30 && hero.x+30 >canArray[canNum].x){
       if(canArray[canNum].y+canArray[canNum].img.height > hero.y-20-gunArray[gunNum].distance){
         return true;
       }
     }
    break;
    case Direction.DOWN:
    if(canArray[canNum].x+canArray[canNum].img.width > hero.x+5 && hero.x+5 > canArray[canNum].x){
      if(canArray[canNum].y < hero.y+hero.img.height+20+gunArray[gunNum].distance){
        return true;
      }
    }
    break;
    case Direction.LEFT:
    if(canArray[canNum].y+canArray[canNum].img.width > hero.y+10 && hero.y+10 > canArray[canNum].y){
      if(canArray[canNum].x+canArray[canNum].img.width > hero.x-20-gunArray[gunNum].distance){
        return true;
      }
    }
    break;
    case Direction.RIGHT:
    if(canArray[canNum].y+canArray[canNum].img.width > hero.y+25 && hero.y+25 > canArray[canNum].y){
      if(canArray[canNum].x < hero.x+hero.img.width+20+gunArray[gunNum].distance){
        return true;
      }
    }
    break;
  }
  return false;
} 



}