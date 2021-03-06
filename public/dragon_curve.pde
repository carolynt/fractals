void setup() {
   size(600, 600); //sets the size of the canvas
background(8, 8, 8);
};

//if you define variables out here, they don't get reset every time the draw loop runs
var iters = 1;

void draw(){
    mouseClicked = function(){
       iters+=1;
      
var x = 200,y = 200,turns = "",
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
drawCurve();

  }; //end of mouseclick loop
}; //end of draw loop