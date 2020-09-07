package ezabatuAzpilistaUrtarrila20162017;

public class DoubleLinkedList<T> {
	DoubleNode first;

	public void insertLast(T elem) {
		if (first == null) {
			DoubleNode node1 = new DoubleNode();
			node1.data = elem;
			node1.next = node1;
			node1.prev = node1;
			first = node1;
		} else {
			DoubleNode node1 = new DoubleNode();
			node1.data = elem;
			node1.next = first;
			node1.prev = first.prev;
			first.prev.next = node1;
			first.prev = node1;
		}
	}

	public void print() {
		if (first == null) {
		} else {
			DoubleNode act = first;
			System.out.print(act.data.toString() + " ");
			act = act.next;
			while (act != first) {
				System.out.print(act.data.toString() + " ");
				act = act.next;
			}
			System.out.println();
		}

	}

	public void borrarLista(DoubleLinkedList<T> subLista) {
		// Precondición: “subLista” es una parte de la lista
		// los elementos de “subLista” están en el mismo orden que en la lista
		// principal
		// Postcondición: se han quitado los elementos de “subLista”

		if (subLista.first == null) {
		} // la lista vacía está contenida en cualquier otra lista. No hay que
			// eliminar nada
		else {
			// COMPLETAR CÓDIGO



		}
	}

	private class DoubleNode {
		T data;
		DoubleNode next;
		DoubleNode prev;
	}
	
	public static DoubleLinkedList<String> crearLista(String[] s){
		DoubleLinkedList<String> l = new DoubleLinkedList<String>();
		for (int i = 0; i < s.length; i++) {
			l.insertLast(s[i]);
		}
		return l;
	}

	public static void main(String[] args) {
		// Caso 1
		String[] s1 = { "jon", "amaia", "luis" };
		DoubleLinkedList<String> sub = crearLista(s1);
		String[] s2 = {"ana", "jon", "amaia", "luis", "ander"};
		DoubleLinkedList<String> l = crearLista(s2);
		System.out.println("================================================================");
		System.out.println("Caso 1: borrar({jon, amaia, luis}, {ana, jon, amaia, luis, ander})");
		System.out.println("================================================================");
		sub.print();
		l.print();

		l.borrarLista(sub);
		l.print();

		// Caso 2: la sublista llega hasta el final de la primera lista y
		// continúa circularmente
		System.out.println("================================================================");
		System.out.println("Caso 2: borrar({luis, ander, ana}, {ana, jon, amaia, luis, ander})");
		System.out.println("================================================================");
		String[] s3 = { "luis", "ander", "ana" };
		sub = crearLista(s3);
		String[] s4 = { "ana", "jon", "amaia", "luis", "ander" };
		l = crearLista(s4);

		sub.print();
		l.print();

		l.borrarLista(sub);
		l.print();

		// Caso 3: la sublista es igual a la lista
		System.out.println("================================================================");
		System.out.println("Caso 3: borrar({ana, jon, amaia, luis, ander}, {ana, jon, amaia, luis, ander})");
		System.out.println("================================================================");
		String[] s5 = { "ana", "jon", "amaia", "luis", "ander" };
		sub = crearLista(s5);
		String[] s6 = { "ana", "jon", "amaia", "luis", "ander" };
		l = crearLista(s6);

		sub.print();
		l.print();

		l.borrarLista(sub);
		l.print();

	}

}
