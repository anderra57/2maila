package packSortAndSearch;
import java.util.Random;

public class ArrayCreator {

    static int MAX = 1000000;

    public static Integer[] createArray(int N, int range) {
    	Random randomGenerator = new Random();
    	
    	Integer[] a = new Integer[N];
        for (int i = 0; i < N; i++) {
            a[i] = randomGenerator.nextInt(range);
        }
        return a;
    }
    
    /**
     * Returns an array of the specified size, with random positive values between 0 and MAX. 
     * When passing only one param, the MAX value is used as a default. 
     *
     * @param  N  the size of the array
     * @return      the new array of size N
     */
    public static Integer[] createArray(int N) {
        return createArray(N, MAX);
    }

}
