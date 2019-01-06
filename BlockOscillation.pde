float angle;
int t;

void setup () {
  fullScreen(P2D);
  frameRate(60);
  t = 0;
}

void draw () {
  translate(width/2, height/2);
  background(250);
  Display();
  angle -= .06;
  //save("data/BlockOscillation" + t + ".png");
  t++;
}

void Display () {
  int s = 7;
  for (int i=s; i>=-s; i--) {
    for (int j=s; j>=-s; j--) {
      float offset = dist(0, 0, i, j);
      offset *= .3;
      offset *= offset;
      offset *= .5;
      Pave(i, j, map(sin(angle+offset), -1, 1, 4, 16));
    }
  }
}

void Pave (float x, float y, float h) {
  int size = 40;
  float[][] verts = new float[4][2];

  verts[0][0] = .7*(x-y);
  verts[0][1] = -.3*(x+y);
  verts[1][0] = .7*(x-y+1);
  verts[1][1] = -.3*(x+y+1);
  verts[2][0] = .7*(x-y-1);
  verts[2][1] = -.3*(x+y+1);;
  verts[3][0] = .7*(x-y);
  verts[3][1] = -.3*(x+y+2);

  for (int i=0; i<verts.length; i++) {
    verts[i][0] *= size;
    verts[i][1] *= size;
  }

  noStroke();
  fill(128, 180, 180);
  beginShape();
  vertex(verts[0][0], verts[0][1]-h/2*size);
  vertex(verts[1][0], verts[1][1]-h/2*size);
  vertex(verts[3][0], verts[3][1]-h/2*size);
  vertex(verts[2][0], verts[2][1]-h/2*size);
  endShape(CLOSE);
  fill(232, 224, 175);
  beginShape();
  vertex(verts[0][0], verts[0][1]-h/2*size);
  vertex(verts[1][0], verts[1][1]-h/2*size);
  vertex(verts[1][0], verts[1][1]+h/2*size);
  vertex(verts[0][0], verts[0][1]+h/2*size);
  endShape(CLOSE);
  fill(60, 84, 134);
  beginShape();
  vertex(verts[0][0], verts[0][1]-h/2*size);
  vertex(verts[2][0], verts[2][1]-h/2*size);
  vertex(verts[2][0], verts[2][1]+h/2*size);
  vertex(verts[0][0], verts[0][1]+h/2*size);
  endShape(CLOSE);
}
