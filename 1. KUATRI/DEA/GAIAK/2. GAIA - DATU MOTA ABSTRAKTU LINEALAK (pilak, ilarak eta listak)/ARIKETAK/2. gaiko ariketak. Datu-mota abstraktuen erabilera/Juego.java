package packPoker;

import java.util.ArrayList;
import java.util.Stack;

public class Juego {
	   
    public int jugar(int nJugadores,
                     int nBilletesInicial,
                     ArrayList<Pago> pagos) {
    // Precondición:  2 <=  nJugadores <= 20
    //                nBilletesInicial >= 1
    //                Todos los pagos de la lista “pagos” son correctos,
    //                 es decir, un jugador siempre tiene los billetes 
    //                 necesarios para realizar sus pagos 
    // Postcondición: el resultado es el número de billetes verdaderos 
    //                 del jugador 0 al acabar la partida

    	Stack<Boolean>[] dinero = (Stack<Boolean>[]) new Stack[nJugadores];
    	
        // COMPLETAR CÓDIGO













    	
    	return billetesVerdaderos;
    }
    
    private ArrayList<Pago> crearListaPagos(){
    	/*    	Inicio: 
    	0: 50F
    	1: 50T
    	2: 50T

    	0 1 10 -->
    	0: 40F
    	1: 50T + 10 F
    	2: 50T

    	1 2 15 -->
    	0: 40F
    	1: 45T
    	2: 50T + 10F + 5T

    	2 0 2 -->
    	0: 40F + 2T
    	1: 45T
    	2: 50T + 10F + 3T

    	1 2 20 -->
    	0: 40F + 2T
    	1: 25T
    	2: 50T + 10F + 3T + 20T

    	1 0 2 -->
    	0: 40F + 2T + 2T
    	1: 23T
    	2: 50T + 10F + 3T + 20T

    	2 0 5 -->
    	0: 40F + 2T + 2T + 5T
    	1: 23T
    	2: 50T + 10F + 3T + 15T
    	*/
    	ArrayList<Pago> pagos = new ArrayList<Pago>();
    	pagos.add(new Pago(0, 1, 10));
    	pagos.add(new Pago(1, 2, 15));
    	pagos.add(new Pago(2, 0, 2));
    	pagos.add(new Pago(1, 2, 20));
    	pagos.add(new Pago(1, 0, 2));
    	pagos.add(new Pago(2, 0, 5));
    	
    	return pagos;
    }
    
    public static void main(String[] args) { 

    	Juego juego = new Juego();
    	ArrayList<Pago> pagos = juego.crearListaPagos();
    			
    	System.out.println("Prueba: pagos (0 1 10), (1 2 15), (2 0 2), (1 2 20), (1 0 2), (2 0 5)");
    	System.out.println("El resultado debería ser 9 y es: " + juego.jugar(3, 50, pagos));
 
    	
    }     
}

