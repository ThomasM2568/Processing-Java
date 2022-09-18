// 3. Exercice sur des tableaux à une dimension (boucle simple – déroulage)
// 3.c) Pour une valeur entière initialisée, écrivez le programme qui vérifie si ce nombre est paire.
// Programme fait par Thomas MIRBEY

// x est la valeur à chercher dans la liste
int x=27;                                                    
                                         
void setup(){  
}

void draw(){
  // on regarde si le reste de la division euclidenne de x par 2 (%2) est nul, si c'est le cas le nombre est pair
  if (x%2==0){
    // on affiche un texte de la forme Le nombre 26 est pair
    println("Le nombre "+str(x)+" est pair");                
  }else{      
    // si le reste de la division euclidenne de x par 2 (%2) n'est pas nul, alors le nombre est impair
    // on affiche un texte de la forme Le nombre 27 est impair
    println("Le nombre "+str(x)+" est impair");       
  }
  // le programme s'arrête ici
  noLoop();                                                  
}
