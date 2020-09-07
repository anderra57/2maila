package packSortAndSearch;

import java.util.LinkedList;
import java.util.Queue;

public class RadixSort {

	public void radixSort(Integer[] a, int maxCifras) {
		// Pre: maxCifras indica el número de cifras del elemento mayor de a
		LinkedList<Integer>[] colas = (LinkedList<Integer>[]) new LinkedList[10];

		// inicializar colas
		for (int i = 0; i < colas.length; i++) {
			colas[i] = new LinkedList<Integer>();
		}

                // COMPLETAR CÓDIGO

	}
	

	
	
    public static void main(String[] args) { // prueba radix sort con palabras
  
    	
		Integer[] a = {101, 207, 198, 713, 542, 23, 78, 2, 966, 205};
    	        new RadixSort().radixSort(a, 3);
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}
    } 
	
}
