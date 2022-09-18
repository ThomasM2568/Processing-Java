// 4. Exercice sur l écriture de fonction
// 4.a) Ecrire la fonction du 2ème programme ci-dessous qui affiche dans la console si oui ou non la valeur est présente et qui retourne 
//l indice du tableau, respectivement -1. Adaptez le programme en conséquence.
// 3. Exercice sur des tableaux à une dimension (boucle simple – déroulage)
// 3.a) Ecrire le programme qui affiche dans la console si oui ou non une valeur d une variable X initialisée est présente dans un tableau de 15 valeurs entières initialisées.
// 3.b) Pour ce même jeu de tests, écrire le programme qui affichent dans la console si oui ou non la valeur est présente et qui 
//affiche également l indice du tableau, respectivement -1.
// Programme fait par Thomas MIRBEY

int x=27;                                                    // x est la valeur à chercher dans la liste
int tab[]={1,3,5,7,11,13,17,19,23,27};                       // on définit la liste des valeurs dans un tableau

int fonction(int _val,int[] _tab){                           // on définit une fonction qui prend comme arguments un entier à trouver dans un tableau et le tableau
  int _len = _tab.length;                                    // on définit une variable qui contient la longueur du tableau
  boolean _find=false;                                       // on définit un booléen permettant de définir si une valeur à été trouvée ou non dans le tableau
  int _i=0;                                                  // on définit un compteur
  int _pos=0;
  while(_i<_len){                                            // une boucle qui va chercher x dans tab va tourner jusqu'à ce que le compteur soit égal à la 
                                                             //longueur du tableau, donc qu'il n'y ait plus de valeurs à tester
      if(_tab[_i]==_val){                                    // si x est égal à l'élement i du tableau
        print("Element présent à la position ");             // on affiche que l'on a trouvé l'élement
        _pos=_i;                                     
        _find=true;                                          // on change la valeur de la variable find en true puisqu'on a trouvé la valeur dans la liste
        _i+=1;                                               // on ajoute 1 au compteur, si l'élement x est présent plusieurs fois cela permet de le trouver 
                                                             //plusieurs fois et non pas une seule et unique fois
      }else{                                                 // si on ne trouve pas x à la position i du tableau
        _i+=1;                                               // on ajoute 1 au compteur
      }
    }  
    
    if(_find==false){                                          // une fois l'entiereté de la liste parcourue, si la variable n'a pas été trouvée
      print("L'élement n'est pas présent dans le tableau ");   // on affiche que l'élement n'est pas présent
      
      return -1 ;                                              // et on retourne -1
    }else{
      return _pos; 
    }
}

void setup(){

}

void draw(){
  //print(tab.getClass(). getSimpleName());                  // cette ligne permettait de récupérer le type de la variable tab pour faire des vérifications
  println(fonction(x,tab));                                  // on appelle la fonction avec les arguments définis tout au début
  noLoop();                                                  // le programme s'arrête ici
}                                                            // fonction(27,tab) donne 9, fonction(2,tab) donne -1
