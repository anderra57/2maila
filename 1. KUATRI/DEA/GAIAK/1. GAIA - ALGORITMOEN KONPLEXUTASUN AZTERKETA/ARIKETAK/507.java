import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Scanner;


public class Main { // UVA 507 maximal sum
    static Scanner in;
    static PrintWriter out;


    public void run(){
        int nTest = in.nextInt();
        for (int i = 1; i <= nTest; i++) {
        	int s = in.nextInt();
        	
            int[] a = new int[s - 1];
            for (int j = 0; j < (s - 1); j++)
            	a[j] = in.nextInt();

        	this.run(i, a);
        }
    }
    
	private void run(int route, int[] a){
		// Pre: a.length >= 1
		
		//TO DO


	}
	
	
	
    public static void main(String[] args) throws Exception {
        in = new Scanner(System.in);
        new Main().run();
        in.close();
    }

}