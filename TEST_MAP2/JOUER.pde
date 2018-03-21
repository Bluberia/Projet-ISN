 void JOUER() {  
  background(fond5);
  PImage tete;
  size(1500,800);
  textAlign(CENTER, CENTER);
  textFont(createFont("Edwardian Script ITC",150 ));
  fill(5, 0, 0);
  text("Univers games", 750, 100);
  textFont(createFont("Arial",30));
  fill(5, 0, 0);
  noFill();
  rect(200, 425, 500, 65, 7);
  text("Homme", 200, 250, 500, 400);
  text("Femme", 800, 250, 500, 400);
  fill(5, 0, 0);
  noFill();
  rect(800, 425, 500, 65, 7);
  tete = loadImage("gars.png");
  image(tete, 7, 5, 900, 700);
  tete = loadImage("fille.png");
  image(tete, 545, 45, 900, 700);
  }
