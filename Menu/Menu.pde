int state = 1;
int time = 0;

void setup() {
  size(800,600);
  background(0);
  fill(255);
  textAlign(CENTER,CENTER);
  text("Welcome to Fragments of Self. \n Please press [Space] to continue.", width/2, height/2);
}

void draw() {
  if (state == 2) {
    background(0);
    fill(255);
    textAlign(CENTER,CENTER);
    text("Put the pulse sensor on the tip of your index finger.", width/2, height/2);
  } else if (state == 3) {
    background(0);
    fill(255);
    textAlign(CENTER,CENTER);
    text("", width/2, height/2);
  }
}

void keyReleased() {
  if (keyCode == ' ') {
    state++;
  } 
}