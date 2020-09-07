package azterketa;

import java.util.Stack;

public class Main {

	public static void main(String[] args){
		//System.out.println(ebaluatu("(1+((2+3)*(4*5)))"));
	}
	
	public static double ebaluatu(String esp) {
		Stack<Double> ergai=new Stack<Double>();
		Stack<Character> op=new Stack<Character>();
		for (int i=0;i<esp.length();i++){
			char c=esp.charAt(i);
			if (c=='('){ /*ezer ez*/ }
			else if ((c=='+') || (c=='-') || (c=='*') || (c=='/')){ op.push(c); }
			else if (c==')'){
				double x2=ergai.pop();
				double x1=ergai.pop();
				char oper=op.pop();
				double em=0;
				switch(oper){
					case '+':
						em=x1+x2;
						break;
					case '-':
						em=x1-x2;
						break;
					case '*':
						em=x1*x2;
						break;
					case '/':
						em=x1/x2;
						break;
				}
				ergai.push(em);
			}
			else {ergai.push((double)((int)c-(int)'0'));}
		}
		return(ergai.pop());	
	}//ebaluatu()
	
}//Main.jaava
