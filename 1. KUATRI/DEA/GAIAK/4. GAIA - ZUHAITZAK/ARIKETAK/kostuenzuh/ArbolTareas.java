package packZereginenKostuaUrtarrila2018;

public class ArbolTareas {

	BinaryTreeNode root;
	
	public ArbolTareas(){ // crea un árbol ejemplo, para hacer pruebas
		Tarea t7 = new Tarea("T7", 5);
		Tarea t1 = new Tarea("T1", 5);
		Tarea t3 = new Tarea("T3", 6);
		Tarea t21 = new Tarea("T21", 5);
		Tarea t45 = new Tarea("T45", 8);
		Tarea t54 = new Tarea("T54", 12);
		Tarea t33 = new Tarea("T33", 5);
		Tarea t31 = new Tarea("T31", 3);
		Tarea t12 = new Tarea("T12", 3);
		Tarea t5 = new Tarea("T5", 5);
		Tarea t10 = new Tarea("T10", 6);
		Tarea t34 = new Tarea("T34", 2);
		Tarea t8 = new Tarea("T8", 7);
		
		BinaryTreeNode n7 = new BinaryTreeNode();
		BinaryTreeNode n1 = new BinaryTreeNode();
		BinaryTreeNode n3 = new BinaryTreeNode();
		BinaryTreeNode n21 = new BinaryTreeNode();
		BinaryTreeNode n45 = new BinaryTreeNode();
		BinaryTreeNode n54 = new BinaryTreeNode();
		BinaryTreeNode n33 = new BinaryTreeNode();
		BinaryTreeNode n31 = new BinaryTreeNode();
		BinaryTreeNode n12 = new BinaryTreeNode();
		BinaryTreeNode n5 = new BinaryTreeNode();
		BinaryTreeNode n10 = new BinaryTreeNode();
		BinaryTreeNode n34 = new BinaryTreeNode();
		BinaryTreeNode n8 = new BinaryTreeNode();
		
		n7.element = t7;
		n1.element = t1;
		n3.element = t3;
		n21.element = t21;
		n45.element = t45;
		n54.element = t54;
		n33.element = t33;
		n31.element = t31;
		n12.element = t12;
		n5.element = t5;
		n10.element = t10;
		n34.element = t34;
		n8.element = t8;
		
		root = n7;
		n7.left = n1;
		n7.right = n12;
		n1.left = n3;
		n1.right = n54;
		n3.left = n21;
		n3.right = n45;
		n54.left = n33;
		n54.right = n31;
		n12.left = n5;
		n12.right = n8;
		n5.left = n10;
		n5.right = n34;
	}


	public int coste(String idTarea){
		return coste(idTarea, root);
	}
	
	private int coste(String idTarea, BinaryTreeNode a){
				// COMPLETAR CÓDIGO









	}
	
	private int suma(BinaryTreeNode a) {
		if (a == null) return 0;
		// COMPLETAR CÓDIGO



	}


	public static void main(String[] args) {
		ArbolTareas a = new ArbolTareas();
		
		System.out.println("El coste de T7 deberia ser 72 y es: " + a.coste("T7"));
		System.out.println("El coste de T31 deberia ser 3 y es: " + a.coste("T31"));
		System.out.println("El coste de T12 deberia ser 23 y es: " + a.coste("T12"));
		System.out.println("El coste de T1 deberia ser 44 y es: " + a.coste("T1"));
		System.out.println("El coste de T5 deberia ser 13 y es: " + a.coste("T5"));
	}

}
