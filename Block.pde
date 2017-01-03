class Block{
int w, h;
int x,y;

Block(){
  w = 65;
  h = 100;
  x = 200;
  y = 200;
}

void display(int type){
  if(type == 0){
    stroke(0);
    fill(128);
    rect(x, y+h*3.0/7.0, w, h*4.0/7.0);
  }
  if(type == 1){
    stroke(0);
    fill(255);
    rect(x, y, w, h*3.0/7.0);
  }
}

void move(){
  
}


}
