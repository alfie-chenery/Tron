Bike[] players = new Bike[2];
PImage board;
int res = 20;
int death = 0;//tracks how many players die
              //if both die together this will briefly =2, so draw
int lose = -1;

void setup(){
  delay(1);
  fullScreen();
  //size(800,800);
  board = createImage(width/res,height/res,RGB);
  board.loadPixels();
  for (int i = 0; i < board.pixels.length; i++){
    if ((i < board.width)||(i > board.pixels.length-board.width)||(i % board.width==0)||(i % board.width == board.width-1)){
    //if (top edge) or (bottom edge) or (left edge) or (right edge)
      board.pixels[i]=color(255);
    }
  }

  board.updatePixels();
  stroke(0,100,0,150);  
  
  players[0] = new Bike(10,board.height/2,color(255,0,0),1,0);
  players[1] = new Bike(board.width-11,board.height/2,color(0,0,255),-1,1);  
}

void keyPressed(){
  //player 0
  if (key == 'w'){
    if ((players[0].xdir == 0)&&(players[0].ydir == 1)){
    }else{
      players[0].xdir = 0; 
      players[0].ydir = -1;
    }
  }else if (key == 'a'){
    if ((players[0].xdir == 1)&&(players[0].ydir == 0)){
    }else{
      players[0].xdir = -1; 
      players[0].ydir = 0;
    }
  }else if (key == 's'){
    if ((players[0].xdir == 0)&&(players[0].ydir == -1)){
    }else{
      players[0].xdir = 0; 
      players[0].ydir = 1;
    }
  }else if (key == 'd'){
    if ((players[0].xdir == -1)&&(players[0].ydir == 0)){
    }else{
      players[0].xdir = 1;  
      players[0].ydir = 0;
    }
    
  //player 1
  }else if (key == 'i'){
    if ((players[1].xdir == 0)&&(players[1].ydir == 1)){
    }else{
      players[1].xdir = 0; 
      players[1].ydir = -1;
    }
  }else if (key == 'j'){
    if ((players[1].xdir == 1)&&(players[1].ydir == 0)){
    }else{
      players[1].xdir = -1; 
      players[1].ydir = 0;
    }
  }else if (key == 'k'){
    if ((players[1].xdir == 0)&&(players[1].ydir == -1)){
    }else{
      players[1].xdir = 0;
      players[1].ydir = 1;
    }
  }else if (key == 'l'){
    if ((players[1].xdir == -1)&&(players[1].ydir == 0)){
    }else{
      players[1].xdir = 1;
      players[1].ydir = 0;
    }
  }
}

void draw(){
  //display board
  background(0);
  frameRate(15);//make animations slower
  //display board
  board.loadPixels();
  for (int x = 0; x < board.width; x++){
    for (int y = 0; y < board.height; y++){
      color c = board.get(x,y);
      fill(c);
      rect(x*res,y*res,res,res);
    }
  board.updatePixels();
  }
  
  //update players
  for (int i = 0; i < players.length; i++){
    players[i].update();
    players[i].hitdetect();
    players[i].show();
    if (lose != -1){
      endGame(lose); 
    }
  }
}

void endGame(int p){
  textAlign(CENTER);
  textSize(150);
  fill(0);
  if (death ==2){
    println("Draw");
    //background(200,200,200);
    //text("Draw!",width/2,height/2);
  }else{
    if (p==0){//player 0 lost
      println("Blue Wins!");
      //background(0,0,255);
      //text("Blue Wins!",width/2,height/2);
    }else if (p==1){//player 1 lost
      println("Red Wins!");
      //background(255,0,0);
      //text("Red Wins!",width/2,height/2);
    }
  }
  noLoop(); 
}
