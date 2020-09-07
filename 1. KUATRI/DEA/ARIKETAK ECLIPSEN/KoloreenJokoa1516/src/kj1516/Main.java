package kj1516;

import java.io.IOException;
import java.util.ArrayList;

public class Main {

	public static void main(String[] args) throws IOException {
		long inicio = System.currentTimeMillis();
		Jokoa jokoa=new Jokoa();
		int partidaKop=100000;
		int fitxaKop=8;
		
		int bost=0;
		int lau=0;
		int hiru=0;
		int bi=0;
		int bat=0;
		
		
		
		for (int i=0;i<partidaKop;i++){
			ArrayList<Jokaldi> jokaldiak= jokoa.jokoaHasieratu(fitxaKop);
			int irabazlea= jokoa.jokoa(jokaldiak);
			if (irabazlea==5) {bost++;}
			else if (irabazlea==4) {lau++;}
			else if (irabazlea==3) {hiru++;}
			else if (irabazlea==2) {bi++;}
			else if (irabazlea==1) {bat++;}		
		}
		/*
		System.out.println("5 KOPURUA: " + bost);
		System.out.println("4 KOPURUA: " + lau);
		System.out.println("3 KOPURUA: " + hiru);
		System.out.println("2 KOPURUA: " + bi);
		System.out.println("1 KOPURUA: " + bat);
		System.out.println("0 KOPURUA: " + zero);
		*/
		
		long fin = System.currentTimeMillis();
        long tiempo = ((fin - inicio));
        int seconds = (int) (tiempo / 1000) % 60 ;
        int minutes = (int) ((tiempo / (1000*60)) % 60);
		
		/*
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
		//System.out.println(irabazlea);
		
		*/
		
        emaitzak(partidaKop,fitxaKop,bost,lau,hiru,bi,bat,minutes,seconds);
		int[] a=sortuArray(partidaKop,fitxaKop,bost,lau,hiru,bi,bat,minutes,seconds);
		Fitxeroak.idatzi(a);
		
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
