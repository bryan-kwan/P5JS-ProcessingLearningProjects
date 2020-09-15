let cells = [];

function setup() {
createCanvas(600, 600);
cells.push(new Cell());
cells.push(new Cell());
}


function draw() {
background(0);
for(let i = 0;i<cells.length;i++){
cells[i].move();
cells[i].show();
}

}

function mousePressed(){
  for(i=cells.length-1;i>=0;i--){
   if(cells[i].hover(mouseX, mouseY)){
     cells.push(cells[i].mitosis());
     cells.push(cells[i].mitosis());
     cells.splice(i, 1);
   }
  }
}



class Cell {
 constructor(pos, s, c){
   if(pos){
    this.pos = pos.copy(); 
   }
   else{
     this.pos = createVector(random(width), random(height));
   }
   this.s = s || 80;
   this.c = c || color(random(50, 255), 0, random(50, 255), 100);
 }
 move(){
   let vel = p5.Vector.random2D();
   this.pos.add(vel);
 }
 show(){
   noStroke();
   fill(this.c);
   ellipse(this.pos.x, this.pos.y, this.s, this.s);
 }
 hover(x, y){
  let d = dist(x, y, this.pos.x, this.pos.y);
  return (d<this.s);
 }
 mitosis(){
   this.pos.x += random(-this.s, this.s);
   let a = new Cell(this.pos, this.s/2, this.c);
   return a;
 }
 merge(a, b){
   let n = new Cell(a.pos, a.s + b.s, a.c, + b.c);
   return n;
 }
}
