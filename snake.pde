public class Snake{
  int[] position = {0, 0};
  int[] speed = {0, 0};
  int snakeLength = 1;
  private void update(){
    this.position[0] += this.speed[0];
    this.position[1] += this.speed[1];
  }
  private void show(){
    fill(255);
    rect(this.position[0], this.position[1], gridSize, gridSize);
  }
  private void move(){
    if(key == CODED){
      if(keyCode == LEFT){
        this.speed[1] = 0;
        this.speed[0] = -gridSize;
      }
      if(keyCode == RIGHT){
        this.speed[1] = 0;
        this.speed[0] = gridSize;
      }
      if(keyCode == UP){
        this.speed[0] = 0;
        this.speed[1] = -gridSize;
      }
      if(keyCode == DOWN){
        this.speed[0] = 0;
        this.speed[1] = gridSize;
      }
    }
  }
  private boolean eatFood(Food other){
    if(this.position[0]==other.position[0] && this.position[1] == other.position[1]){
      this.snakeLength++;
      return true;
    }
    else{
      return false;
    }
  }
  private void offScreen(){
    if(this.position[0]>width){
      this.position[0] = 0;
    }
    if(this.position[0]<0){
      this.position[0] = width;
    }
    if(this.position[1]>height){
      this.position[1] = 0;
    }
    if(this.position[1]<0){
      this.position[1] = height;
    }
  }
}
