package jokoa;

import java.awt.FlowLayout;

import javax.swing.JFrame;

public class Frame extends JFrame
{
    /**
	 * 
	 */
	//private static final long serialVersionUID = 1L;

	public Frame(){
        super("Emaitzak"); //-- LE PONEMOS UN TITULO
        this.setSize(600,400); //-- LE DAMOS UN TAMAÑO A LA VENTANA
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //-- HACEMOS QUE LA VENTANA SE CIERRE POR DEFAULT
        
        FlowLayout DISTRIBUCION = new FlowLayout();
        this.setLayout(DISTRIBUCION);
        
        
    }
}