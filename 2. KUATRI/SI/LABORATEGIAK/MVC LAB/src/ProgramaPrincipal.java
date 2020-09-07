
import Bista.SemaforoCoches;
import Bista.SemaforoPeatones;
import Eredua.GestorSemaforos;

public class ProgramaPrincipal {
	public static void main(String[] args) {
		//EREDUA//
		GestorSemaforos.getGestorSemaforos();
		//BISTA//
		SemaforoCoches sc = new SemaforoCoches();
		SemaforoPeatones sp = new SemaforoPeatones();
	}
}
