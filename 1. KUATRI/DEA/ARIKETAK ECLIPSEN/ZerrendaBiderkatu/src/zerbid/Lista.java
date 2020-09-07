package zerbid;

public class Lista<T> {
	Node<T> last;
	
	public Lista(){
		
	}
	
	public void inprimatu(){
		Node<T> unekoa = last.next;
		boolean listaOsoa=false;
		while(!listaOsoa){
			if(unekoa==last){listaOsoa=true;}
			System.out.println(unekoa.data);
			unekoa=unekoa.next;
		}
	}
	
	public void gehitu(String s){
		Node<T> gehitu = new Node<T>(s);
		if (last==null) {last=gehitu;
		last.next=gehitu;}
		else{
			gehitu.next=last.next;
			last.next=gehitu;
		}
	}
	
	public void biderkatu(int n){
		if ((last==null) || (n==1)){	}
		else {
			Node<T> unekoa = last.next;
			Node<T> kopia = null;
			boolean listaOsoa=false;
			while(!listaOsoa){
				if(unekoa.data.equals(last.data)){listaOsoa=true;}
				for(int i=0;i<(n-1);i++){
					kopia = new Node<T>(unekoa.data);
					kopia.next=unekoa.next;
					unekoa.next=kopia;
					unekoa=unekoa.next;
				}
				unekoa=unekoa.next;
			}
			last=kopia;
		}
	}
}
