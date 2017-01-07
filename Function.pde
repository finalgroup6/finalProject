boolean blocked = false;
boolean LBlocked = false;
boolean RBlocked = false;
boolean UBlocked = false;
boolean DBlocked = false;
int U=0;
int D=1;
int L=2;
int R=3;


boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  if (ax >= bx - aw && ax <= bx + bw && ay >= by - ah && ay <= by + bh) {
    return true;
  }
  return false;
}

int isHitDirection(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  if (ax >= bx - aw && ax <= bx + bw && ay >= by - ah && ay + ah <= by + 20) {
    return 0;
  }
  if (ax >= bx - aw && ax <= bx + bw && ay <= by + bh && ay >= by + bh - 20) {
    return 1;
  }
  if (ax >= bx - aw && ax + aw <= bx + 20 && ay >= by - ah && ay <= by + bh) {
    return 2;
  }
  if (ax <= bx + bw && ax >= bx + bw - 20 && ay >= by - ah && ay <= by + bh) {
    return 3;
  }
  return 4;
}

void changeStage(){
  stageState++;
  stageState =  stageState%2;
  switch(stageState){
   case 0:
     blockMax = 3;
     break;
   case 1:
     blockMax = 2;
     break;
  }
  int bX[] = new int[blockMax]; //每個block的x
  int bY[] = new int[blockMax];
  json = loadJSONObject("json_block/data/block"+stageState+".json");
  JSONArray values = json.getJSONArray("block");
  for(int i=0; i<values.size(); i++){
    JSONObject block = values.getJSONObject(i); 
    bX[i] = block.getInt("x");
    bY[i] = block.getInt("y");
  }
  for(int i=0; i<blockMax; i++){
    blockArray[i] = new Block(stageState, i, bX[i], bY[i]);
  }
}