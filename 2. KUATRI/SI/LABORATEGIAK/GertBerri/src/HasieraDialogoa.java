import java.awt.EventQueue;

import javax.swing.JDialog;
import javax.swing.JButton;
import java.awt.BorderLayout;
import javax.swing.JPanel;
import java.awt.GridBagLayout;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.GridBagConstraints;
import java.awt.Insets;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.border.EmptyBorder;

public class HasieraDialogoa extends JDialog {
	private JPanel panel;
	private JButton btnOK;
	private JButton btnCancel;
	private JPanel panel_1;
	private JLabel lblIzena;
	private JTextField textField;
	private JLabel lblPasahitza;
	private JPasswordField passwordField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					HasieraDialogoa dialog = new HasieraDialogoa();
					dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
					dialog.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public HasieraDialogoa() {initialize();setLocationRelativeTo(null);}
	
	private void initialize() {
		setTitle("Hasiera");
		setBounds(100, 100, 350, 200);
		getContentPane().add(getPanel(), BorderLayout.SOUTH);
		getContentPane().add(getPanel_1(), BorderLayout.CENTER);
	}
	
	private JPanel getPanel() {
		if (panel == null) {
			panel = new JPanel();
			panel.add(getBtnOK());
			panel.add(getBtnCancel());
		}
		return panel;
	}
	private JButton getBtnOK() {
		if (btnOK == null) {
			btnOK = new JButton("OK");
			btnOK.addActionListener(new BtnOKActionListener());
		}
		return btnOK;
	}
	private JButton getBtnCancel() {
		if (btnCancel == null) {
			btnCancel = new JButton("Cancel");
			btnCancel.addActionListener(new BtnCancelActionListener());
		}
		return btnCancel;
	}
	private JPanel getPanel_1() {
		if (panel_1 == null) {
			panel_1 = new JPanel();
			panel_1.setBorder(new EmptyBorder(0, 45, 0, 45));
			GridBagLayout gbl_panel_1 = new GridBagLayout();
			gbl_panel_1.columnWidths = new int[] {30, 200};
			gbl_panel_1.rowHeights = new int[] {30, 30};
			gbl_panel_1.columnWeights = new double[]{0.0, 1.0};
			gbl_panel_1.rowWeights = new double[]{0.0, 0.0};
			panel_1.setLayout(gbl_panel_1);
			GridBagConstraints gbc_lblIzena = new GridBagConstraints();
			gbc_lblIzena.anchor = GridBagConstraints.EAST;
			gbc_lblIzena.insets = new Insets(0, 0, 5, 5);
			gbc_lblIzena.gridx = 0;
			gbc_lblIzena.gridy = 0;
			panel_1.add(getLblIzena(), gbc_lblIzena);
			GridBagConstraints gbc_textField = new GridBagConstraints();
			gbc_textField.insets = new Insets(0, 0, 5, 0);
			gbc_textField.fill = GridBagConstraints.HORIZONTAL;
			gbc_textField.gridx = 1;
			gbc_textField.gridy = 0;
			panel_1.add(getTextField(), gbc_textField);
			GridBagConstraints gbc_lblPasahitza = new GridBagConstraints();
			gbc_lblPasahitza.anchor = GridBagConstraints.EAST;
			gbc_lblPasahitza.insets = new Insets(0, 0, 0, 5);
			gbc_lblPasahitza.gridx = 0;
			gbc_lblPasahitza.gridy = 1;
			panel_1.add(getLblPasahitza(), gbc_lblPasahitza);
			GridBagConstraints gbc_passwordField = new GridBagConstraints();
			gbc_passwordField.fill = GridBagConstraints.HORIZONTAL;
			gbc_passwordField.gridx = 1;
			gbc_passwordField.gridy = 1;
			panel_1.add(getPasswordField(), gbc_passwordField);
		}
		return panel_1;
	}
	private JLabel getLblIzena() {
		if (lblIzena == null) {
			lblIzena = new JLabel("Izena");
		}
		return lblIzena;
	}
	private JTextField getTextField() {
		if (textField == null) {
			textField = new JTextField();
			textField.setColumns(10);
		}
		return textField;
	}
	private JLabel getLblPasahitza() {
		if (lblPasahitza == null) {
			lblPasahitza = new JLabel("Pasahitza");
		}
		return lblPasahitza;
	}
	private JPasswordField getPasswordField() {
		if (passwordField == null) {
			passwordField = new JPasswordField();
		}
		return passwordField;
	}
	private class BtnOKActionListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if(getPasswordField().getText().contentEquals("is2020")) {
				KonfigDialogoa kd = new KonfigDialogoa();
				kd.setVisible(true);
				setVisible(false);
			}else {
				JOptionPane.showMessageDialog(null, "Pasahitz okerra!");
				getPasswordField().setText("");
				getPasswordField().requestFocus();
			}
		}
	}
	private class BtnCancelActionListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			getPasswordField().setText("");
			getTextField().setText("");
		}
	}
}
