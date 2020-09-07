package linkedListAriketak;

public class LinkedList<T> {
	Node<T> first;
	
	public void add(T elem){
		//hutsa
		Node<T> berria = new Node<T>(elem);
		if (first==null) {first=berria;}
		else{
			berria.next=first;
			first=berria;
		}
		
		
	}
	
	public boolean azpiLista(LinkedList<T> zerrenda){
		Node<T> aux1 = zerrenda.first;
		Node<T> aux2 = this.first;
		
		while(aux1.next!=null){
			while (aux2.next!=null && !aux2.data.equals(aux1.data)){
				aux2=aux2.next;
			}
			if (aux1.next!=null && aux2.next==null) {return false;}
			if (aux1.next==null) {return true;}
			aux1=aux1.next;
		}
		
		return false;
	}
}
