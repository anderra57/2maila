package jokoa;
import java.util.Stack;
import java.util.Random;

public class Jokoa {
	Stack<Bloke>[] taula;
	public static int zutabeKop = 7;
	
	public Jokoa(){
		taula=(Stack<Bloke>[]) new Stack[zutabeKop];
		for (int i=0; i<=zutabeKop-1; i++){
			taula[i]=new Stack<Bloke>();
		}
	}
	
	public void hasieratu(){
		Random random = new Random();
		for (int i=0; i<=6; i++){
			for (int j=0;j<=2;j++){
				taula[i].push(new Bloke(5,random.nextInt(2)-1));
				
			}
		
		}	
	}
	
	public void hasieratuEskuz(){
		taula[0].push(new Bloke(5,3));
		taula[0].push(new Bloke(5,3));
		taula[0].push(new Bloke(5,3));
		
		taula[1].push(new Bloke(5,3));
		taula[1].push(new Bloke(5,-1));
		taula[1].push(new Bloke(5,3));
		
		taula[2].push(new Bloke(5,3));
		taula[2].push(new Bloke(5,3));
		taula[2].push(new Bloke(5,3));
		
		taula[3].push(new Bloke(5,-3));
		taula[3].push(new Bloke(5,0));
		taula[3].push(new Bloke(5,2));
		
		taula[4].push(new Bloke(5,3));
		taula[4].push(new Bloke(5,3));
		taula[4].push(new Bloke(5,-3));
		
		taula[5].push(new Bloke(5,3));
		taula[5].push(new Bloke(5,-2));
		taula[5].push(new Bloke(5,-3));
		
		taula[6].push(new Bloke(5,3));
		taula[6].push(new Bloke(5,3));
		taula[6].push(new Bloke(5,3));
	}
	
	public int jokatu(){
		int zut=3;
		int punt=0;
		Stack<Bloke> unekoZut=taula[zut];
		boolean zutabetikKanpo = false;
		boolean zutHutsa = false;
		Bloke unekoBlokea=null;
		while (!zutabetikKanpo && !zutHutsa){
			unekoZut=taula[zut];
			if (!unekoZut.isEmpty()){
				
				unekoBlokea=unekoZut.pop();
			}
			if (unekoZut.isEmpty()){ zutHutsa=true; }
			
			if((zut+unekoBlokea.jauzia)>6 || (zut+unekoBlokea.jauzia)<0){
				zutabetikKanpo=true;
				punt=-1;
			}
		//	else if (unekoZut==null) { zutHutsa=true; }
			else {
				punt=punt+unekoBlokea.puntuak;
				zut=zut+unekoBlokea.jauzia;
			}
			
		}
		
		return punt;
	}
}
//
//random.nextInt(6)-3,5