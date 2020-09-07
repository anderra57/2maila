package packEvaluarExpAritmeticaArbolTHash;

import java.util.HashMap;
	
	public class ArbolExpresion {
		
	BinaryTreeNode<InfoElemExp> root;
	
	public ArbolExpresion(int n) { // la constructora crea árboles de ejemplo
		// Los valores son:
		//    x: 4
		//    a: 5
		//    s: 7
		//    g: 1
		//    m: 5
		//    d: 2
		if (n == 1) {
			BinaryTreeNode<InfoElemExp> n1 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("*", true));
			BinaryTreeNode<InfoElemExp> n2 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("x", false));
			BinaryTreeNode<InfoElemExp> n3 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("a", false));
			//          *  
			//         / \ 
			//         x a  
			// El resultado es: 20
			root     = n1;
			n1.left  = n2;
			n1.right = n3;
		}
		else if (n == 2) {
			BinaryTreeNode<InfoElemExp> n1 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("*", true));
			BinaryTreeNode<InfoElemExp> n2 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("+", true));
			BinaryTreeNode<InfoElemExp> n3 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("*", true));
			BinaryTreeNode<InfoElemExp> n4 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("*", true));
			BinaryTreeNode<InfoElemExp> n5 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("+", true));
			BinaryTreeNode<InfoElemExp> n6 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("+", true));
			BinaryTreeNode<InfoElemExp> n7 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("d", false));
			BinaryTreeNode<InfoElemExp> n8 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("x", false));
			BinaryTreeNode<InfoElemExp> n9 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("a", false));
			BinaryTreeNode<InfoElemExp> n10 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("s", false));
			BinaryTreeNode<InfoElemExp> n11 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("g", false));
			BinaryTreeNode<InfoElemExp> n12 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("a", false));
			BinaryTreeNode<InfoElemExp> n13 = new BinaryTreeNode<InfoElemExp>(new InfoElemExp("m", false));
	
			//                *
			//              /   \
			//             /     \
			//            /       \
			//            +        *
			//          /   \     / \
			//          *    +    +  d
			//         / \  / \  / \ 
			//         x a  s g  a m
			// Representa: ((x * a) + (s + g)) * ((a + m) * d)
			// El resultado es: 560
		
			root     = n1;
			n1.left  = n2;
			n1.right = n3;
			n2.left  = n4;
			n2.right = n5;
			n3.left  = n6;
			n3.right = n7;
			n4.left  = n8;
			n4.right = n9;
			n5.left  = n10;
			n5.right = n11;
			n6.left  = n12;
			n6.right = n13;
	}
	}
	
	public Integer evaluar(HashMap<String, Integer> tHash) {
	      // pre: tHash contiene los valores de las variables
	      // post: Se ha evaluado la expresión correspondiente al árbol
	      //       Los valores de las variables se han tomado de tHash
	      //       Si una variable del árbol no se encuentra en la 
	      //       tabla hash, se asumirá que el valor por defecto es cero
		return evaluar(root, tHash);
	}
	
	private Integer evaluar(BinaryTreeNode<InfoElemExp> a, HashMap<String, Integer> tHash) {
		// Pre: a no es vacío
	












	}
	
	public void print(){
		print(root);
	}
	
	private void print(BinaryTreeNode<InfoElemExp> n){
		if (n != null)
			if (!n.element.operador) System.out.print(n.element.elem);
			else 
			{ System.out.print("(");
  			  print(n.left);
			  System.out.print(n.element.toString());
			  print(n.right);
			  System.out.print(")");
			}
	}
	
	public class InfoElemExp {
	   String elem;       // *, +, ó nombre de una variable
	   boolean operador; // true ­> operador, false ­> variable
	   
		public InfoElemExp(String pElem, boolean pOp) {
			elem = pElem;
			operador = pOp;
		}
		
		public String toString(){
			return elem;
		}
	   
	}

	private class BinaryTreeNode<T> {
		T element;
		BinaryTreeNode<T> left; 
		BinaryTreeNode<T> right; 
		
		public BinaryTreeNode(T info) {
			element = info;
		}
	}

	public static void main(String[] args) {		
		HashMap<String, Integer> th = new HashMap<String, Integer>();
		// Los valores son:
		//    x: 4
		//    a: 5
		//    s: 7
		//    g: 1
		//    m: 5
		//    d: 2
		th.put("x",  4);
		th.put("a",  5);
		th.put("s",  7);
		th.put("g",  1);
		th.put("m",  5);
		th.put("d",  2);
		
		ArbolExpresion a = new ArbolExpresion(1);
		a.print();
		System.out.println();
		System.out.println("El resultado es: " + a.evaluar(th));
		
		a = new ArbolExpresion(2);
		a.print();
		System.out.println();
		System.out.println("El resultado es: " + a.evaluar(th));
	}
	
	
}
