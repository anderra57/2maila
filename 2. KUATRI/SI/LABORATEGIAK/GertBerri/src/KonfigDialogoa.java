import java.awt.EventQueue;

import javax.swing.JDialog;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import javax.swing.JRadioButton;
import java.awt.GridLayout;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import javax.swing.ButtonGroup;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class KonfigDialogoa extends JDialog {
	private JPanel panel;
	private JRadioButton rdbtnx;
	private JRadioButton rdbtnx_1;
	private JRadioButton rdbtnx_2;
	private JPanel panel_1;
	private JButton btnOk;
	private final ButtonGroup buttonGroup = new ButtonGroup();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					KonfigDialogoa dialog = new KonfigDialogoa();
					dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
					dialog.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the dialog.
	 */
	public KonfigDialogoa() {

		initialize();
	}
	private void initialize() {
		setTitle("Konfigurazio Leihoa");
		setBounds(100, 100, 450, 300);
		setLocationRelativeTo(null);
		getContentPane().add(getPanel(), BorderLayout.CENTER);
		getContentPane().add(getPanel_1(), BorderLayout.SOUTH);
	}

	private JPanel getPanel() {
		if (panel == null) {
			panel = new JPanel();
			panel.setBorder(new EmptyBorder(45, 0, 45, 0));
			panel.setLayout(new GridLayout(3, 1, 0, 0));
			panel.add(getRdbtnx());
			panel.add(getRdbtnx_1());
			panel.add(getRdbtnx_2());
		}
		return panel;
	}
	private JRadioButton getRdbtnx() {
		if (rdbtnx == null) {
			rdbtnx = new JRadioButton("200x200");
			buttonGroup.add(rdbtnx);
			rdbtnx.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return rdbtnx;
	}
	private JRadioButton getRdbtnx_1() {
		if (rdbtnx_1 == null) {
			rdbtnx_1 = new JRadioButton("400x400");
			buttonGroup.add(rdbtnx_1);
			rdbtnx_1.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return rdbtnx_1;
	}
	private JRadioButton getRdbtnx_2() {
		if (rdbtnx_2 == null) {
			rdbtnx_2 = new JRadioButton("600x600");
			buttonGroup.add(rdbtnx_2);
			rdbtnx_2.setHorizontalAlignment(SwingConstants.CENTER);
		}
		return rdbtnx_2;
	}
	private JPanel getPanel_1() {
		if (panel_1 == null) {
			panel_1 = new JPanel();
			panel_1.add(getBtnOk());
		}
		return panel_1;
	}
	private JButton getBtnOk() {
		if (btnOk == null) {
			btnOk = new JButton("OK");
			btnOk.addActionListener(new BtnOkActionListener());
		}
		return btnOk;
	}
	private class BtnOkActionListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			int neurri = 200;
			
			if (getRdbtnx_1().isSelected()) neurri=400;
			else if (getRdbtnx_2().isSelected()) neurri=600;
			
			AmaieraPanela ap = new AmaieraPanela(neurri);
			ap.setVisible(true);
			setVisible(false);
			
		}
	}
}
