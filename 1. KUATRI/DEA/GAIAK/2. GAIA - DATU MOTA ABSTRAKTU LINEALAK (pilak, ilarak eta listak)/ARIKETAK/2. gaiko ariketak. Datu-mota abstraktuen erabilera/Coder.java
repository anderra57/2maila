import java.util.ArrayDeque;

public class Coder
{
  /**
   * Encode and decode a message using a key of values stored in
   * a queue.
   */
	
    int[] key = {5, 12, -3, 8, -9, 4, 10};

public String code(String s){
    ArrayDeque<Integer> keyQueue = new ArrayDeque<Integer>();

















}

public String decode(String s){








}

  public static void main( String[] args)
  { 
    String message = "All programmers are playwrights and all " +
                     "computers are lousy actors.";
    Coder coder = new Coder();

    String encodedMesage = coder.code(message);
    System.out.println("Encoded Message:\n" + encodedMesage + "\n");
    
    String decodedMesage = coder.decode(encodedMesage);
    System.out.println ("Decoded Message:\n" + decodedMesage);
  }
}
