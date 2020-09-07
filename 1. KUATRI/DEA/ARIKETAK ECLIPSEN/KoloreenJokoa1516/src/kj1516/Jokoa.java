package kj1516;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;


import java.util.Random;

public class Jokoa {
	Queue<Integer>[] jokalariak;
	Stack<Integer> mahaia;
	
	@SuppressWarnings("unchecked")
	public Jokoa(){
		//taula=(Stack<Bloke>[]) new Stack[zutabeKop];
		jokalariak=(LinkedList<Integer>[]) new LinkedList[6];
		for (int i=0; i<6; i++){
			jokalariak[i]=new LinkedList<Integer>();
		}
		mahaia=new Stack<Integer>();
		
	}
	
	public ArrayList<Jokaldi> jokoaHasieratu(int fitxaKop){
		Random random = new Random();
		ArrayList<Jokaldi> jokaldiak = new ArrayList<Jokaldi>();
		for (int i=0; i<20; i++){
			int d1= random.nextInt(6)+1;
			int d2= random.nextInt(6)+1;
			jokaldiak.add(new Jokaldi(d1,d2));
		}
		
		for (int i=0; i<6; i++){
			for (int j=0; j<fitxaKop; j++){
				jokalariak[i].add(i);
			}
		}
		
		return jokaldiak;
	}
	
	public ArrayList<Jokaldi> jokoaHasieratuEskuz(){
		for (int i=0; i<6; i++){
			for (int j=0; j<6; j++){
				jokalariak[i].add(i);
			}
		}
		ArrayList<Jokaldi> jokaldiak = new ArrayList<Jokaldi>();
		jokaldiak.add(new Jokaldi(4,1));
		jokaldiak.add(new Jokaldi(4,1));
		jokaldiak.add(new Jokaldi(4,1));
		jokaldiak.add(new Jokaldi(4,1));
		jokaldiak.add(new Jokaldi(4,1));
		jokaldiak.add(new Jokaldi(4,1));
		
		
		jokaldiak.add(new Jokaldi(1,2));
		jokaldiak.add(new Jokaldi(1,5));
		jokaldiak.add(new Jokaldi(1,3));
		jokaldiak.add(new Jokaldi(1,5));
		jokaldiak.add(new Jokaldi(1,4));
		jokaldiak.add(new Jokaldi(1,4));
		return jokaldiak;
	}
	
	public int jokoa(ArrayList<Jokaldi> jokaldiak){
		boolean partidaBukatuta=false;
		int i=0;
		while(!partidaBukatuta && i<jokaldiak.size()){
			Jokaldi unekoJok = jokaldiak.get(i);
			if (unekoJok.dado1==6){ partidaBukatuta=true;}
			else{
				if(unekoJok.dado1 % 2==0){
					if(jokalariak[unekoJok.dado2-1].size()!=0){
						int fitxa=jokalariak[unekoJok.dado2-1].remove();
						mahaia.push(fitxa);
					}
				}	else{
						if(mahaia.size()!=0){
							int fitxa=mahaia.pop();
							jokalariak[unekoJok.dado2-1].add(fitxa);
						}
					}
				
				
			}
			i++;
		}
		return irabazlea();
	}
	
	public int irabazlea(){
		int irabazlea=0;
		int punt=0;
		int puntMax=0;
		int beltzKop=0;
		int beltzMax=0;
		
		for (int i=1;i<jokalariak.length;i++){
			punt=0;
			for (int j=0; j<jokalariak[i].size(); j++){
				int fitxa=jokalariak[i].remove();
				if (fitxa==1){
					beltzKop++;
					punt++;
				}
				else{
					punt=punt+fitxa;
				}
			}
			/*
			if ((beltzKop>beltzMax)||((beltzKop==beltzMax)&&(punt>puntMax))){
				irabazlea=i;
				beltzMax=beltzKop;
				puntMax=punt;
			}
			*/
			if ((beltzKop>beltzMax)){
				irabazlea=i;
				beltzMax=beltzKop;
				puntMax=punt;
			}
			
		}
		
		return irabazlea;
	}
}
