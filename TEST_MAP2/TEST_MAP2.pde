import gifAnimation.*;
import ddf.minim.*;
Minim minim;
AudioSnippet musique;
Gif AfficherGif;
Gif AfficherGif2;
Gif AfficherGif3;
Gif AfficherGif4;
Personnage EmplacementPersonnage;
boolean menu=true;
boolean aide=false;
boolean credits=false;
boolean jouer=false;
boolean quitter=false;
boolean quitterOUI=false;
boolean quitterNON=false;
boolean retour=false;
boolean pause=false;
PImage fond;
PImage bravo;
PImage Femme;
PImage Homme;
PImage herbe;
PImage drapeau;
PImage vache;
PImage fleur;
PImage voiture;
PImage pigeon;
PImage mer;
PImage sable;
PImage soleil;
PImage crabe;
PImage parasol;
PImage lune;
PImage cactus;
PImage oasis;
PImage ville;
PImage nuage_inverse;
PImage nuage;
PImage eau;
PImage desert;
PImage systeme;
PImage champ;
PImage fond5;
int PositionPlateformeX, PositionPlateformeY;
int deplacementPlateformeX, deplacementPlateformeY;
int PositionVoitureX;
int deplacementVoitureX;
int PositionY0=800;
int plateforme;
boolean Ferme=false;
boolean Ville=false;
boolean Plage=false;
boolean Desert=false;
boolean Espace=false;
boolean LaVoitureDemarre=false;
boolean PersonnageTourneCoteGauche;
boolean PersonnageTourneCoteDroit;
boolean PersonnageSurPlateforme;
boolean HommeGifCourtDroite=false;
boolean HommeGifCourtGauche=false;
boolean FemmeGifCourtDroite=false;
boolean FemmeGifCourtGauche=false;
boolean AutorisationAffichageGifHomme=false;
boolean AutorisationAffichageGifFemme=false;
boolean PersonnageHomme=false;
boolean PersonnageFemme=false;
boolean LimiteSaut;
boolean niveauFerme=false;
boolean niveauVille=false;
boolean niveauDesert=false;
boolean niveauPlage=false;
boolean niveauEspace=false;
boolean Perdu=false;
boolean Gagner = false;

void setup(){
  size(1500, 800);             
  herbe=loadImage("herbe2.png");   
  drapeau=loadImage("drapeau.png");
  vache=loadImage("vache.png");
  fleur=loadImage("fleur.png");
  voiture=loadImage("voiture.png");
  pigeon=loadImage("pigeon.png");
  mer=loadImage("mer.png");
  sable=loadImage("sable.png");
  soleil=loadImage("soleil.png");
  crabe=loadImage("crabe.png");
  parasol=loadImage("parasol.png");
  lune=loadImage("lune.png");
  cactus=loadImage("cactus.png");
  oasis=loadImage("oasis.png");
  ville=loadImage("ville.jpg");
  nuage_inverse=loadImage("nuage_inverse.png");
  nuage=loadImage("nuage.png");
  eau=loadImage("eau.jpg");
  desert=loadImage("desert.png");
  systeme=loadImage("systeme.jpg");
  champ=loadImage("champ.jpg");
  bravo = loadImage("bravo.png");
  fond= loadImage("fondJEU.png");
  fond5=loadImage("fond5.png");
  EmplacementPersonnage = new Personnage (0,620); 
  Femme=loadImage("Fille_de_profil_droite.png");
  Homme=loadImage("Garçon_de_profil_droite.png");
  AfficherGif  = new Gif(this, "Hommedroite.gif"); 
  AfficherGif2  = new Gif(this, "Hommegauche.gif"); 
  AfficherGif3  = new Gif(this, "Femmedroite.gif");
  AfficherGif4  = new Gif(this, "Femmegauche.gif");
  minim = new Minim(this);
  musique = minim.loadSnippet("El.Patochon-jv.wav");
  musique.loop();
  AfficherGif.loop();
  AfficherGif2.loop();
  AfficherGif3.loop();
  AfficherGif4.loop();
  Ville();
  Ferme();
  Plage();
  Desert();
  Espace(); 
  PositionPlateformeX=0;
  PositionPlateformeY=550;
  deplacementPlateformeX=4;
  PositionVoitureX=-330;;
  deplacementVoitureX=4;
  AIDE();
  CREDITS();
  JOUER();
  PAUSE();
}
void draw(){
  background(0);
  if (Ferme==true){
    menu=false;
    Ferme(); 
  EmplacementPersonnage.fleche();
  EmplacementPersonnage.Perso();   
  }
  
  Ville();
  Plage();
  Desert();
  Espace();
  EmplacementPersonnage.fleche();
  EmplacementPersonnage.Perso(); 
  if (menu==true) {
    background(fond);
    textAlign(CENTER, CENTER);
    textFont(createFont("Edwardian Script ITC", 150 ));
    fill(5, 0, 0);
    text("Univers games", 750, 100);
    textFont(createFont("Arial", 50));
    fill(5, 0, 0);
    noFill();
    rect(565, 275, 370, 65, 7);
    fill(5, 0, 0);
    noFill();
    text("JOUER", 750, 300);
    rect(565, 375, 370, 65, 7);
    fill(5, 0, 0);
    noFill();
    text("CREDITS", 750, 400);
    rect(565, 475, 370, 65, 7);
    fill(5, 0, 0);
    noFill();
    text("AIDE", 750, 500);
    rect(565, 575, 370, 65, 7);
    fill(5, 0, 0);
    noFill();
    text("QUITTER", 750, 600);
  
  }

if(pause==true) {
  PAUSE();
}  
  
if (aide==true) {
    AIDE();
}
if (credits==true) {
   CREDITS();

}
if (jouer==true) {
  JOUER();
  credits=false;
  aide=false;
 quitter=false;
 retour=false;
}
if (Perdu==true) {
PERDU();
quitter=false;

}
if (Gagner==true) {
GAGNER();

}
if (quitter==true) {
  QUITTER();
   
    }
if (quitterOUI==true){
     exit();//on quite le programme 
}
if (quitterNON==true){
  quitter=false;
  menu=true;
  quitterNON=false;
}
if (keyPressed) {
  if(key == 'p' ||key == 'P'){
    if (Ferme==true) {
     pause=true;
     Ferme=false;
     niveauFerme=true;
    }
    if (Ville==true) {
     pause=true;
     Ville=false;
     niveauVille=true;
    }
    if (Desert==true) {
     Desert=false;
     niveauDesert=true;
    }
    if (Plage==true) {
     pause=true;
     Plage=false;
     niveauPlage=true;
    }
    if (Espace==true) {
     pause=true;
     Espace=false;
     niveauEspace=true;
    }
    
  }
}
}
void mouseClicked(){
  if ( mouseX>565 && mouseX<935 && mouseY>475 && mouseY<540 && menu==true) {
    aide=true;
    menu=false;
    credits=false;
    quitter=false;
    jouer=false; 
    AIDE();
  }
  if(mouseX>520 && mouseX<980 && mouseY>675 && mouseY<740 && credits==true) { 
     credits=false;
   aide=false;
     quitter=false;
       jouer=false;
    menu=true;
  
  }
  
   if ( mouseX>565 && mouseX<935 && mouseY>375 && mouseY<440 && menu==true) {
    menu=false;
    quitter=false;
    jouer=false;
    aide=false;
    credits=true;
    
    CREDITS();
  }
    if(mouseX>520 && mouseX<980 && mouseY>675 && mouseY<740 && aide==true) {
    menu=true;
    aide=false;
    jouer=false;
      credits=false;
      quitter=false;
     
  }
   if ( mouseX>565 && mouseX<935 && mouseY>275 && mouseY<340 && menu==true) {
     menu=false;
     jouer=true;
      credits=false;
     aide=false;
     quitter=false;
     retour=false;
     JOUER();
}
   if ( mouseX>200 && mouseX<700 && mouseY>425 && mouseY<490 && jouer==true) {
    
     menu=false;
     jouer=false;   
     credits=false;
     aide=false;
     quitter=false;
     retour=false;
     PersonnageHomme=true;
     PersonnageFemme=false;
      Ferme=true;
     
   }
      if ( mouseX>800 && mouseX<1300 && mouseY>425 && mouseY<490 && jouer==true) {
        
     menu=false;
     jouer=false;    
     credits=false;
     aide=false;
     quitter=false;
     retour=false;
     PersonnageFemme=true;  
     PersonnageHomme=false;
     Ferme=true;
    
   }
   
   if( mouseX>545 && mouseX<955 && mouseY>575 && mouseY<640 && Perdu==true)  {
      menu=true;
     Perdu=false;
   
  
 
    EmplacementPersonnage = new Personnage (0,620);
    
   }
   if( mouseX>565 && mouseX<935 && mouseY>575 && mouseY<640 && menu==true )  {
    
     
  menu=false;
  QUITTER(); 
    quitter=true;
   }
   if ( mouseX>200 && mouseX<700 && mouseY>425 && mouseY<490 && quitter==true) {
 
     quitterOUI=true;
     
   }
     if ( mouseX>800 && mouseX<1300 && mouseY>425 && mouseY<490 && quitter==true) {
        
    quitterNON=true;
    
   }
   if(mouseX>520 && mouseX<980 && mouseY>375 && mouseY<440 && pause==true) { 
     
   jouer=false;
   credits=true;
   CREDITS();
   }
   
   if(mouseX>520 && mouseX<980 && mouseY>575 && mouseY<640 && pause==true) { 
     
    Ferme=false;
    niveauFerme=false; 
    Ville=false;
    niveauVille=false;
    Desert=false;
    niveauDesert=false;
    Plage=false;
    niveauPlage=false;
    Espace=false;
    niveauEspace=false;
    PersonnageHomme=false;
    PersonnageFemme=false;
    credits=false;
    quitter=false;
    jouer=false;
    pause=false;
    menu=true;
    EmplacementPersonnage = new Personnage (0,620);
    
  
   }
   
   
   if(mouseX>520 && mouseX<980 && mouseY>275 && mouseY<320 && pause==true)  {
    
     if (niveauFerme==true && PersonnageHomme==true) {
       pause=false;
       PersonnageHomme=true;
       PersonnageFemme=false;
       Ferme=true;
     }
     if (niveauFerme==true && PersonnageFemme==true) {
       pause=false;
       PersonnageHomme=false;
       PersonnageFemme=true;
       Ferme=true;
     }
     if (niveauVille==true && PersonnageHomme==true) {
       pause=false;
       PersonnageHomme=true;
       PersonnageFemme=false;
       Ville=true;
     }
     if (niveauVille==true && PersonnageFemme==true) {
       pause=false;
       PersonnageHomme=false;
       PersonnageFemme=true;
       Ville=true;
     }
     if (niveauPlage==true && PersonnageFemme==true) {
       pause=false;
       PersonnageHomme=false;
       PersonnageFemme=true;
      Plage=true;
     } 
     if (niveauPlage==true && PersonnageHomme==true) {
       pause=false;
       PersonnageHomme=true;
       PersonnageFemme=false;
       Plage=true;
     }
     if (niveauDesert==true && PersonnageHomme==true) {
       pause=false;
       PersonnageHomme=true;
       PersonnageFemme=false;
       Desert=true;
     }
    if (niveauDesert==true && PersonnageFemme==true) {
       pause=false;
       PersonnageHomme=false;
       PersonnageFemme=true;
       Desert=true;
     }
   if (niveauEspace==true && PersonnageHomme==true) {
       pause=false;
       PersonnageHomme=true;
       PersonnageFemme=false;
       Espace=true;
     }
     if (niveauEspace==true && PersonnageFemme==true) {
       pause=false;
       PersonnageHomme=false;
       PersonnageFemme=true;
       Espace=true;
     }
   }
  if (Gagner==true) {
   Gagner=false;
   
  } 
}
void keyPressed() {
  
if (key == ' ') {
  
  EmplacementPersonnage.flechehaut = true;
  
  
 if (LimiteSaut==true){   
   EmplacementPersonnage.flechehaut = false;
   EmplacementPersonnage.flechebas = true; 
  }
  if (LimiteSaut==false){
   EmplacementPersonnage.flechebas= false;
}

  if(PersonnageTourneCoteGauche==true) {
    if (PersonnageHomme==true) {
     HommeGifCourtGauche=false;
     Homme=loadImage("Garçon_qui_saute_gauche.png");
    }
    if (PersonnageFemme==true) {
     FemmeGifCourtGauche=false;
     Femme=loadImage("Fille_qui_saute_gauche.png");
    }
   }
   
  if(PersonnageTourneCoteDroit==true) {
    if (PersonnageHomme==true) {
     HommeGifCourtDroite=false;
     Homme=loadImage("Garçon_qui_saute_droite.png");
    }
    if (PersonnageFemme==true) {
     FemmeGifCourtDroite=false;
     Femme=loadImage("Fille_qui_saute_droite.png");
    }
   }
 } 
 
if (key == CODED) {
  
   if (keyCode == RIGHT) {
    EmplacementPersonnage.flechedroite = true; 
    PersonnageTourneCoteDroit=true;
    PersonnageTourneCoteGauche=false;
    
     if (PersonnageHomme==true) {   
      AutorisationAffichageGifHomme=true; 
      HommeGifCourtDroite=true;   
     }
     if (PersonnageFemme==true) {
      AutorisationAffichageGifFemme=true;
      FemmeGifCourtDroite=true;
     }
   
    if (LimiteSaut==true){
     EmplacementPersonnage.flechehaut = false;
     EmplacementPersonnage.flechebas= true;   
     }
    }
   
 if (keyCode == LEFT ) {
   EmplacementPersonnage.flechegauche = true;   
   PersonnageTourneCoteGauche=true;
   PersonnageTourneCoteDroit=false;
   
   if (PersonnageHomme==true){
    AutorisationAffichageGifHomme=true;
    HommeGifCourtGauche=true;
   } 
   if (PersonnageFemme==true){
    AutorisationAffichageGifFemme=true;
    FemmeGifCourtGauche=true;
   }
     
   if (LimiteSaut==true){ 
    EmplacementPersonnage.flechehaut = false;
    EmplacementPersonnage.flechebas= true;  
   }  
  }
  
 }
}


void keyReleased() {
  
 if (key == ' ') {

  EmplacementPersonnage.flechehaut = false;
  EmplacementPersonnage.flechebas= true;
  
  if (PersonnageTourneCoteGauche==true) {
    if (PersonnageHomme==true){
      Homme=loadImage("Garçon_qui_saute_gauche.png"); 
     }
    if (PersonnageFemme==true){
      Femme=loadImage("Fille_qui_saute_gauche.png");
     } 
    if (EmplacementPersonnage.flechegauche == false && EmplacementPersonnage.flechedroite == false) {
      if (PersonnageHomme==true){
        Homme=loadImage("Garçon_de_profil_gauche.png");
       }
      if (PersonnageFemme==true){
        Femme=loadImage("Fille_de_profil_gauche.png"); 
       }   
     }
   }
  
  if (PersonnageTourneCoteDroit==true) {
    if (PersonnageHomme==true){
      Homme=loadImage("Garçon_qui_saute_droite.png");
    }
    if (PersonnageFemme==true){
      Femme=loadImage("Fille_qui_saute_droite.png"); 
    } 
    if (EmplacementPersonnage.flechegauche == false && EmplacementPersonnage.flechedroite == false) {
      if (PersonnageHomme==true){
        Homme=loadImage("Garçon_de_profil_droite.png");
      }
      if (PersonnageFemme==true){
        Femme=loadImage("Fille_de_profil_droite.png");
      }
    }
  }
 
  if(EmplacementPersonnage.flechegauche == true) {
    if (PersonnageHomme==true){
      HommeGifCourtGauche=true;
    }
    if (PersonnageFemme==true){
      FemmeGifCourtGauche=true; 
     }    
   }
   
  if(EmplacementPersonnage.flechedroite == true) {
    if (PersonnageHomme==true){
      HommeGifCourtDroite=true;
     }
    if (PersonnageFemme==true){
      FemmeGifCourtDroite=true;
     }  
   }
 }
 
 if (key == CODED) {
   
   if (keyCode == RIGHT) { 
     EmplacementPersonnage.flechedroite = false;
     
     if (PersonnageHomme==true){
       AutorisationAffichageGifHomme=false;
       HommeGifCourtDroite=false;
       Homme=loadImage("Garçon_de_profil_droite.png");
      }
     if (PersonnageFemme==true){
       AutorisationAffichageGifFemme=true;
       FemmeGifCourtDroite=false; 
       Femme=loadImage("Fille_de_profil_droite.png");
      } 
    } 
   if (keyCode == LEFT) {  
     EmplacementPersonnage.flechegauche = false;
      
     if (PersonnageHomme==true){
       AutorisationAffichageGifHomme=false;  
       HommeGifCourtGauche=false;
       Homme=loadImage("Garçon_de_profil_gauche.png");
      }
    if (PersonnageFemme==true){
      AutorisationAffichageGifFemme=true;
      FemmeGifCourtGauche=false; 
      Femme=loadImage("Fille_de_profil_gauche.png"); 
     }  
    }
  }
}

 
class Personnage {
  
  int PositionX;
  int PositionY;
  int VitessePersonnage = 2;
  boolean flechegauche, flechedroite, flechehaut, flechebas  = false; 
  Personnage(int X, int Y){
  PositionX=X;
  PositionY=Y;

 }

 void Perso() {
   
  if (PersonnageHomme==true){ 
   if (AutorisationAffichageGifHomme==true) {
     if (HommeGifCourtDroite==true) {
       image (AfficherGif, PositionX , PositionY);
      } 
      if(HommeGifCourtDroite==false) {
        if (HommeGifCourtGauche==false) {
        image(Homme, PositionX, PositionY);
        }
       }
      if (HommeGifCourtGauche==true) {
         image (AfficherGif2, PositionX , PositionY);
       }
      if (HommeGifCourtGauche==false) {
        if (HommeGifCourtDroite==false) {
          image(Homme, PositionX, PositionY);
        }
      }
    }
   else{
     image(Homme, PositionX, PositionY);
    }
   }
   
  if (PersonnageFemme){
    if (AutorisationAffichageGifFemme==true) {
     if (FemmeGifCourtDroite==true) {
       image (AfficherGif3, PositionX , PositionY);
      }
      if(FemmeGifCourtDroite==false) {
         if (FemmeGifCourtGauche==false) {
          image(Femme, PositionX, PositionY);
        }
       }
      if (FemmeGifCourtGauche==true) {
         image (AfficherGif4, PositionX , PositionY);
       }
      if (FemmeGifCourtGauche==false) {
         if (FemmeGifCourtDroite==false) {
       image(Femme, PositionX, PositionY);
       }
      }
    }
   else{
     image(Femme, PositionX, PositionY);
   }
  } 

 
if (PositionY0-PositionY>=400+plateforme){
  LimiteSaut=true;  
} 
if (PositionY0-PositionY<=180 || PersonnageSurPlateforme==true) {
 LimiteSaut=false;  
}


  if (Ferme==true) {
   PersonnageSurPlateforme=false;
  VitessePersonnage=1;
    if (PositionX>=1100 && PositionX<=1420 && PositionY>=510 && PositionY<=514) {
     PositionY=510;  
     PersonnageSurPlateforme=true;
     plateforme=150;
    }
    if (PositionX>=50 && PositionX<=270 && PositionY>=450 && PositionY<=454) {
     PositionY=450; 
     PersonnageSurPlateforme=true;
     plateforme=0;
    }
    if (PositionX>=550 && PositionX<=970 && PositionY>=400 && PositionY<=404) {
     PositionY=400; 
     PersonnageSurPlateforme=true;
     plateforme=150;
    }
    if (PositionX>=360 && PositionX<=545 && PositionY>=310 && PositionY<=314) {
     PositionY=310;  
     PersonnageSurPlateforme=true;
     plateforme=350;
    }
    if (PositionX>=-40 && PositionX<=270 && PositionY>=170 && PositionY<=174) {
     PositionY=170; 
     PersonnageSurPlateforme=true;
     plateforme=150;
    }
    if (PositionX>=110 && PositionX<=1550 && PositionY>=0 && PositionY<=4) {
     PositionY=0;
     PersonnageSurPlateforme=true;
     plateforme=150;
    }
    if (PositionX>=420 && PositionX<=483 && PositionY>=300 && PositionY<=310) { 
     Ferme=false;
     Perdu=true;
    
    }
    if (PositionX>=0 && PositionX<=1550 && PositionY>=620){
     plateforme=0; 
    }
    if(PositionX>=1400 && PositionX<=1550 && PositionY<=4) {
      Ferme=false;
      Gagner=true;
      Ville=true;
      PositionX=0;
      PositionY=4;   
    }
  }
  
 if (Ville==true) {
   PersonnageSurPlateforme=false;
   print(PositionX+" ");
   println(PositionY);
   VitessePersonnage=2;
   if (PositionX>=0 && PositionX<=1550 && PositionY>=620) {
     plateforme=0; 
   }
  if (PositionX>=-40 && PositionX<=950 && PositionY>=0 && PositionY<=4) {
     PositionY=0; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    } 
  if (PositionX>=1160 && PositionX<=1520 && PositionY>=100 && PositionY<=104) {
     PositionY=100; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    }
  if (PositionX>=1010 && PositionX<=1210 && PositionY>=150 && PositionY<=154) {
     PositionY=150; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    }
  if (PositionX>=1154 && PositionX<=1194 && PositionY>=150 && PositionY<=154) {
     PositionX=1154; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    }
  if (PositionX>=1004 && PositionX<=1044 && PositionY>=200 && PositionY<=204) {
     PositionX=1004;  
     PersonnageSurPlateforme=true;
    plateforme=150;
    }
  if (PositionX>=854 && PositionX<=900 && PositionY>=250 && PositionY<=254) {
     PositionX=854;
   PersonnageSurPlateforme=true;
    plateforme=150;  
    }
  if (PositionX>=704 && PositionX<=744 && PositionY>=300 && PositionY<=304) {
     PositionX=704;
   PersonnageSurPlateforme=true;
    plateforme=150;  
    }   
  if (PositionX>=860 && PositionX<=1060 && PositionY>=200 && PositionY<=204) {
     PositionY=200; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    }
  if (PositionX>=710 && PositionX<=910 && PositionY>=250 && PositionY<=254) {
     PositionY=250;
   PersonnageSurPlateforme=true;
    plateforme=150;  
    }
  if (PositionX>=560 && PositionX<=760 && PositionY>=300 && PositionY<=304) {
     PositionY=300;
   PersonnageSurPlateforme=true;
    plateforme=150;  
    } 
  if (PositionX>=510 && PositionX<=530 && PositionY>=300 && PositionY<=304) {
     PositionY=300; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    }
  if (PositionX>=460 && PositionX<=480 && PositionY>=275 && PositionY<=284) {
     PositionY=275; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    } 
  if (PositionX>=410 && PositionX<=430 && PositionY>=250 && PositionY<=254) {
     PositionY=250; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    } 
  if (PositionX>=360 && PositionX<=380 && PositionY>=225 && PositionY<=229) {
     PositionY=225;
   PersonnageSurPlateforme=true;
    plateforme=150;  
    }   
  if (PositionX>=310 && PositionX<=330 && PositionY>=200 && PositionY<=204) {
     PositionY=200; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    }      
  if (PositionX>=PositionPlateformeX && PositionX<=PositionPlateformeX + 300 && PositionY>=400 && PositionY<=404) { 
     PositionY=400;
     PositionX=PositionX + deplacementPlateformeX;
     PersonnageSurPlateforme=true;
     plateforme=150; 
  }
  if (PositionX>=PositionPlateformeX - 300 && PositionX<=PositionPlateformeX && PositionY>=400 && PositionY<=404) { 
     PositionY=400;
     PositionX=PositionX - deplacementPlateformeX;
     PersonnageSurPlateforme=true;
     plateforme=150; 
  }  
  if (PositionX>=1160 && PositionX<=1260 && PositionY>=490 && PositionY<=494) {
     PositionY=490; 
    PersonnageSurPlateforme=true;
    plateforme=150; 
    }
  if (PositionX>=1260 && PositionX<=1314 && PositionY>=375 && PositionY<=379) {
     PositionY=375;  
     PersonnageSurPlateforme=true;
    plateforme=150;
    }  
  if (PositionX>=1240 && PositionX<=1280 && PositionY<=670 && PositionY>=390) {
     PositionX=1240; 
    } 
  if (PositionX>=1281 && PositionX<=1320 && PositionY<=670 && PositionY>=390) {
     PositionX=1320; 
    } 
  if (PositionX>=1250 && PositionX<=1349 && PositionY<=143 && PositionY<=139) {
    Ville=false;
    Perdu=true;
    }  
  if (PositionX>=0 && PositionX<=1500 && PositionY<=620 && PositionY>=500 ) {
    LaVoitureDemarre=true;
  }
  if (PositionX>=PositionVoitureX && PositionX<=PositionVoitureX + 350 && PositionY<=670 && PositionY>=500) {
    Ville=false;
    Perdu=true;  
  }
  if (PositionX>=1350 && PositionX<=1550 && PositionY>=620) {
    Ville=false;
    Gagner=true;
    Plage=true;
    PositionX=10;
    PositionY=620;
    } 
 }
 
 
 if (Plage==true) {
   PersonnageSurPlateforme=false;
   
   if (PositionX>=0 && PositionX<=1550 && PositionY>=620) {
     plateforme=0; 
   }
   if (PositionX>=0 && PositionX<=120 && PositionY>=620) {
     PositionY=620;
   }
   if (PositionX>=121 && PositionX<=1280 && PositionY>=620) {
     Plage=false;
     Perdu=true;
   }
   if (PositionX>=1260 && PositionX<=1376 && PositionY>=560 && PositionY<=564) {
    Plage=false;
    Perdu=true;
    }
   if (PositionX>=550 && PositionX<=666 && PositionY>=340 && PositionY<=344) {
    Plage=false;
    Perdu=true;
    } 
   if (PositionX>=170 && PositionX<=290 && PositionY>=500 && PositionY<=504) {
     PositionY=500;
     PersonnageSurPlateforme=true;
     plateforme=100;
   } 
   if (PositionX>=-50 && PositionX<=90 && PositionY>=370 && PositionY<=374) {
     PositionY=370;
     PersonnageSurPlateforme=true;
     plateforme=250;
   } 
  if (PositionX>=200 && PositionX<=470 && PositionY>=250 && PositionY<=254) {
     PositionY=250;
     PersonnageSurPlateforme=true;
     plateforme=380;
   } 
  if (PositionX>=-30 && PositionX<=80 && PositionY>=120 && PositionY<=124) {
     PositionY=120;
     PersonnageSurPlateforme=true;
     plateforme=200;
   } 
  if (PositionX>=200 && PositionX<=270 && PositionY>=20 && PositionY<=24) {
     PositionY=20;
     PersonnageSurPlateforme=true;
     plateforme=50;
   }
  if (PositionX>=400 && PositionX<=620 && PositionY>=50 && PositionY<=54) {
     PositionY=50;
     PersonnageSurPlateforme=true;
     plateforme=50;
   }
  if (PositionX>=400 && PositionX<=720 && PositionY>=400 && PositionY<=404) {
     PositionY=400;
     PersonnageSurPlateforme=true;
     plateforme=200;
   }
  if (PositionX>=850 && PositionX<=1170 && PositionY>=250 && PositionY<=254) {
     PositionY=250;
     PersonnageSurPlateforme=true;
     plateforme=50;
   }
  if (PositionX>=780 && PositionX<=850 && PositionY>=520 && PositionY<=524) {
     PositionY=520;
     PersonnageSurPlateforme=true;
     plateforme=50;
   }
  if (PositionX>=950 && PositionX<=1020 && PositionY>=450 && PositionY<=454) {
     PositionY=450;
     PersonnageSurPlateforme=true;
     plateforme=200;
   }
  if (PositionX>=1100 && PositionX<=1200 && PositionY>=550 && PositionY<=554) {
     PositionY=550;
     PersonnageSurPlateforme=true;
     plateforme=50;
   }
  if (PositionX>=1260 && PositionX<=1530 && PositionY>=620 && PositionY<=625) {
     PositionY=620;
     PersonnageSurPlateforme=true;
     plateforme=50;
   }
  if (PositionX>=1350 && PositionX<=1550 && PositionY>=620) {
    Plage=false;
    Gagner=true;
    Desert=true;
    PositionX=10;
    PositionY=620;
    }  
 }
 
 if (Desert==true) {
    PersonnageSurPlateforme=false;
    
 if (PositionX>=0 && PositionX<=1550 && PositionY>=620) {
     plateforme=0; 
   }
   if (PositionX>=-50 && PositionX<=120 && PositionY>=370 && PositionY<=374) {
     PositionY=370;
     PersonnageSurPlateforme=true;
    plateforme=200;
   }
   if (PositionX>=1150 && PositionX<=1570 && PositionY>=20 && PositionY<=24) {
     PositionY=20;
     PersonnageSurPlateforme=true;
    plateforme=150;
   } 
   if (PositionX>=1350 && PositionX<=1570 && PositionY>=250 && PositionY<=254) {
     PositionY=250;
     PersonnageSurPlateforme=true;
    plateforme=150;
   } 
   if (PositionX>=200 && PositionX<=370 && PositionY>=500 && PositionY<=504) {
     PositionY=500;
     PersonnageSurPlateforme=true;
    plateforme=150;
   }  
   if (PositionX>=200 && PositionX<=370 && PositionY>=240 && PositionY<=244) {
     PositionY=240;
     PersonnageSurPlateforme=true;
    plateforme=350;
   }   
   if (PositionX>=650 && PositionX<=820 && PositionY>=500 && PositionY<=504) {
     PositionY=500;
     PersonnageSurPlateforme=true;
    plateforme=50;
   } 
   if (PositionX>=-50 && PositionX<=120 && PositionY>=110 && PositionY<=114) {
     PositionY=110;
     PersonnageSurPlateforme=true;
    plateforme=150;
   } 
   if (PositionX>=450 && PositionX<=620 && PositionY>=120 && PositionY<=124) {
     PositionY=120;
     PersonnageSurPlateforme=true;
    plateforme=150;
   } 
   if (PositionX>=200 && PositionX<=370 && PositionY>=0 && PositionY<=4) {
     PositionY=0;
     PersonnageSurPlateforme=true;
    plateforme=150;
   }  
   if (PositionX>=795 && PositionX<=965 && PositionY>=70 && PositionY<=74) {
     PositionY=70;
     PersonnageSurPlateforme=true;
    plateforme=150;
   } 
   if (PositionX>=700 && PositionX<=870 && PositionY>=280 && PositionY<=284) {
     PositionY=280;
    PersonnageSurPlateforme=true;
    plateforme=250;
   } 
   if (PositionX>=1000 && PositionX<=1170 && PositionY>=260 && PositionY<=264) {
     PositionY=260;
     PersonnageSurPlateforme=true;
    plateforme=400;
   } 
   if (PositionX>=950 && PositionX<=1170 && PositionY>=620 && PositionY<=624) {
     Perdu=true;
     Desert=false;
   }
   if (PositionX>=1410 && PositionX<=1550 && PositionY==250) {
    Desert=false;
    Gagner=true;
    Espace=true;
    PositionX=10;
    PositionY=250;
    }   
 }
 
 if (Espace==true) {
   
   if (PositionX>=-40 && PositionX<=140 && PositionY>=250 && PositionY<=254) {
    PositionY=250;
    PersonnageSurPlateforme=true;
     plateforme=150;
    }   
   if (PositionX>=1300 && PositionX<=1420 && PositionY>=50 && PositionY<=54) {
    PositionY=50;
    PersonnageSurPlateforme=true;
     plateforme=150;
    }
   if (PositionX>=450 && PositionX<=500 && PositionY>=550 && PositionY<=554) {
    PositionY=550;
    PersonnageSurPlateforme=true;
     plateforme=150;
    } 
   if (PositionX>=900 && PositionX<=950 && PositionY>=250 && PositionY<=254) {
    PositionY=250;
    PersonnageSurPlateforme=true;
     plateforme=150;
    } 
   if (PositionX>=-50 && PositionX<=1550 && PositionY>=620) {
    plateforme=0;
    Espace=false;
    Perdu=true;
    } 
   if (PositionX>=1350 && PositionX<=1490 && PositionY==50) {
    Espace=false;  
    Gagner=true;
    jouer=false;
    menu=true;
    EmplacementPersonnage = new Personnage(0,620);
    } 
   }
 }

 void fleche() {
 
  if(flechehaut==true){ 
  PositionY = PositionY-VitessePersonnage*3;
  }
  if(flechedroite==true) {
   PositionX = PositionX+VitessePersonnage;
  } 
  if(flechegauche==true){
   PositionX = PositionX-VitessePersonnage; 
  }
  if(flechebas==true){
   PositionY = PositionY+VitessePersonnage*2;
  }
  if(PositionY>=620) { 
   flechebas = false;
  }  
  if(PositionY<=0) {
   flechehaut = false; 
   flechebas= true;
  }
 }
}
   
void stop() {
  musique.close();
  minim.stop();
  super.stop();
}
