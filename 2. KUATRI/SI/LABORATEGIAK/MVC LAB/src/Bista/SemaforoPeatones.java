package Bista;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import Eredua.GestorSemaforos;

import javax.swing.JButton;

public class SemaforoPeatones extends JFrame{

	private static final long serialVersionUID = 820323745068010478L;
	private JPanel contentPane;
	private JPanel pnlSemaforo;
	private LuzSemaforo luzVerde = null;
	private LuzSemaforo luzRoja = null;
	private Controlador controlador = null;
	private JLabel lblCont;
	private JButton btnPedirPaso;


	public SemaforoPeatones() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		initialize();
	}

	private void initialize() {
		setSize(150, 555);
		this.setContentPane(getContentPane());
		setTitle("Peatones");
		setLocationRelativeTo(null);
		setVisible(true);

	}
	
	public JPanel getContentPane() {
		if (contentPane == null) {
			contentPane = new JPanel();
			contentPane.setLayout(new BorderLayout());
			contentPane.add(getPnlSemaforo(), BorderLayout.CENTER);
		}
		return contentPane;
	}
	//SEMAFORO: PANELA
	private JPanel getPnlSemaforo() {
		if (pnlSemaforo == null) {
			pnlSemaforo = new JPanel();
			pnlSemaforo.setLayout(new GridLayout(4, 1, 0, 10));
			pnlSemaforo.add(getLblCont());
			pnlSemaforo.add(getLuzRoja(),null);
			pnlSemaforo.add(getLuzVerde(),null);
			pnlSemaforo.add(getBtnPedirPaso());
		}
		return pnlSemaforo;
	}
	//0- SEMAFORO: argi gorria
	private LuzSemaforo getLuzRoja() {
		if (luzRoja == null) {
			luzRoja = new LuzSemaforo("rojo", true);
		}
		return luzRoja;
	}
	//1- SEMAFORO: argi berdea
	private LuzSemaforo getLuzVerde() {
		if (luzVerde == null) {
			luzVerde = new LuzSemaforo("verde", false);
		}
		return luzVerde;
	}
	//2- SEMAFORO: kontadorea
	private JLabel getLblCont() {
		if (lblCont == null) {
			lblCont = new JLabel("15");
			lblCont.setOpaque(true);
			lblCont.setBackground(Color.BLACK);
			lblCont.setFont(new Font("Lucida Grande", Font.BOLD, 72));
			lblCont.setHorizontalAlignment(SwingConstants.CENTER);
			lblCont.setForeground(Color.RED);
		}
		return lblCont;
	}
	//0- KONTROLATZAILEA : gertakaria botoiari esleitu
	private JButton getBtnPedirPaso() {
		if (btnPedirPaso == null) {
			btnPedirPaso = new JButton("Pedir paso");
			btnPedirPaso.addActionListener(getControlador());
		}
		return btnPedirPaso;
	}
	//1- KONTROLATZAILEA : instantzia	
	private Controlador getControlador() {
		if (controlador == null) {
			controlador = new Controlador();
		}
		return controlador;
	}
	//2- KONTROLATZAILEA : listener-a
	private class Controlador implements ActionListener {
		//Botoia sakatzu gero, ereduko "estaBerde" aldatuko du
		@Override
		public void actionPerformed(ActionEvent e) {
			GestorSemaforos.getGestorSemaforos().ponerVerde();
		}
	}
}
