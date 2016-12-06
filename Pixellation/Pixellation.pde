import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.video.*;
import processing.serial.*;


// Create object from Serial class
Serial myPort;  
// Data received from the serial port
int val;     

// Number of columns and rows in our system
int cols, rows;
// Variable to hold onto Capture object
Capture video;
PImage output;

float avg_r, avg_g, avg_b;

int filter = 20;
int filter_index = 2;
int[] filters = {1, 2, 4, 5, 8, 10, 20, 40};

void setup() {
  size(1280,720);
  
  noFill();
  noStroke();
  smooth();
  
  filter = filters[filter_index];
  
  video = new Capture(this,1280,720,30);
  video.start();
}

void draw() {
  
  if (video.available()) {
    background( 255 );
    video.read();
    pixelateVideo();

  }
}

void pixelateVideo() {
    video.loadPixels();
    
    for (int x = 0; x < video.width; x+=filter) {
      for (int y = 0; y < video.height; y+=filter) {

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
        
        //Mirror image and fix the offset from the filter
        rect(video.width-x-filter,y,filter,filter);
      }
    }
    video.updatePixels();
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