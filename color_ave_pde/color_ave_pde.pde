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
PImage img; // access pixels by px array of color pixels[y*width+x]
ArrayList<color_freq_pair> colors; 

void draw(){
      if (state.equals("begin")){
            textSize(15);
            fill (10,80,150);
            text("click to load image.jpg or image.png \nin the data directory", 10, 30); 
      
      } else if (state.equals("image")){
            image(img,0,0);
      } else if (state.equals("col_display")){
            image(img,0,0);//change size so it fits better?
      }
}

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
            //Arrays.sort(img.pixels); // sorts colors from lowest to highest
            
            process_image(img); 
            Collections.sort(colors);
            int pxl=0;
            for (int i = 0; i< colors.size(); i++){
                  print(colors.get(i).frequency() + " :: "); // for debugging
                  color_freq_pair curr_pair = colors.get(i);
                  int run = curr_pair.frequency();
                  for (int j=0; j< run; j++) {
                        img.pixels[pxl] = curr_pair.get_color();
                        pxl++;
                  }
            }
            img.updatePixels();
            state = "col_display";
      }

}
/**
      returns the color_freq_pair for the supplied color.
      either returns one already in the'colors' list, or creates 
      a new one and adds it to the list then returns
*/
private color_freq_pair get_relevant_pair(color c){
      for (color_freq_pair col: colors){
            if (col.get_color() == c) return col;
      }
      color_freq_pair new_pair = new color_freq_pair(c);
      colors.add(new_pair);
      return new_pair;
}  
/**
      processes the supplied image and counts colors. 
      
      side effect: after this method executes, 'colors' list 
      will be populated with all colors in the image, and sorted 
      based on frequency. 
*/
private void process_image(PImage img){
      int dimension = img.width * img.height;
      print("pixels to process: "+dimension);
      img.loadPixels();
      for (int i= 0; i< dimension; i++){
            color_freq_pair pair = get_relevant_pair(img.pixels[i]);
            pair.increment_frequency();
            if (i %1000 == 0) println(i + "/" + dimension+ "-> %" + ((float)i/dimension)*100);
      }
}