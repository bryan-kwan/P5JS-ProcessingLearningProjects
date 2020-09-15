import java.util.Random;

public class Food{
  int[] position = new int[2];
 private void spawn(){
   Random rnd = new Random();
   this.position[0] = rnd.nextInt(width/gridSize)*gridSize;
   this.position[1] = rnd.nextInt(height/gridSize)*gridSize;
 }
 private void show(){
   fill(255, 0, 0);
   rect(this.position[0], this.position[1], gridSize, gridSize);
 }
  
}
