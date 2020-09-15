int gridSize = 20;
Snake head = new Snake();
Food apple = new Food();
//int[][] grid = new int[width/gridSize][height/gridSize];

void setup(){
  size(600, 600);
  frameRate(20);
  apple.spawn();
}
void draw(){
  background(0);
  head.move();
  head.offScreen();
  head.update();
  head.show();
  if(head.eatFood(apple)){
    apple.spawn();
  }
  apple.show();
}
