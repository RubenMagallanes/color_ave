/**
program to load in am image, allow you to select a region, 
and display all colors in and their frequency. 
*/
//grab image.jpg or image.png in directory

// get image dimentions

// change canvas to match / scale 

//allow sleection of pixels


void setup() {
      size(300,150);   //always should be the first line
      smooth();
}
String state = "begin"; // begin -> image -> col_display
PImage img;

void draw(){
      if (state.equals("begin")){
            textSize(15);
            fill (10,80,150);
            text("click to load image.jpg or image.png \nin the data directory", 10, 30); 
      
      }
}

void mouseClicked(){
      if (state.equals("begin")){
            
            img = loadImage("image.jpg");
            if (img == null){
            img = loadImage("image.png");
            }
            //image loaded, should not be null
            print (img == null);
            
      }      

}