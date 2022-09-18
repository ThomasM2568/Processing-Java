// Code réalisé par Thomas MIRBEY, LK2
//Écrivez un sketch permettant à l utilisateur de créer un labyrinthe de 9x6 cases
//blanches/noires.
//Ensuite, en utilisant uniquement la souris, un clique droit sur une des cases doit la rendre
//noire, alors qu un clique gauche sur cette même case doit la rendre blanche.
//Vous pourrez, tout d abord écrire la construction de ce labyrinthe et l affichage de ce
//labyrinthe. Inspirez-vous du code présenté ci-après.
//- Modélisez le labyrinthe en utilisant une/des classe(s) et un tableau à deux dimensions (des
//cases pleines, des cases vides, une sortie, une entrée, etc.).
//Ajoutez un joueur dirigeable à l aide des flèches du clavier.

import javax.swing.*;                //Cette importation permet de pouvoir afficher des boites de dialogues avec des informations
int nbX=6;                           // On va utiliser deux variables, nbX et nbYn, respectivement le nombre de lignes et de colonnes
int nbY=9;                           //du tableau de l'on va générer à l'aide des deux boucles  
boolean joueurset=false;             //Cette variable permettra de savoir si le joueur a déjà été placé ou non pour éviter d'avoir plusieurs joueurs sur la grille
boolean endset=false;                //Cette variable permettra de savoir si la sortie a déjà été placéé ou non pour éviter d'avoir plusieurs sorties sur la grille
boolean win=false;                   //Cette variable permettra de savoir si on a gagné ou non la partie, cette variable passe à true quand on arrive à la sortie

int joueurX,joueurY=0;               //On définit les positions du joueur en 0,0 afin que celui-ci soit forcément placé

Cell[][]laby1=new Cell[nbX][nbY];    //On va générer un tableau de type cell permettant de stocker les cases du jeu
                                     //On fait correspondre la taille du tableau avec le nombre de lignes et de colonnes précédement définit


int load=0;                          //On créé une variable qui permettra de ne gérérer la grille qu'une seule fois, elle passera à 1 quand la grille sera générée
void setup(){
  
  size(1920,980);                    //La taille de la fenêtre est définite sur 1920 par 980

}

void mouseClicked() {                //Cette partie permet d'exécuter du code dans on clique avec la souris
  int X=mouseX;                      //On récupère les positions X et Y de la souris grâce à mouseX et mouseY
  int Y=mouseY;                      //On utilisera les variables pour calculer la positon de la case sur laquelle on a cliqué
 
                                     //On fait plusieurs étapes pour calculer la position de la case
  double Y1=(Y-28);                  
  double Y2=Y1/50;
  int Yfinal=(int)Y2;                //La suite de calculs permet de détecter précisement la position de la case sur laquelle on clique
  
  double X1=(X-27);
  double X2=X1/50;
  int Xfinal=(int)X2;
  
  if (Xfinal>=nbX){                 //Si le calcul de X ou Y donne une valeur plus grande que le nombre de cases, par exemple si on clique en dehors de la grille
    Xfinal=nbX-1;                   //Alors on retire 1 à la position pour ne pas faire crasher le programme. Cela modifie la case la plus proche du clic.
  }
  
  if (Yfinal>=nbY){
    Yfinal=nbY-1;
  }
  
  println("******");              //On affiche les différentes valeurs du calcul ci-dessus, cela permet de faire du débugage
  println("X"+X);
  println("Y"+Y);
  println("******");
  println("X1 :"+X1);
  println("X2 :"+X2);
  println("X3 :"+Xfinal);
  println("******");
  println("******");
  println("Y1 :"+Y1);
  println("Y2 :"+Y2);
  println("Y3 :"+Yfinal);
  println("******");
 

  println("Actuellement, la case est à l'état :"+laby1[Xfinal][Yfinal].EstFranchissable());  //On affiche l'état de la case sur laquelle on se trouve, cela permet du débugage
  
  if (win==false){          //On ne prend en compte les touches que si la partie n'a pas été gagnée, donc si le joueur n'a pas marché sur la case sortie
    if (mouseButton == LEFT){ //Le bouton gauche permet de placer des cases franchissables
      println("bouton gauche");
      laby1[Xfinal][Yfinal].Cell("True");
      
      
    }else if(mouseButton == RIGHT){ //Le bouton droit droit permet de placer des murs
      println("bouton droit");
      laby1[Xfinal][Yfinal].Cell("False");
      
     
     
    }else if(mouseButton == CENTER){ //Le bouton du centre permet de placer le joueur puis la sortie
      println("bouton centre");
      if(joueurset==false){          //Si le joueur n'a pas encore été placé, on place le joueur
        laby1[Xfinal][Yfinal].Cell("Joueur");
        joueurX=Xfinal;
        joueurY=Yfinal;
        joueurset=true;              //Une fois placé, on ne peut plus placer à nouveau un joueur
      }else if(endset==false){       //Donc comme le joueur est placé on regarde si la sortie l'est aussi
        laby1[Xfinal][Yfinal].Cell("End");//On la place et une fois placée on passe la variable endset à vrai
        endset=true;                 //Cela veut dire qu'on ne pourra plus placer de sortie
      }
        
    }
    laby1[Xfinal][Yfinal].Tracer(50);//Une fois la détection de la touche faite et l'état de la case choisi, on place la case dans le jeu
  }
}

  

void keyPressed() {                 //keyPressed s'exécute quand on appuie sur une touche du clavier
  if (key == CODED && win==false){  //Si on détecte une touche (key==CODED) et que la partie n'a pas encore été gagnée
                                    //Si la partie est gagnée cela va bloquer les contrôles du joueur, celui-ci n'a
                                    //plus besoin de se déplacer
    
                                    //Peut importe la touche pressée, on récupère celle-ci et on regarde si le joueur a été placé
                                    //Si ce n'est pas le cas on ne peut pas déplacé quelque chose qui n'existe pas donc la fonction
                                    //Ne fera rien
                                    //Pour chaque case on va regarder si la case à côté (En haut pour up, à droite pour right etc) 
                                    //est une case franchissable ou non
                                    //Si elle ne l'est pas on ne fait rien
                                    //Et si elle l'est on permute la case du joueur et celle sur laquelle il va
                                    //On va en suite vérifier si la case sur laquelle se trouvera le joueur est une sortie
                                    //Si c'est le cas on change l'état de la variable win à vrai
                                    //Cela va servir pour la suite du programme
                                    
    if (keyCode == UP && joueurset==true){
      String etat=laby1[joueurX][joueurY-1].EstFranchissable();
      println(joueurX,joueurY);
      if(etat=="True"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX][joueurY-1].Cell("Joueur");
        laby1[joueurX][joueurY-1].pos(joueurX,joueurY-1);
        laby1[joueurX][joueurY-1].Tracer(50);
        
        joueurX=joueurX;
        joueurY=joueurY-1;
      }else if(etat=="End"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX][joueurY-1].Cell("Joueur");
        laby1[joueurX][joueurY-1].pos(joueurX,joueurY-1);
        laby1[joueurX][joueurY-1].Tracer(50);
        
        joueurX=joueurX;
        joueurY=joueurY-1;
        win=true;
      }
      
    }

     
    else if (keyCode == LEFT && joueurset==true){
      String etat=laby1[joueurX-1][joueurY].EstFranchissable();
      println(joueurX-1,joueurY);
      if(etat=="True"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX-1][joueurY].Cell("Joueur");
        laby1[joueurX-1][joueurY].pos(joueurX-1,joueurY);
        laby1[joueurX-1][joueurY].Tracer(50);
        
        joueurX=joueurX-1;
        joueurY=joueurY;
      }else if(etat=="End"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX-1][joueurY].Cell("Joueur");
        laby1[joueurX-1][joueurY].pos(joueurX-1,joueurY);
        laby1[joueurX-1][joueurY].Tracer(50);
        
        joueurX=joueurX-1;
        joueurY=joueurY;
        win=true;
      }
    } 
    else if (keyCode == RIGHT && joueurset==true){
      String etat=laby1[joueurX+1][joueurY].EstFranchissable();
      println(joueurX+1,joueurY);
      if(etat=="True"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX+1][joueurY].Cell("Joueur");
        laby1[joueurX+1][joueurY].pos(joueurX+1,joueurY);
        laby1[joueurX+1][joueurY].Tracer(50);
        
        joueurX=joueurX+1;
        joueurY=joueurY;
      }else if(etat=="End"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX+1][joueurY].Cell("Joueur");
        laby1[joueurX+1][joueurY].pos(joueurX+1,joueurY);
        laby1[joueurX+1][joueurY].Tracer(50);
        
        joueurX=joueurX+1;
        joueurY=joueurY;
        win=true;
      }
    }
    else if (keyCode == DOWN && joueurset==true){
      String etat=laby1[joueurX][joueurY+1].EstFranchissable();
      println(joueurX,joueurY);
      if(etat=="True"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX][joueurY+1].Cell("Joueur");
        laby1[joueurX][joueurY+1].pos(joueurX,joueurY+1);
        laby1[joueurX][joueurY+1].Tracer(50);
        
        joueurX=joueurX;
        joueurY=joueurY+1;
      }else if(etat=="End"){
        laby1[joueurX][joueurY].Cell("True");
        laby1[joueurX][joueurY].pos(joueurX,joueurY);
        laby1[joueurX][joueurY].Tracer(50);
        
        laby1[joueurX][joueurY+1].Cell("Joueur");
        laby1[joueurX][joueurY+1].pos(joueurX,joueurY+1);
        laby1[joueurX][joueurY+1].Tracer(50);
        
        joueurX=joueurX;
        joueurY=joueurY+1;
        win=true;
        
      }
    }
  }
  if (win==true){                                        //Si la variable win est vraie, c'est à dire que le joueur
                                                         //est arrivé à la sortie, alors :
    JOptionPane.showMessageDialog(null,                  //On affiche un message qui indique au joueur qu'il a gagné la partie
                "Bravo ! Vous avez gagné !",
                "Jeu",
                JOptionPane.INFORMATION_MESSAGE);
  }
}


void draw(){                                            
  translate(100,100);                                   //On change la position initiale du repère en 100 100 afin que la grille ne sorte pas de l'écran
  if(load==0){                                          //Si la grille n'est pas générée, alors on la génère
  
  for (int i=0;i<nbX;i+=1){                             //Avec deux boucles pour ne pas avoir à tout définitr à la main
    for (int j=0;j<nbY;j+=1){                           
      laby1[i][j]=new Cell();                           //Une créé une nouvelle case contenue dans le tableau définit au début du code
      laby1[i][j].Cell("True");                         //Par défaut toutes les cases sont franchissables
      println(laby1[i][j].EstFranchissable());          //On affiche l'état de la case, cela sert pour du débugage
      laby1[i][j].pos(i,j);                             //On définit les positions de la case en i et j, les variables des deux bloucles
      laby1[i][j].Tracer(50);                           //On trace la case
    }
  }
  load+=1;                                              //La grille a été tracée, on ajoute 1 à la variable load ce qui évitera que la grille se
  }                                                     //génère par dessus les modifications du joueur
}
