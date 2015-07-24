//tree
// void setup() {
//     size(1080, 1080);
//     background (255, 255, 255);
// }
// void draw() {
//     fill(151, 232, 232);
//     stroke(177, 230, 230);
//     ellipse(mouseX, mouseY, 10, 12);
// };
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
// var x;
// var y;
// var a;
// var b;

// x=0;y=0;a=0;b=0;

// var iterate=function(){
//     var tmp=x*x-y*y+a;
//     y=2*x*y+b;
//     x=tmp;  
// };

// var iterateABunch=function(n){
//     for(var i=0;i<n;i++){
//         iterate();
//     }
// };

// var drawXY=function(){
//     point(200+x*100,200-y*100);
// };
// var drawAB=function(){
//     point(200+a*100,200-b*100);
// };

// var iterateAndDraw=function(n){
//     for(var i=0;i<n;i++){
//         iterate();
//         drawXY();
//     }
    
// };
// var seriesDiverges=function(n){
//     for(var i=0;i<n;i++){
//         iterate();
//         if(x*x+y*y>4.0){
//             return true;
//         }
//     }
//     return false;
// };


// textSize(20);
// fill(0, 0, 0);

// var textXY=function(xpos,ypos){
//     text("("+x+", "+y+")",xpos,ypos);
// };


// a=-2;
// b=-2;

// var stillDrawing=true;
// var draw= function() {
//     if(stillDrawing){
//         for(var i=0;i<100;i++){
//             a=a+0.01;
//             if(a>=2){
//                 a=-2;
//                 b+=0.01;
//             }
//             if(b>=2){
//                 stillDrawing=false;
//             }
//             x=0;y=0;
//             if(seriesDiverges(40)){
//                 drawAB();
//             }
//         }
//     }
// };
//squares

void setup() {
   size(600, 600); //sets the size of the canvas
   background(255, 255, 255); //sets background color to white
};

//if you define variables out here, they don't get reset every time the draw loop runs
var iters = 1;

//the void draw function just runs the code inside of it over and over again. It's basically a loop that you never break out of. 
void draw(){
  //this mouse clicked thing is wrapping up everything inside of the draw. So basically, the the draw loop is trying to just run over and over again, but it can't run mouseClicked until the user clicks. So clicking is like unleashing one run of the stuff inside.
  mouseClicked = function(){
    //iters stands for iterations and basically says how detailed to draw the picture
    iters+=1;
  //defining where the triangle points are
  //   <--- Number of iterations
    var c = [0, 255, 255];
    noStroke();
    iters = iters>5?5:iters;
    var fRects = function(x, y, depth, s, t){
        c[0]+=100/pow(5, iters);
        c[1]-=25/pow(5, iters);
        c[2]-=100/pow(5, iters);
        fill(c[0], c[1], c[2]);
        if(t){s/=3;}
        if(depth >= 0){
            if(depth === 0){
                rect(x, y, s*3, s*3);
            }
            fRects(x, y, depth - 1, s/3);
            fRects(x + s, y + s, depth - 1, s/3);
            fRects(x, y+2*s, depth - 1, s/3);
            fRects(x+2*s, y, depth - 1, s/3);
            fRects(x+2*s, y+2*s, depth - 1, s/3);
        }
    };
    background(255, 255, 255);
    fRects(0, 0, iters, 600, true);
  }; //end of mouseclick loop
}; //end of draw loop

//dragon curve
    void setup() {
       size(600, 600);
       background(255, 255, 255);
    };

    var iters =1;//
    var x = 0,y = 0,turns = "",
    last = "",dir = 90,len = 2;
    var turn = function(st){
        var nst = "";
        for(var i = st.length-1;i >= 0;i--){
            nst+=st[i]==="l"?"r":"l";
        }
        return nst;
    };
    var init = function(){
        for(var i = 0;i < iters;i++){
            var next = "l"+turn(last)+last.substring(1, last.length);
            turns+=next;
            last = next;
        }
    };
    var drawCurve = function(){
        for(var i = 0;i < turns.length+1;i++){
            stroke(i/iters, 255-i/iters/4, 255-i/iters);
            dir = abs(dir < 0?dir-180:dir)%360;
            switch(dir){
                case 0:
                    line(x,y,x,y-len);
                    y-=len;break;
                case 90:
                    line(x,y,x+len,y);
                    x+=len;break;
                case 180:
                    line(x,y,x,y+len);
                    y+=len;break;
                case 270:
                    line(x,y,x-len,y);
                    x-=len;break;
            }
            dir+=turns[i]==="l"?-90:90;
        }
    };
    init();
    translate(200, 200);
    for(var i = 0;i < 4;i++){
        drawCurve();
        //x = 0;
        //y = 0;
        dir+=90;
    }

    };
};
