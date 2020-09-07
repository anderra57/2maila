package packArbolNArio;

public class Arbol { 

    BinaryTreeNode<Integer> root;
    
    public Arbol(){ // crea un árbol de ejemplo
    	//                  15,45,75,93 --------------------------------------
    	//             /     |       |                 \                      \
    	//            /      |       |                  \                      \
    	//           8    18,20,30  49,52,67,72       80,88-----------         94,96,99
    	//          /  \                             /    \           \             
    	//         /    \                           /      \           \           
    	//    1,4,7   9,12,13                  76,78    81,83,85,87    90,92
    	//
    	
    	Integer[] a = {15, 45, 75, 93};
    	root = new BinaryTreeNode<Integer>(a);
       	
    	Integer[] vn11 = {8};
    	BinaryTreeNode<Integer> n11 = new BinaryTreeNode<Integer>(vn11);
       	
    	Integer[] vn12 = {18, 20, 30};
    	BinaryTreeNode<Integer> n12 = new BinaryTreeNode<Integer>(vn12);
    	
    	Integer[] vn13 = {49, 52, 67, 72};
    	BinaryTreeNode<Integer> n13 = new BinaryTreeNode<Integer>(vn13);
    	
    	Integer[] vn14 = {80, 88};
    	BinaryTreeNode<Integer> n14 = new BinaryTreeNode<Integer>(vn14);
    	
    	Integer[] vn15 = {94, 96, 99};
    	BinaryTreeNode<Integer> n15 = new BinaryTreeNode<Integer>(vn15);
    	
    	root.hijos[0] = n11;
    	root.hijos[1] = n12;
    	root.hijos[2] = n13;
    	root.hijos[3] = n14;
    	root.hijos[4] = n15;
        
    	Integer[] vn21 = {1, 4, 7};
    	BinaryTreeNode<Integer> n21 = new BinaryTreeNode<Integer>(vn21);
        
    	Integer[] vn22 = {9, 12, 13};
    	BinaryTreeNode<Integer> n22 = new BinaryTreeNode<Integer>(vn22);
        
    	Integer[] vn23 = {76, 78};
    	BinaryTreeNode<Integer> n23 = new BinaryTreeNode<Integer>(vn23);
        
    	Integer[] vn24 = {81, 83, 85, 87};
    	BinaryTreeNode<Integer> n24 = new BinaryTreeNode<Integer>(vn24);
        
    	Integer[] vn25 = {90, 92};
    	BinaryTreeNode<Integer> n25 = new BinaryTreeNode<Integer>(vn25);
    	
    	n11.hijos[0] = n21;
    	n11.hijos[1] = n22;
    	
    	n14.hijos[0] = n23;
    	n14.hijos[1] = n24;
    	n14.hijos[2] = n25;
    }

    public boolean esta(Integer elem) {
      // post: el resultado es true si “elem” está en el árbol 
      //      y false si no 
    	return esta(elem, root);
    }
    
    private boolean esta(Integer elem, BinaryTreeNode<Integer> act){

    // COMPLETAR	




    }
    
    public static void main(String[] args){
    	
    	Arbol a = new Arbol();
    	
    	System.out.println("LISTA DE PRUEBAS: ");
    	System.out.println("----------------- ");

    	System.out.println("15 true: " + a.esta(15));
    	System.out.println("45 true: " + a.esta(45));
    	System.out.println("75 true: " + a.esta(75));
    	System.out.println("93 true: " + a.esta(93));
    	
    	System.out.println("8 true: " + a.esta(8));
    	System.out.println("20 true: " + a.esta(20));
    	System.out.println("30 true: " + a.esta(30));
    	System.out.println("67 true: " + a.esta(67));
    	System.out.println("99 true: " + a.esta(99));

    	System.out.println("1 true: " + a.esta(1));
    	System.out.println("4 true: " + a.esta(4));
    	System.out.println("7 true: " + a.esta(7));
    	System.out.println("12 true: " + a.esta(12));
    	System.out.println("78 true: " + a.esta(78));
    	System.out.println("92 true: " + a.esta(92));
    	
    	System.out.println("34 false: " + a.esta(34));
    	System.out.println("35 false: " + a.esta(35));
    	System.out.println("89 false: " + a.esta(89));
    	System.out.println("110 false: " + a.esta(110));
    	System.out.println("83 true: " + a.esta(83));
    }
      
}
