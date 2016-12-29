boolean blocked = false;
boolean LBlocked = false;
boolean RBlocked = false;
boolean UBlocked = false;
boolean DBlocked = false;
int U=0;
int D=1;
int L=2;
int R=3;

int isHitNew(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  if (ax >= bx - aw && ax <= bx + bw && ay >= by - ah && ay + ah <= by + 30) {
    return U;
  }
  if (ax >= bx - aw && ax <= bx + bw && ay <= by + bh && ay >= by + bh - 30) {
    return D;
  }
  if (ax >= bx - aw && ax + aw <= bx + 30 && ay >= by - ah && ay <= by + bh) {
    return L;
  }
  if (ax <= bx + bw && ax >= bx + bw - 30 && ay >= by - ah && ay <= by + bh) {
    return R;
  }
  return 4;
}