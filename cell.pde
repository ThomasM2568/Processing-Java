// Code réalisé par Thomas MIRBEY, LK2
class Cell{                                                           //On définit une classe Cell
 public String franchissable;                                         //On définit si la case est franchissable
 public int posx;                                                     //On définit posx et posy, respectivement position en x et en y
 public int posy;                                                     //de la case 
 public String couleur;                                               //On définit une variable couleur qui contiendra la couleur de la case
                                                                      //que l'on placera
 public void Cell(String statut){                                     //Le constructeur prend en argument l'état de la case (si elle est franchissable ou non par exemple)
   
  franchissable=statut;                                                //Et met cet argument dans la variable franchissable
   
 }
 
 public void pos(int x,int y){                                         //Cette fonction permet de définir la position de la case avec les arguments x et y
   
  posx=x-1;
  posy=y-1;
   
 }
  

 public String EstFranchissable(){                                     //Cette fonction retourne l'état de la case
   
  return(franchissable);
   
 }
 
 public void Tracer(int size1){                                        //Cette fonction permet de placer la case du tableau avec une taille size1
                                                                       //On récupère l'état de la case grâce à la fonction ci-dessus et en fonction
                                                                       //On choisit sa couleur
  
   if(EstFranchissable()=="True"){
     fill(#ffffff);//Blanc
   }else if (EstFranchissable()=="False"){
     fill(#000000);//Noir
   }else if (EstFranchissable()=="End"){
     fill(#29d92c);//Vert
   }else if (EstFranchissable()=="Joueur"){
     fill(#db0909);//Rouge
   }
  print(EstFranchissable());
  
  rectMode(CENTER);
  rect (posx+50*posx, posy+50*posy, size1, size1);                   //On place la case sur la grille en fonction de la positon entrée et de la taille donnée
 }
 

}
