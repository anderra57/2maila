import java.io.*;


public class Prueba {


	public static void main(String[] args) throws FileNotFoundException {
		// PRUEBAS DE MÉTODOS DE CLASE ELECCIÓN

		Eleccion elec = new Eleccion("England", 2011, "municipal");
		
		System.out.println("Pruebas insertarCandidatura");
		System.out.println("===========================");
		System.out.println("Primera prueba: insertar candidatura en lista vacía");
		Candidatura p = new Candidatura("Scotland", "Edinburgh", "11111", "PP", "Hillary", "Garcia Garcia");
		elec.insertarCandidatura(p);
		elec.print();		

		System.out.println("Segunda prueba: insertar candidatura en lista de 1 elemento");
		p = new Candidatura("Scotland", "Edinburgh", "22222", "PP", "John", "Smith Smith");
		elec.insertarCandidatura(p);
		elec.print();

		System.out.println("Tercera prueba: insertar candidatura en lista de 2 elementos");
		p = new Candidatura("Scotland", "Glasgow", "22222", "PP", "John", "Smith Smith");
		elec.insertarCandidatura(p);
		elec.print();
		
		System.out.println("Cuarta prueba: insertar candidatura en lista de 2 elementos");
		p = new Candidatura("Wales", "London", "22222", "PP", "Adam", "Smith Smith");
		elec.insertarCandidatura(p);
		elec.print();
		
		System.out.println("Pruebas esCandidato");
		System.out.println("===========================");
		Eleccion elec1 = new Eleccion("England", 2011, "municipal");
		System.out.println("Primera prueba: buscar candidatura en lista vacía. Debería devolver FALSE");
		System.out.println(elec1.esCandidato(p));

		System.out.println("Segunda prueba: buscar candidatura en lista no vacía. Debería devolver TRUE");
		p = new Candidatura("Scotland", "Edinburgh", "11111", "PP", "Hillary", "Garcia Garcia");
		System.out.println(elec.esCandidato(p));
		
		System.out.println("Tercera prueba: buscar candidatura en lista no vacía. Debería devolver TRUE");
		p = new Candidatura("Scotland", "Edinburgh", "22222", "PP", "John", "Smith Smith");
		System.out.println(elec.esCandidato(p));
		
		System.out.println("Cuarta prueba: buscar candidatura en lista no vacía. Debería devolver TRUE");
		p = new Candidatura("Wales", "London", "22222", "PP", "Adam", "Smith Smith");
		System.out.println(elec.esCandidato(p));
		
		System.out.println("Quinta prueba: buscar candidatura en lista no vacía. Debería devolver FALSE");
		p = new Candidatura("Wales", "London", "22222", "PP", "Pepe", "Smith Smith");
		System.out.println(elec.esCandidato(p));
		
		
		// Candidatura p1 = new Candidatura("Scotland", "Edinburgh", "11111", "PP", "Hillary", "Garcia Garcia");
		// if (p.equals(p1)) {System.out.println("trueeee");};
		
		
		System.out.println("Pruebas cargarDeFichero");
		System.out.println("===========================");
		System.out.println("Primera prueba: leer candidaturas de fichero vacío");
		elec = new Eleccion("England", 2011, "municipal");
		elec.cargarDeFichero("vacio.txt");
		elec.print();		
		
		System.out.println("Segunda prueba: leer candidaturas de fichero no vacío");
		elec.cargarDeFichero("2000-candidaturas.txt");
		elec.print();
		
		System.out.println("Tercera prueba: leer candidaturas de fichero no vacío");
		elec.cargarDeFichero("2011-Ward-candidates-list-texto.txt");
		elec.print();		
		
		
		System.out.println("Cuarta prueba: buscar candidatura en lista no vacía. Debería devolver TRUE");
		p = new Candidatura("Wales", "London", "22222", "PP", "DUMA", "LUCKSON");
		for (int i = 1; i < 20000; i++) {
			System.out.println("Prueba " + i);
			System.out.println(elec.esCandidato(p));
			}
		
		System.out.println("Fin de las pruebas");

	}

}
