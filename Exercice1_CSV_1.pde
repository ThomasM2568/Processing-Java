//Créez un programme permettant d'afficher toutes les communes dont l'altitude minimum est supérieure à 1500 m
Table table; 
//Il faut chercher les villes dont l'altitude minimum est supérieure à 1500m
int altSupA=1500;                                             

void draw(){
  //On charge le fichier
  table = loadTable("villes.csv", "header");                  
  
  for (TableRow row : table.rows()) {
    
    String nom = row.getString("nom");
    String alt = row.getString("alt_min");
  
    if(alt!="NULL"){     //Si l'altitude est renseignée dans le fichier       
    //On la convertie en entier pour pouvoir vérifier si cette altitude est supérieure ou non à notre variable
      int intalt=parseInt(alt);  
      
      if(intalt>=altSupA){                                    
        print("La commune "+nom+" est à une altitude de ");
        println(intalt);
      }
    }
  }
  noLoop();  
}
