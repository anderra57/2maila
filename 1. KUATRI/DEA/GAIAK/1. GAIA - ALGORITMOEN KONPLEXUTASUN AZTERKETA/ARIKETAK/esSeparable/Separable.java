package EsSeparable; 

public class Separable{ 

    public Separable() { } // Constructora 

    public int esSeparable1(Integer[] tabla) { 
    	int izq, der; 
    	 
        for (int i = 0; i < tabla.length; i++){ 
        	izq = 0; for (int k = 0; k < i; k++) izq = izq + tabla[k]; 
        	der = 0; for (int k = i; k < tabla.length; k++) der = der + tabla[k]; 
        	 
        	if (izq == der) return i; 
        } 
        return 0; 
    } 
   
    public int esSeparable2(Integer[] tabla) { 
    	int izq, der; 
    	 









        return 0; 
    } 
}

