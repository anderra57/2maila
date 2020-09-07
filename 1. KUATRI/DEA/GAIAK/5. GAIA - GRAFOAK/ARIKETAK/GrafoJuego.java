package GrafoJuego;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

public class GrafoJuego
{ 
   private HashMap<Integer, ArrayList<Casilla>> adyacentes;
   // clave: valor de la casilla
   // valor: lista de casillas adyacentes a ella
   
   public GrafoJuego(){ // constructora: crea un grafo de ejemplo:
	   // 11 (B) --> 5, 13
	   // 5  (B) --> 8, 9, 11, 13
	   // 13 (N) --> 5, 8, 11
	   // 8  (B) --> 5, 9, 13
	   // 9  (N) --> 1, 3, 5, 7, 8, 12
	   // 1  (B) --> 3, 4, 9
	   // 3  (N) --> 1, 4, 9, 12, 17
	   // 7  (N) --> 9, 12
	   // 12 (N) --> 3, 7, 9, 17, 20
	   // 4  (B) --> 1, 3, 17, 20
	   // 17 (N) --> 1, 3, 4, 12, 20
	   // 20 (N) --> 4, 12, 17
	   
	   Casilla c11 = new Casilla("blanco", 11);
	   Casilla c5  = new Casilla("blanco", 5);
	   Casilla c13 = new Casilla("negro", 13);
	   Casilla c8  = new Casilla("blanco", 8);
	   Casilla c9  = new Casilla("negro", 9);
	   Casilla c1  = new Casilla("blanco", 1);
	   Casilla c3  = new Casilla("negro", 3);
	   Casilla c7  = new Casilla("negro", 7);
	   Casilla c12 = new Casilla("negro", 12);
	   Casilla c4  = new Casilla("blanco", 4);
	   Casilla c17 = new Casilla("negro", 17);
	   Casilla c20 = new Casilla("blanco", 20);

	   ArrayList<Casilla> lista11 = new ArrayList<Casilla>();
	   lista11.add(c5);
	   lista11.add(c13);
	   
	   ArrayList<Casilla> lista5 = new ArrayList<Casilla>();
	   lista5.add(c8);
	   lista5.add(c9);
	   lista5.add(c11);
	   lista5.add(c13);
	   
	   ArrayList<Casilla> lista13 = new ArrayList<Casilla>();
	   lista13.add(c5);
	   lista13.add(c8);
	   lista13.add(c11);
	   
	   ArrayList<Casilla> lista8 = new ArrayList<Casilla>();
	   lista8.add(c5);
	   lista8.add(c9);
	   lista8.add(c13);
	   
	   ArrayList<Casilla> lista9 = new ArrayList<Casilla>();
	   lista9.add(c1);
	   lista9.add(c3);
	   lista9.add(c5);
	   lista9.add(c7);
	   lista9.add(c8);
	   lista9.add(c12);
	   
	   ArrayList<Casilla> lista1 = new ArrayList<Casilla>();
	   lista1.add(c3);
	   lista1.add(c4);
	   lista1.add(c9);
	   
	   ArrayList<Casilla> lista3 = new ArrayList<Casilla>();
	   lista3.add(c1);
	   lista3.add(c4);
	   lista3.add(c9);
	   lista3.add(c12);
	   lista3.add(c17);
	   
	   ArrayList<Casilla> lista7 = new ArrayList<Casilla>();
	   lista7.add(c9);
	   lista7.add(c12);
	   
	   ArrayList<Casilla> lista12 = new ArrayList<Casilla>();
	   lista12.add(c3);
	   lista12.add(c7);
	   lista12.add(c9);
	   lista12.add(c17);
	   lista12.add(c20);
	   
	   ArrayList<Casilla> lista4 = new ArrayList<Casilla>();
	   lista4.add(c1);
	   lista4.add(c3);
	   lista4.add(c17);
	   lista4.add(c20);
	   
	   ArrayList<Casilla> lista17 = new ArrayList<Casilla>();
	   lista17.add(c1);
	   lista17.add(c3);
	   lista17.add(c4);
	   lista17.add(c12);
	   lista17.add(c20);
	   
	   ArrayList<Casilla> lista20 = new ArrayList<Casilla>();
	   lista20.add(c4);
	   lista20.add(c12);
	   lista20.add(c17);

	   adyacentes = new HashMap<Integer, ArrayList<Casilla>>();
	   adyacentes.put(11, lista11);
	   adyacentes.put(5, lista5);
	   adyacentes.put(13, lista13);
	   adyacentes.put(8, lista8);
	   adyacentes.put(9, lista9);
	   adyacentes.put(1, lista1);
	   adyacentes.put(3, lista3);
	   adyacentes.put(7, lista7);
	   adyacentes.put(12, lista12);
	   adyacentes.put(4, lista4);
	   adyacentes.put(17, lista17);
	   adyacentes.put(20, lista20);
   }

   public LinkedList<Casilla> camino(Casilla cComienzo, Casilla cFinal){

      Queue<Casilla> sinExaminar = new LinkedList<Casilla>();

      HashSet<Casilla> visitados = new HashSet<Casilla>();
      HashMap<Casilla, Casilla> camino = new HashMap<Casilla, Casilla>();

      LinkedList<Casilla> resultado = new LinkedList<Casilla>();


      sinExaminar.add(cComienzo);
      camino.put(cComienzo,  null);
      visitados.add(cComienzo);
      boolean enc = false;
      Casilla act = null;;
      
      while (!enc && !sinExaminar.isEmpty()) {
    	  act = sinExaminar.remove();

    	  

      // ¡COMPLETAR!









      }
    		  


      return resultado;
   }
   
   public static void main(String[] args) {
	   System.out.println("El resultado debería ser 20-17-4-3-1-9-5-13-11");
	   new GrafoJuego().camino(new Casilla("blanco", 11), new Casilla("blanco", 20));
   }
   
}
