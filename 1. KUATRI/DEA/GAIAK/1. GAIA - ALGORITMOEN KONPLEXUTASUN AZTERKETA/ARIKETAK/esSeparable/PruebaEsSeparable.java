package packEsSeparable;
import packSortAndSearch.ArrayCreator;

public class PruebaEsSeparable {

	    public static double timeTrial(int N) {
	    	  Integer[] a = ArrayCreator.createArray(N);

	        Stopwatch timer = new Stopwatch();
	        Separable sepa = new Separable();
	        sepa.esSeparable1(a);
	        return timer.elapsedTime();
	    }

	    public static void main(String[] args) { 
	        for (int N = 250; true; N += N) {
	            double time = timeTrial(N);
	            System.out.printf("%7d %5.3f\n", N, time);
	        } 
	    } 
	}
