package Bista;

import javax.swing.ImageIcon;
import javax.swing.JPanel;

import java.awt.GridBagLayout;

import javax.swing.JLabel;

public class LuzSemaforo extends JPanel {

	private static final long serialVersionUID = 3049040957332920611L;
	private String color;
	private boolean activo;
	private JLabel lblLuzSemaforo;

	public LuzSemaforo(String pColor, boolean pActivo) {
		super();
		initialize();
		color = pColor.toLowerCase();
		setActivo(pActivo);
	}

	private void initialize() {
		this.setSize(getPreferredSize());
		this.setLayout(new GridBagLayout());
		this.add(getLblLuzSemaforo());
	}

	private JLabel getLblLuzSemaforo() {
		if (lblLuzSemaforo == null) {
			lblLuzSemaforo = new JLabel("");
		}
		return lblLuzSemaforo;
	}


	public void setActivo(boolean pActivo) {
		activo = pActivo;
		
		String irudiIzena;
		
		if (activo) {
			irudiIzena = "circulo_"+color+".png";
		}else {
			irudiIzena = "circulo_apagado.png";
		}
		
		getLblLuzSemaforo().setIcon(
				new ImageIcon(this.getClass().getResource(irudiIzena)));

	}
}
