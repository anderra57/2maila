import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.event.MouseMotionAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class AmaieraPanela extends JFrame {

	private JPanel contentPane;
	private JLabel lblpTekla;
	private JLabel label;
	private int pKont;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AmaieraPanela frame = new AmaieraPanela(200);
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public AmaieraPanela(int pNeurri) {
		setSize(pNeurri, pNeurri);
		initialize();
	}
	private void initialize() {
		addKeyListener(new ThisKeyListener());
		setTitle("Amaiera Panela");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		contentPane = new JPanel();
		contentPane.addMouseMotionListener(new ContentPaneMouseMotionListener());
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		setLocationRelativeTo(null);
		contentPane.add(getLblpTekla(), BorderLayout.NORTH);
		contentPane.add(getLabel(), BorderLayout.SOUTH);
	}

	private JLabel getLblpTekla() {
		if (lblpTekla == null) {
			lblpTekla = new JLabel("'P' tekla 0 bider sakatu da");
		}
		return lblpTekla;
	}
	private JLabel getLabel() {
		if (label == null) {
			label = new JLabel("");
		}
		return label;
	}
	private class ContentPaneMouseMotionListener extends MouseMotionAdapter {
		@Override
		public void mouseMoved(MouseEvent me) {
			getLabel().setText(String.format("X: %d Y:%d", me.getX(), me.getY()));
		}
	}
	
	private class ThisKeyListener extends KeyAdapter {
		@Override
		public void keyTyped(KeyEvent ek) {
			char karak = ek.getKeyChar();
			
			switch (karak){
				case 'p':
					getLblpTekla().setText(String.format("'P' tekla %d bider sakatu da", ++pKont));
					break;
				case 'h':
					getLblpTekla().setVisible(false);
					break;
				case 's':
					getLblpTekla().setVisible(true);
					break;
			}
		}
	}
}
