void PERDU() {
if (Perdu==true) {
  background(fond5);
  println("PERDU"); 
  textAlign(CENTER, CENTER);
  textFont(createFont("Arial",150));
  fill(5, 0, 0);
  noFill();
  text("PERDU", 750, 250);

  textFont(createFont("Arial",50));
  rect(545, 575, 410, 65, 7);
  fill(5, 0, 0);
  noFill();
  text("RECOMMENCER", 750, 600);
//  quitter=false;
}
}
