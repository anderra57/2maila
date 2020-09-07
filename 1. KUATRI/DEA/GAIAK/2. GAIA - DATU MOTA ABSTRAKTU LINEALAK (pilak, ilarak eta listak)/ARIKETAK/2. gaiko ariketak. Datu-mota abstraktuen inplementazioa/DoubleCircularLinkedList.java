package pack1Partziala2019SekuentziakFusionatu;

public class DoubleCircularLinkedList {
	
	DoubleNode<String> first;

	public void sekuentziakFusionatu(String[] s){
		// Aurre: s.length >= 1	
		int i = 0;
		DoubleNode<String> unekoa = first;





	}

	public void print(){
		if (first == null){}
		else{
			System.out.println(first.data);
			DoubleNode<String> unekoa = first.next;
			while (unekoa != first){
				System.out.println(unekoa.data);
				unekoa = unekoa.next;
			}
		}
	}
	
	public static void main(String[] args) {
		String[] s1 = {"ama", "oso"};
		DoubleCircularLinkedList l = new DoubleCircularLinkedList();
		l.sekuentziakFusionatu(s1);
		System.out.println("Lehen proba: (ama, oso) eman beharko luke: ");
		l.print();
		
		String[] s2 = {"aba", "eba", "ema", "pao", "zao"};
		l.sekuentziakFusionatu(s2);
		System.out.println("Bigarren proba: (aba, ama, eba, ema, oso, pao, zao) eman beharko luke: ");
		l.print();
	}
}

