final float g = 9.8;
final float ini_length = 240;
final float dt = 0.01;
final int x_max =200;
final int y_max = 60;
final int npendulums = 200;
final int x_margin = 150;
final int y_margin = 50;
Pendulum[] pendulums = new Pendulum[npendulums];
float length = ini_length;
float time = 0;

void setup() {
  size(x_max + 2*x_margin, y_max + y_margin * 2);
  /* 6 * i = x position */
  for(int i = 0; i < npendulums; i++){
    length = pow(ini_length / (i * x_max / npendulums), 2);
    pendulums[i] = new Pendulum(sqrt(g/length), (i * x_max / npendulums) + 50, y_max/2, y_max/2 + y_margin);
  }
  fill(0, 0, 0); 
}

void draw() {
  background(256, 256, 256);
  time += dt;
  for(int i = 0; i < npendulums; i++){
    pendulums[i].display();
    pendulums[i].update(time);
  }
  
}
class Pendulum{
  float y_position;
  float y_offset;
  float afrequency;
  float x_offset;
  float amplitude;
  Pendulum(float temp_afrequency, float temp_x_offset, float temp_amplitude, float temp_y_offset){
     y_position = 0;
     afrequency = temp_afrequency;
     amplitude = temp_amplitude;
     x_offset  = temp_x_offset;
     y_offset = temp_y_offset;
  }
  void display(){
    ellipse(x_offset, y_position, 5, 5);
  }
  void update(float t){
    y_position = amplitude * sin(afrequency * t) + y_offset;
  }
}
