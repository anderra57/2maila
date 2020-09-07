package packJuegoFichasEnero2015;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class Juego {

	Queue<Integer>[] jugadores;
	// Los colores de las fichas se representan por enteros ,donde las fichas
	// negras vienen dadas por el 0, y el resto de jugadores tendrán el color
	// correspondiente a la posición del jugador (es decir, el jugador 1 tendrá
	// fichas de valor 1, ...)
	Stack<Integer> mesa;
	int NUMJUGADORES = 6;

	public int juego(int n, ArrayList<Tirada> tiradas) {
		// pre: n es el número de fichas inicial de cada jugador
		// “tiradas” tiene los valores de los dados durante una partida
		// post: el resultado es el número del jugador ganador
		jugadores = new LinkedList[NUMJUGADORES];
		for (int i = 0; i < jugadores.length; i++)
			jugadores[i] = new LinkedList<Integer>();
		for (int i = 0; i < jugadores.length; i++)
			for (int j = 1; j <= n; j++)
				jugadores[i].add(i);

		mesa = new Stack<Integer>();

		// JUGAR
		// COMPLETAR
		

		this.print();

		// buscar el jugador con más fichas negras
		int jMax = 0;
		// COMPLETAR


		return jMax;
	}

	private void print() {
		for (int i = 0; i < jugadores.length; i++) {
			String s = "<";
			while (!jugadores[i].isEmpty())
				s = s + " " + jugadores[i].poll().toString();
			s = s + ">";
			System.out.println(i + ": " + s);
		}
		String s = "<";
		while (!mesa.isEmpty())
			s = s + " " + mesa.pop().toString();
		s = s + ">";
		System.out.println("Mesa: " + s);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<Tirada> a = new ArrayList<Tirada>();
		a.add(new Tirada(2, 3));
		a.add(new Tirada(4, 1));
		a.add(new Tirada(3, 5));
		a.add(new Tirada(6, 3));

		new Juego().juego(5, a);

	}

}

