package packExJunio2017;

import java.util.ArrayList;
import java.util.Iterator;

public class Grafo {

	private int numVertices = 5;
	private boolean[][] adjMatrix = {
			 {false, true,  true,  false, true},
		     {true,  false, false, false, false},
		     {true,  false, false, true,  true},
		     {false, false, true,  false, true},
		     {true,  false, true,  true,  false}
	};
	
	public Grafo(){ 
	}
	
	public boolean existeCamino(ArrayList<Integer> lista){
		// Pre: "lista" contiene una lista de enteros <x1, x2, ..., xn>
		// Post: el resultado es true si existe un camino en el grafo que une los elementos de la lista,
		//       es decir, existe un arco (xi, xi+1) para cada pareja de elementos consecutivos de la lista
		
		if (lista.isEmpty()) return false;
		else {

			boolean hayCamino = true;
                        // COMPLETAR





			return hayCamino;
		}
	}
	
	public void test1(){
		ArrayList<Integer> l = new ArrayList<Integer>();
		l.add(1);
		l.add(0);
		l.add(4);
		l.add(3);
		l.add(2);
		System.out.println("Prueba 1. <1,0,4,3,2>. Debería dar true y el resultado es " + existeCamino(l));
	}
	
	public void test2(){
		ArrayList<Integer> l = new ArrayList<Integer>();
		l.add(0);
		l.add(4);
		l.add(3);
		l.add(1);
		System.out.println("Prueba 1. <0,4,3,1>. Debería dar false y el resultado es " + existeCamino(l));
	}
	
	public static void main(String[] args){
		Grafo g = new Grafo();
		g.test1();
		g.test2();
	}
	
}
