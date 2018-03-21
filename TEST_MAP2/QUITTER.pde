  void QUITTER() {
    background(fond5);
    textAlign(CENTER, CENTER);
    textFont(createFont("Arial",50));
    fill(5, 0, 0);
    noFill();
    text("Voulez-vous vraiment quitter ?", 750, 250);
    fill(5, 0, 0);
    noFill();
    rect(200, 425, 500, 65, 7);
    text("Oui", 200, 250, 500, 400);
    text("Non", 800, 250, 500, 400);
    fill(5, 0, 0);
    noFill();
    rect(800, 425, 500, 65, 7); 
        
    }
