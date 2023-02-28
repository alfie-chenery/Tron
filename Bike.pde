class Bike {
  int player;
  int x;
  int y;
  int xdir;
  int ydir;
  color colour;
  
  //constructor
  Bike(int i, int j, color c, int d, int p){
    x = i;
    y = j;
    colour = c;
    xdir = d;
    player = p;

  }
  
  void update(){
    x += xdir;
    y += ydir;
  }
  
  void hitdetect(){
    board.loadPixels();
    color c = board.get(x,y);
    board.updatePixels(); 
    if (c != color(0)){
      //end game
      //background(colour of winner)

      death ++;
      lose = player;
    }
  }
  
  void show(){
    board.loadPixels();
    int loc = x+board.width*y;
    board.pixels[loc] = colour;
    board.updatePixels();
  }
}
