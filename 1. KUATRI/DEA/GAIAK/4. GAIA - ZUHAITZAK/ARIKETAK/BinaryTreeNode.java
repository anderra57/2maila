package packArbolNArio;

public class BinaryTreeNode<T> {
	   T[] valores;
	   BinaryTreeNode<T>[] hijos; 
	         // el tamaño es de la tabla de valores + 1
	   
	   public BinaryTreeNode(T[] a){
		   valores = a;
		   hijos = (BinaryTreeNode<T>[]) new BinaryTreeNode[a.length + 1];
	   }
	
}

