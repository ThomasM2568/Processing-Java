//Créez un programme permettant      d'obtenir quelque chose qui ressemblera à    (avec la ville de votre choix) :

//http://api.openweathermap.org/data/2.5/weather?q=Paris,fr&lang=fr&units=metric&APPID=e5906fc1e4373743e5427b4675940341
String texte;
JSONObject json; 
void setup(){ 
        size(400,400); 
        //On récupère les donnéesParis
        json=loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=Paris,fr&lang=fr&units=metric&APPID=e5906fc1e4373743e5427b4675940341");
        //On créé un JSONArray contenant la partie weather des données de json, on récupère [{Texte}]
        JSONArray tabWeather=json.getJSONArray("weather"); 
        //On récupère l'élément 0 du tableau weather, soit {}
        JSONObject objWeather=tabWeather.getJSONObject(0); 
        //On récupère la partie description:texte contenue dans la partie 0 du tabWeather
        String desc=objWeather.getString("description");  
        //On récupère le nom de la ville
        String ville=json.getString("name"); 
        
        //on récupère la partie main
        JSONObject objMain=json.getJSONObject("main"); 
        //on en extrait la variable temp
        double temp=objMain.getDouble("temp");
        int pressure=objMain.getInt("pressure");
        
        String icon=objWeather.getString("icon");
        
        println();
        println("***");
        println("ville :"+ville);
        println();
        println("***");
        println("desc :"+desc);
        println();
        println("***");
        println("temp :"+temp+"°C");
        println();
        println("***");
        println("pressure :"+pressure+"mbar");
        println(icon);
        fill(#000000);//noir
        rect (0,0,400,400);
        
        PImage Etat;
        texte="./icon_meteo/"+icon+".png";
        Etat = loadImage(texte);
        //On place l'image définie ci-dessus dans la fenêtre
        image(Etat,320,120);
        
        fill(#ffffff);//blanc
        String textemeteo="Météo à "+ville;
        textSize(25); 
        text(textemeteo,90,50);//on place le texte
        textAlign(TOP);
        

        String textedesc="Actuellement : "+desc;
        textSize(15); 
        text(textedesc,20,120);
        textAlign(LEFT);
        

        String textetemp="Température : "+temp+"°C";

        text(textetemp,20,150);

        

        String textepressure="Pression : "+pressure+" mbar";

        text(textepressure,20,180);

        
        
}
