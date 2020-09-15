import java.util.Arrays;
int[][] board = new int[3][3];
int turn = 0;
boolean win = false;
boolean gameTied = false;


void setup(){
  size(600, 600);
 print("Press control to restart the game \n");
}


void draw(){
  background(255);
  stroke(0);
  strokeWeight(2);
  for(int i = 0;i<board.length;i++){
    for(int j = 0;j<board[0].length;j++){
      rect(j*width/board[0].length, i*height/board.length, width/board[0].length, height/board.length);
      if(board[i][j]==1){
        ellipseMode(CORNER);
        ellipse(j*width/board[0].length, i*height/board.length, width/board[0].length, height/board.length);
      }
      if(board[i][j]==2){
        line(j*width/board[0].length, i*height/board.length, (j+1)*width/board[0].length, (i+1)*height/board.length);
        line((j+1)*width/board[0].length, i*height/board.length, j*width/board[0].length, (i+1)*height/board.length);
      }
    }
  }
}

void mousePressed(){
  //can only place tokens if game is not won
  if(!win){
  //placing x and o
  //check rows
  for(int i = 0;i<board.length;i++){
    for(int j = 0;j<board[0].length;j++){
    if(mouseY>i*height/board.length && mouseY<(i+1)*height/board.length){
      //check columns
      if(mouseX>j*width/board[0].length && mouseX<(j+1)*width/board[0].length){
        if(turn%2==0){
          if(board[i][j]==0){
        board[i][j] = 1;
        turn++;
          }
        }
        else if(turn%2==1){
          //print("\n" + "x in " + i + "," + j);
          if(board[i][j]==0){
          board[i][j] = 2;
          turn++;
          }
        }
        
      }
    }
  }
  }
  
  //check win
  //rows
  for(int i = 0;i<board.length;i++){
    if(board[i][0]!=0){
    if(board[i][0]==board[i][1] && board[i][1]==board[i][2]){
      if(board[i][0]==1){
        print("O wins!");
        win = true;
      }
      else if(board[i][0]==2){
       print("X Wins!");
       win = true;
      }
    }
    }
  }
  //columns
  for(int j = 0;j<board[0].length;j++){
    if(board[0][j]!=0){
   if(board[0][j] == board[1][j] && board[1][j]==board[2][j]){
     if(board[0][j]==1){
        print("O wins!");
        win = true;
      }
      else if(board[0][j]==2){
       print("X Wins!");
       win = true;
      }
   }
    }
  }
  //diagonals
    if(board[0][0]!=0){
      if(board[0][0]==board[1][1] & board[1][1]==board[2][2]){
        if(board[0][0]==1){
        print("O wins!");
        win = true;
      }
      else if(board[0][0]==2){
       print("X Wins!");
       win = true;
      }
      }
    }
    if(board[0][2]!=0){
      if(board[0][2]==board[1][1] & board[1][1]==board[2][0]){
        if(board[0][2]==1){
        print("O wins!");
        win = true;
      }
      else if(board[0][2]==2){
       print("X Wins!");
       win = true;
      }
      }
    }
    
    //check tie
    if(checkTie()){
      if(!win && !gameTied){
       print("Tie!"); 
       gameTied = true;
      }
    }
 
  
  }
}

public boolean checkTie(){
  for(int i = 0;i<board.length;i++){
    for(int j = 0;j<board[0].length;j++){
     if(board[i][j]==0){
      return false; 
     }
    }
  }
  return true;
}

void keyPressed(){
 if(keyCode==CONTROL){
   board = new int[3][3];
   turn = 0;
   win = false;
   gameTied = false;
   print("\n");
 }
}
