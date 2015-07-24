float theta;   

void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  // Move to the end of that line
  translate(0,-120);
  // Start the recursive branching!
  branch(120);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
var x;
var y;
var a;
var b;

x=0;y=0;a=0;b=0;

var iterate=function(){
    var tmp=x*x-y*y+a;
    y=2*x*y+b;
    x=tmp;  
};

var iterateABunch=function(n){
    for(var i=0;i<n;i++){
        iterate();
    }
};

var drawXY=function(){
    point(200+x*100,200-y*100);
};
var drawAB=function(){
    point(200+a*100,200-b*100);
};

var iterateAndDraw=function(n){
    for(var i=0;i<n;i++){
        iterate();
        drawXY();
    }
    
};
var seriesDiverges=function(n){
    for(var i=0;i<n;i++){
        iterate();
        if(x*x+y*y>4.0){
            return true;
        }
    }
    return false;
};


textSize(20);
fill(0, 0, 0);

var textXY=function(xpos,ypos){
    text("("+x+", "+y+")",xpos,ypos);
};


a=-2;
b=-2;

var stillDrawing=true;
var draw= function() {
    if(stillDrawing){
        for(var i=0;i<100;i++){
            a=a+0.01;
            if(a>=2){
                a=-2;
                b+=0.01;
            }
            if(b>=2){
                stillDrawing=false;
            }
            x=0;y=0;
            if(seriesDiverges(40)){
                drawAB();
            }
        }
    }
};
  