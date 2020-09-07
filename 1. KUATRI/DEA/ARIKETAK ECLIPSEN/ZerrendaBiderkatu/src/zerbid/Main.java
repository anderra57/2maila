package zerbid;

public class Main {

	public static <T> void main(String[] args) {
		Lista<T> lista = new Lista<T>();
		
		lista.gehitu("2");
		lista.gehitu("7");
		lista.gehitu("5");
		
		//lista.inprimatu();
		lista.biderkatu(5);
		lista.inprimatu();
	}

}
