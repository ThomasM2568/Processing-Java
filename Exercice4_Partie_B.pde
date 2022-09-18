// 4.b) Ecrire la fonction du 3ème programme ci-dessous.
// 3. Exercice sur des tableaux à une dimension (boucle simple – déroulage)
// 3.c) Pour une valeur entière initialisée, écrivez le programme qui vérifie si ce nombre est paire.
// Programme fait par Thomas MIRBEY

int x=147003 ;                                                 // x est la valeur à chercher dans la liste

String fonction(int _x){
  if (_x%2==0){                                               // on regarde si le reste de la division euclidenne de x par 2 (%2) est nul, si c'est le cas le nombre est pair
    return("Le nombre "+str(_x)+" est pair");                 // on affiche un texte de la forme Le nombre 26 est pair
  }else{                                                      // si le reste de la division euclidenne de x par 2 (%2) n'est pas nul, alors le nombre est impair
    return("Le nombre "+str(_x)+" est impair");               // on affiche un texte de la forme Le nombre 27 est impair
  }
}

void setup(){  
}

void draw(){
  print(fonction (x));                                        // on affiche le résultat de la fonction
  noLoop();                                                   // le programme s'arrête ici
}                                                             // avec fonction(27) on trouve que 27 est impair et avec fonction(2) on trouve que 2 est pair
