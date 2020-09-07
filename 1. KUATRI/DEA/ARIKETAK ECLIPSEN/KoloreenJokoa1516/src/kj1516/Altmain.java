package kj1516;

import java.io.IOException;

public class Altmain {

	public static void main(String[] args) throws IOException {
		/*int[] a=new int[7];
		for (int i=0;i<7;i++){
			a[i]=i;
		}*/
		int[] a=Fitxeroak.irakurri("20191127_032843.txt");
		irakurriArray(a);
	}

	private static int[] sortuArray(int partidaKop, int fitxaKop, int bost, int lau, int hiru, int bi, int bat, int minutes, int seconds) {
		int[] a=new int[9];
		a[0]=partidaKop;
		a[1]=fitxaKop;
		a[2]=bost;
		a[3]=lau;
		a[4]=hiru;
		a[5]=bi;
		a[6]=bat;
		a[7]=minutes;
		try{
		a[8]=seconds;
		}catch(Exception e) {a[8]=0;}
		return a;
	}
	
	private static void emaitzak(int partidaKop, int fitxaKop, int bost, int lau, int hiru, int bi, int bat, int minutes, int seconds){
		System.out.println();
		System.out.println("-----------------------------------------");
		System.out.println();
		
		
		System.out.println("EMAITZAK");
		System.out.println("Fitxa kopurua: " + fitxaKop);
		System.out.println("Partida kopurua: " + partidaKop);
		System.out.println();
		System.out.println("5aren partida irabaziak:   " + bost);
		System.out.println("5aren partida irabazien %: " + (float)bost/partidaKop*100 + "%");
		System.out.println();
		System.out.println("4aren partida irabaziak:   " + lau);
		System.out.println("4aren partida irabazien %: " + (float)lau/partidaKop*100 + "%");
		System.out.println();
		System.out.println("3aren partida irabaziak:   " + hiru);
		System.out.println("3aren partida irabazien %: " + (float)hiru/partidaKop*100 + "%");
		System.out.println();
		System.out.println("2aren partida irabaziak:   " + bi);
		System.out.println("2aren partida irabazien %: " + (float)bi/partidaKop*100 + "%");
		System.out.println();
		System.out.println("1aren partida irabaziak:   " + bat);
		System.out.println("1aren partida irabazien %: " + (float)bat/partidaKop*100 + "%");
		
		System.out.println();
		System.out.println("Simulazioaren iraupena: " + minutes + "min " + seconds + "s");
			
	}
	
	private static void irakurriArray(int[] a){
		int partidaKop = a[0];
		int fitxaKop = a[1];
		int bost = a[2];
		int lau = a[3];
		int hiru = a[4];
		int bi = a[5];
		int bat = a[6];
		int minutes = a[7];
		int seconds = a[8];
		
		emaitzak(partidaKop,fitxaKop,bost,lau,hiru,bi,bat,minutes,seconds);
		
		 
	}

}
