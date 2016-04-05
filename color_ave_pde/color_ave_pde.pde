/**
program to load in am image, allow you to select a region, 
and display all colors in and their frequency. 
*/
//grab image.jpg or image.png in directory

// get image dimentions

// change canvas to match / scale 

//allow sleection of pixels
import java.util.*;

void setup() {

      size(1080,610);   //always should be the first line
      smooth();
      colors = new ArrayList<color_freq_pair>();
}
String state = "begin"; // begin -> image -> col_display
PImage img;
ArrayList<color_freq_pair> colors; 

void draw(){
      if (state.equals("begin")){
            textSize(15);
            fill (10,80,150);
            text("click to load image.jpg or image.png \nin the data directory", 10, 30); 
      
      } else if (state.equals("image")){
            image(img,0,0);
      } else if (state.equals("col_display")){
            //display smaller version of image, with most frequent x colors 
            //down side/ across bottom / overlaid across img
      }
}//pixels[y*width+x]

void mouseClicked(){
      if (state.equals("begin")){
            img = loadImage("image.jpg");
            if (img != null)
                  println("image.jpg loaded");
            if (img == null){
                  img = loadImage("image.png");
                  if (img != null)
                        println("image.png loaded");
            }
            assert(img != null);
            
            state = "image";
      } else if (state.equals ("image")){
            println("begin processing image color frequencys");
      
            state = "col_display";
      }

}