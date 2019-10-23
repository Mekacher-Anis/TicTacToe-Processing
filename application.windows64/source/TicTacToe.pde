import java.util.Arrays;

int[][] matrix = new int[3][3];
int moves=0;
boolean win = false;

void setup() {
  size(300, 300);
  background(0xFEAE9D);
  strokeWeight(5);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
}

int checkWin() {
  //check rows
  for (int i=0; i<matrix.length; ++i)
    if ((matrix[i][0]+matrix[i][1]+matrix[i][2]) == 3) {
      endGame();
      return -1;
    } else if ((matrix[i][0]+matrix[i][1]+matrix[i][2]) == -3) {
      endGame();
      return 1;
    }

  //check columns
  for (int i=0; i<matrix.length; ++i)
    if ((matrix[0][i]+matrix[1][i]+matrix[2][i]) == 3) {
      endGame();
      return -1;
    } else if ((matrix[0][i]+matrix[1][i]+matrix[2][i]) == -3) {
      endGame();
      return 1;
    }

  //check diags
  if ((matrix[0][0]+matrix[1][1]+matrix[2][2]) == 3 || (matrix[0][2]+matrix[1][1]+matrix[2][0]) == 3) {
    endGame();
    return -1;
  } else if ((matrix[0][0]+matrix[1][1]+matrix[2][2]) == -3 || (matrix[0][2]+matrix[1][1]+matrix[2][0]) == -3) {
    endGame();
    return 1;
  }

  if (moves == 9) {
    background(0xFEAE9D);
    textSize(32);
    text("Draw", 100, 150);
    return 2;
  }


  return 0;
}

void endGame() {
  background(0xFEAE9D);
  textSize(32);
  text("Game Over", 65, 150);
}

void mouseClicked() {
  if (moves == 9 || win) {
    reset();
    return;
  }
  int x = (mouseX > 200) ? 2 : ((mouseX > 100) ? 1 : 0);
  int y = (mouseY > 200) ? 2 : ((mouseY > 100) ? 1 : 0);
  matrix[x][y] = (mouseButton == LEFT) ? 1 : -1;
  if (mouseButton == LEFT) {
    noFill();
    circle((x*100)+50, (y*100)+50, 50);
    fill(255, 255, 255);
  } else {
    line(25+(x*100), 25+(y*100), 75+(x*100), 75+(y*100));
    line(75+(x*100), 25+(y*100), 25+(x*100), 75+(y*100));
  }
  moves++;
  int res = checkWin();
  if (res==-1 || res==1 || res==2)
    win = true;
}

void reset() {
  win = false;
  moves=0;
  matrix = new int[3][3];
  background(0xFEAE9D);
  strokeWeight(5);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
}

void draw() {
}
