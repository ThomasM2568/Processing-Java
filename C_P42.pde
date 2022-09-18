JSONObject json; 
void setup(){ 
        //On récupère les données
        json=loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=Paris,fr&lang=fr&units=metric&APPID=e5906fc1e4373743e5427b4675940341"); 
        JSONArray tabWeather=json.getJSONArray("weather");
        //On créé un JSONArray contenant la partie du array weather des données de json, on récupère 
        JSONObject objWeather=tabWeather.getJSONObject(0);
        //On récupère l'élément 0 du tableau weather
        String desc=objWeather.getString("description");
        //On récupère la partie description:texte contenue dans la partie 0 du tabWeather, soit partiellement nuageux
        String ville=json.getString("name");
        //On récupère le nom de la ville, soit Paris
        println(desc+" à "+ville); 
} 
