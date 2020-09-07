package packListaAmigosEnero20172018;

public class Persona {
	   String id;
	   Persona[] amigos; // sus amigos (null si no apunta a nadie)
	   int NUMAMIGOS = 10;
	   
	   public Persona(String id){
		   this.id = id;
		   amigos = new Persona[NUMAMIGOS];
	   }
	   
}
