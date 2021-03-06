float HEIGHT = 400;
float MAX_VALUE = HEIGHT/2;
float MIN_VALUE = HEIGHT/2 * -1;
float WIDTH = 557;
int ARRSIZE = 200;

Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[ARRSIZE];
    speeds = new float[ARRSIZE];
    for (int i = 0; i < ARRSIZE; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, WIDTH, HEIGHT);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+HEIGHT/2, x+WIDTH, y+HEIGHT/2);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.
    for (int i = 0; i < ARRSIZE; i++) {
      //System.out.println(values[i]);
      if(values[i] > 50) fill(0, 255, 0);
      else if(values[i] > 0) fill(255, 255, 0);
      else if(values[i] > -50) fill(255,140,0);
      else fill(255, 0, 0);
      rect(x+(WIDTH/ARRSIZE*i), y+HEIGHT/2-values[i], WIDTH/ARRSIZE, values[i]);
      
    }

    //???WRITE THIS METHOD!!!
    //THESE ARE WRONG: They just illustrate how they could look



    //Width of the visualizer is 400!
  }
  void update() {
    //???WRITE THIS METHOD!!!
    for (int i = 0; i < ARRSIZE; i++) {
      values[i] += speeds[i];
      if (values[i] > MAX_VALUE || values[i] < MIN_VALUE) {
        //values[i]/=10;
        speeds[i] *= -1;
      }
      //??? keep them values between max/min value

      //??? reverse the speeds so they oscillate up/down when they reach max/min
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
