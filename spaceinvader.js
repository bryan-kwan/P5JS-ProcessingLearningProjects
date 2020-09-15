let ship;
let invaders = [];
let n;
let shoots = [];

function setup() {
  createCanvas(600, 600);
  ship = new Ship();
  for (let i=0;i<6;i++){
   invaders[i] = new Invader(60 + width/6*i, 20);
  }

}


function draw() {
  background(50);
  ship.show();
  ship.move();
 for (let i=0;i<invaders.length;i++){
   invaders[i].show();
  }
 //for (let k=shoots.length;k>0;k--){
 //    if (shoots[k].y<-100){
 //      shoots.splice(k, 1);
 //    }
    //}
   // for (let z = shoots.length;z>=0;z--){
   //   if (shoots[z].toDelete){
   // shoots.splice(z, 1); 
   //}
   // }
  for (let i=0;i<shoots.length;i++){
    shoots[i].move();
    shoots[i].show();
   for (let j=0;j<invaders.length;j++){
   if (shoots[i].hit(invaders[j])){
     invaders.splice(j, 1);
      if (shoots[i].toDelete){
    shoots.splice(i, 1); 
   }
     shoots[i].vanish();
   }
  }
  }
}

function keyPressed(){
  if (keyCode === RIGHT_ARROW){
    ship.xspeed = 3;
  }
  else if (keyCode === LEFT_ARROW){
    ship.xspeed = -3;
  }
  else if (keyCode === UP_ARROW){
    n = new Shoot(ship.x+10, ship.y-10);
    shoots.push(n);
  }
}
function keyReleased(){
  if (keyCode === LEFT_ARROW || RIGHT_ARROW){
  ship.xspeed = 0;
}
}

class Ship{
  constructor(){
    this.x = width/2;
    this.xspeed = 0;
    this.y = height-30;
  }
  show(){
   fill(255);
   rect(this.x, this.y, 30, 30);
  }
  move(){
    this.x += this.xspeed;
  }
}

class Invader{
  constructor(x, y){
   this.x = x;
   this.y = y;
   this.s = 30;
  }
    show(){
   fill(255, 0, 200);
   ellipse(this.x, this.y, this.s, this.s);
  }
}

class Shoot{
  constructor(x, y){
   this.x = x;
   this.y = y;
   this.toDelete = false;
  }
    show(){
   fill(255);
   rect(this.x, this.y, 10, 20);
  }
  move(){
    this.y += -5;
  }
  vanish(){
    this.toDelete = true;
  }
  hit(other){
    let d = dist(this.x, this.y, other.x, other.y);
    if (d<other.s){
      return true;
    }
    else{
     return false; 
    }
  }
  
}
