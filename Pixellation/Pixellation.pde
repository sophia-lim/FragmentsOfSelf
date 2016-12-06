import processing.video.*;

// Number of columns and rows in our system
int cols, rows;
// Variable to hold onto Capture object
Capture video;
PImage output;

float avg_r, avg_g, avg_b;

int filter = 20;
int filter_index = 6;
int[] filters = {1, 2, 4, 5, 8, 10, 20, 40};

void setup() {
  size(640,360);
  
  noFill();
  noStroke();
  smooth();
  
  filter = filters[filter_index];
  
  video = new Capture(this,800,600,30);
  video.start();
}

void draw() {
  
  if (video.available()) {
    background( 255 );
    video.read();
    
    video.loadPixels();
    
    for (int x = 0; x < video.width; x+=filter) {
      for (int y = 0; y < video.height; y+=filter ) {

        avg_r = avg_g = avg_b = 255.0;
        
        for (int r = x; r < x+filter; r++) {
          for (int c = y; c < y+filter; c++ ) {
            int loc = r + c*video.width;

            avg_r += red   (video.pixels[loc]);
            avg_g += green (video.pixels[loc]);
            avg_b += blue  (video.pixels[loc]);
          }
        }

        color col = color(avg_r/(filter*filter), avg_g/(filter*filter), avg_b/(filter*filter));
        fill( col );
        rect(x,y,filter,filter);
      }
    }
    //Mirror image
    scale(-1,1); 
    image(video, 0, 0, -width, height);
  }
}

void keyPressed() {
  if( keyCode == 38 ) {
    filter_index++;
  } else if( keyCode == 40 ) {
    filter_index--;
  }
  
  if( filter_index < 0 ) {
    filter_index = 0;
  } else if( filter_index > 7 ) {
    filter_index = 7;
  }
  
}