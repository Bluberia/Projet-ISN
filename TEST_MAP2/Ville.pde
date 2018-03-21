void Ville() {
  
  if(Ville==true) {
    
   image(ville, -100, -200);
   image(drapeau, 1350, 651, 119, 131);
   image(pigeon, 1300, 190, 79, 65);
   
   fill(144,144,144);
   rect(-10, 150, 1000, 30, 50);
   rect(1200, 640, 100, 20);
   rect(1300, 525, 20, 275);
   rect(-1, 770, 1501, 30);
   rect(1200, 250, 400, 30, 50); 
   rect(1050, 300, 200, 30, 50); 
   rect(900, 350, 200, 30, 50); 
   rect(750, 400, 200, 30, 50);
   rect(600, 450, 200, 30, 50);
 
   rect(550, 450, 20, 20, 50);
   rect(500, 425, 20, 20, 50);
   rect(450, 400, 20, 20, 50);
   rect(400, 375, 20, 20, 50);
   rect(350, 350, 20, 20, 50);
   
   rect(750, 400, 50, 80);
   rect(900, 350, 50, 80);
   rect(1050, 300, 50, 80);
   rect(1200, 250, 50, 80);
 
   rect(PositionPlateformeX, PositionPlateformeY, 300, 30, 50);
   
   PositionPlateformeX = PositionPlateformeX + deplacementPlateformeX;
   PositionPlateformeY = PositionPlateformeY + deplacementPlateformeY;
    
   
   if (PositionPlateformeX>=900) {
    deplacementPlateformeX = -deplacementPlateformeX ;   
   }
   if (PositionPlateformeX<=0) {
    deplacementPlateformeX =  abs(deplacementPlateformeX);   
   }
   }
   
   if (LaVoitureDemarre==true && Ville==true) {
   image(voiture, PositionVoitureX, 525, 350,350);
   PositionVoitureX = PositionVoitureX + deplacementVoitureX;
   
   if (PositionVoitureX==750) {
     deplacementVoitureX=0;
   }
   }
   
}

