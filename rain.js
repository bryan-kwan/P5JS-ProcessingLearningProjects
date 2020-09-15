drops = [];

function setup() {
  createCanvas(400, 400);
  for (let i = 0; i<100; i++){
  drops[i] = new Raindrop(random(width), random(-200, -100));
  }
}


function draw() {
  background(230, 230, 250);
  for (let i = 0; i<drops.length; i++){
  drops[i].fall();
  drops[i].show();
  }
}

class Raindrop{
  constructor(x, y){
    this.x = x;
    this.y = y;
    this.z = random(0, 20);
    this.yspeed = map(this.z, 0, 20, 3, 12);
    this.l = map(this.z, 0, 20, 10, 20);
    this.thick = map(this.z, 0, 20, 1, 3);
  
  }
  fall(){
    this.y += this.yspeed;
    this.yspeed += 0.3;
    if (this.y>height){
     this.y = random(-100, -50); 
     this.yspeed = random(4, 10);
    }
  }
  show(){
    stroke(138, 43, 226);
    strokeWeight(this.thick);
    line(this.x, this.y, this.x, this.y + this.l);
  }
}
