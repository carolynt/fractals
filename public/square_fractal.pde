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
