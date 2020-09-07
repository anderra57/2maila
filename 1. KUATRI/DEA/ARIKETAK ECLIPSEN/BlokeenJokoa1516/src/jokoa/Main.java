package jokoa;
import javax.swing.*;

public class Main {

	public static void main(String[] args) {
		//Jokoa jokoa=new Jokoa();
		//jokoa.hasieratuEskuz();
		long inicio = System.currentTimeMillis();
		int irabazi=0;
		int galdu=0;
		int partidak=1289;
		for (int i=1;i<=partidak;i++){
			Jokoa jokoa=new Jokoa();
			jokoa.hasieratu();
			int emaitza=jokoa.jokatu();
			if (emaitza==-1){
				System.out.println(i + ". partidaren emaitza: galdu :((");
				galdu=galdu+1;
				System.out.println("Partida galduak: " + galdu);
			}
			else {
				System.out.println(i + ". partidaren emaitza: irabazi!! :))");
				irabazi=irabazi+1;
				System.out.println("Partida irabaziak: " + irabazi);
			}
		}
		
		long fin = System.currentTimeMillis();
        long tiempo = ((fin - inicio));
        int seconds = (int) (tiempo / 1000) % 60 ;
        int minutes = (int) ((tiempo / (1000*60)) % 60);
		
		System.out.println();
		System.out.println("-----------------------------------------");
		System.out.println();
		
		
		/*
		System.out.println("EMAITZAK");
		System.out.println("Partida kopurua: " + partidak);
		System.out.println("Partida irabaziak: " + irabazi);
		System.out.println("Partida irabazien %: " + (float)irabazi/partidak*100 + "%");
		System.out.println("Partida galduak: " + galdu);
		System.out.println("Partida galduen %: " + (float)galdu/partidak*100 + "%");
		System.out.println("Simulazioaren iraupena: " + minutes + "min " + seconds + "s");
		*/
		/*
		Frame frame = new Frame();
        frame.setVisible(true);

        
		
        frame.add(new JLabel("EMAITZAK"));
        frame.add(new JLabel("Partida kopurua: " + partidak));
        frame.add(new JLabel("Partida irabaziak: " + irabazi));
        frame.add(new JLabel("Partida irabazien %: " + (float)irabazi/partidak*100 + "%"));
        frame.add(new JLabel("Partida galduak: " + galdu));
        frame.add(new JLabel("Partida galduen %: " + (float)galdu/partidak*100 + "%"));
        frame.add(new JLabel("Simulazioaren iraupena: " + minutes + "min " + seconds + "s"));
		*/
	}
	
}
