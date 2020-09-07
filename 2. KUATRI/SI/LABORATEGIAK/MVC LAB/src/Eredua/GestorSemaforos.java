package Eredua;

import java.util.Timer;
import java.util.TimerTask;

/** SEMAFOROA KUDEATZEKO EREDUA*/
public class GestorSemaforos {
	private static GestorSemaforos mGestorSemaforos = new GestorSemaforos();
	private boolean estaVerde;
	private static final int PERIODO = 15;
	private int cont;
	private Timer timer = null;
	
	private GestorSemaforos ()
	{
		estaVerde = true;
		cont = PERIODO;
		TimerTask timerTask = new TimerTask() {
			@Override
			public void run() {
				actualizarCont();
			}		
		};
		timer = new Timer();
		timer.scheduleAtFixedRate(timerTask, 0, 1000);
	}
	
	private void actualizarCont() {
		cont--;
		if (cont == 0) {
			cont = PERIODO;
			estaVerde = !estaVerde;
		}
		//Ereduaren egoera kontrolatik atera
		System.out.printf("EREDUAREN EGOERA-> estaVerde : %b   Cont: %d\n", estaVerde, cont);
		
	}
	
	public static GestorSemaforos getGestorSemaforos() {
		return mGestorSemaforos;
	}
	

	public int getContador() {
		return cont;
	}
	
	public boolean estaVerde() {
		return estaVerde;
	}
	
	public void ponerVerde() {
		if (!estaVerde()) {
			cont = PERIODO;
			estaVerde = true;
		}
	}
}
