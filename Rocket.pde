public class Rocket{
int x;
int y;
int preX;
int preY;
int d;
PImage img;
  
Rocket(){
    x=hero.x;
    y=hero.y;
    img=loadImage("img/rocket.png");  
  }
  
void display(){
    image(img,x,y);
}
void move(int d){
  if (d==Direction.UP) {
        y--;
      }
      if (d==Direction.DOWN) {
        y++;
      }
      if (d ==Direction.LEFT) {
        x--;
      }
      if (d==Direction.RIGHT) {
        x++;
      }

}
}