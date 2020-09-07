package packEnero2018Compilador;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

	public class Compilador {

		   HashMap<String, ArrayList<String>> dependencias;
		   
		   public Compilador(){
			   dependencias = new HashMap<String, ArrayList<String>>();
			   
			   ArrayList<String> l1 = new ArrayList<String>();
			   l1.add("PR2");
			   l1.add("PR3");
			   dependencias.put("PR1", l1);
			   
			   ArrayList<String> l2 = new ArrayList<String>();
			   l2.add("PR5");
			   l2.add("PR3");
			   dependencias.put("PR2", l2);
			   
			   ArrayList<String> l15 = new ArrayList<String>();
			   l15.add("PR5");
			   l15.add("PR14");
			   dependencias.put("PR15", l15);
			   
			   ArrayList<String> l3 = new ArrayList<String>();
			   l3.add("PR5");
			   dependencias.put("PR3", l3);
			   
			   ArrayList<String> l5 = new ArrayList<String>();
			   l5.add("PR2");
			   dependencias.put("PR5", l5);
			   
			   ArrayList<String> l14 = new ArrayList<String>();
			   l14.add("PR25");
			   dependencias.put("PR14", l14);
			   
		   }
		   

		   public boolean esVálido(String prog) {
		   // Postcondición: el resultado será true si se han definido TODOS los 
		   //        programas usados directa o indirectamente por “prog” y false si no
			   
			   Queue<String> porExaminar = new LinkedList<String>();
			   HashSet<String> examinados = new HashSet<String>();
			   
			   porExaminar.add(prog);
			   examinados.add(prog);
			   // COMPLETAR CÓDIGO
			 











			   return !error;
		}
		   
		   
			public static void main(String[] args) {

				Compilador c = new Compilador();
				
				System.out.println("El programa PR1 deberia ser correcto (true) y es: " + c.esVálido("PR1"));
				System.out.println("El programa PR15 deberia ser incorrecto (false) y es: " + c.esVálido("PR15"));

			}

}
