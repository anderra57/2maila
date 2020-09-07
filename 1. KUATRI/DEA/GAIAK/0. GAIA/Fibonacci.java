package Fibonacci;

import java.math.BigInteger;

import packEsSeparable.Stopwatch;

public class Fibonacci {


	public Integer fib(int n){
		if ((n == 0) || (n == 1)) { return 1;}
		else return fib(n-1) + fib(n-2);
	}
	
	public Integer fib2(int n){
		int res = 0;

                // COMPLETAR

		return res;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stopwatch clock;

		for (int i = 10; i <= 1000000; i = i + 1){
			clock = new Stopwatch();
			System.out.println("Fib(" + i + ") = " + new Fibonacci().fib2(i).toString());
			System.out.println("tiempo de fib(" + i + ") es " + clock.elapsedTime());
		}
	}

}
