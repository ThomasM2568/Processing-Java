//Créez un programme permettant d'afficher toutes les communes (de France métropolitaine) de plus de 5000 habitants (en 2010) ayant une altitude maximale inférieure à 10 m.

import java.util.Arrays;
Table table;
int nbLigne;
int i=0;
int altInfA=10;


String[] FranceM;


void draw(){
  //On charge le fichier
  table = loadTable("villes.csv", "header"); 
  nbLigne=table.getRowCount();
  FranceM=new String[95];
  for (int i=1;i<=95;i+=1){
    FranceM[i-1]=String.valueOf(i);
  }
  FranceM[93]="2A";
  FranceM[94]="2B";
  println(FranceM);
  
  for (TableRow row : table.rows()) {
    
    String nom = row.getString("nom");
    String alt = row.getString("alt_min");
    String dep = row.getString("dep");
    String nb_hab_2010 = row.getString("nb_hab_2010");
    int nbHabitants = parseInt(nb_hab_2010);
  
    //Si l'altitude est renseignée dans le fichier  
    if(alt!="NULL"){
      //On la convertie en entier pour pouvoir vérifier si cette altitude est inférieure ou non à notre variable
      //et si le numéro de département de la commune est présent dans la liste FranceM
      //et si le nombre d'habitants en 2010 est supérieur à 5000
      int intalt=parseInt(alt);
      
      if(intalt<altInfA && Arrays.toString(FranceM).contains(dep) && nbHabitants>=5000){ 
                                                                    
        print("La commune "+nom+"("+dep+")"+" qui avait "+nb_hab_2010+" habitants en 2010 est à une altitude de ");
        println(intalt);
      }
    }
  }
  noLoop();
  
}
