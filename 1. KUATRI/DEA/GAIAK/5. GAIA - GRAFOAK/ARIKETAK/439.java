
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;



public class Main {
    static Scanner in;
    int ROWS = 8;
    int COLUMNS = 8;

	
    public void run() {
        while (in.hasNext()){
        	String s = in.nextLine();
        	String[] line = s.split(" ");
        	int result = moves(convertFromString(line[0]), convertFromString(line[1]));
        	System.out.println("To get from " + line[0] + " to " + line[1] + " takes " + result + " knight moves.");
        }
    }
    
	private int moves(Cell c1, Cell c2) { 
		Cell inicio = c1;
		Cell fin = c2;

		// COMPLETAR CÓDIGO





	
		return movs[fin.x][fin.y];
	}
    
	private void procesarCoordenada(int x, int y, Queue<Cell> porExaminar, Cell actual, boolean[][] visitadas, int[][] movs){
		Cell nueva;
		if ((x >= 0) && (x < ROWS) && (y >= 0) && (y < COLUMNS) && (!visitadas[x][y])) {
			nueva = new Cell(x, y);
			porExaminar.add(nueva);
			visitadas[x][y] = true;
			movs[x][y] = movs[actual.x][actual.y] + 1;
		}
	}
	
	
	
	
    private Cell convertFromString(String s){ // For example: "b5" --> (1, 4)
    	Character c1 = s.charAt(0); 
    	int row = ((int) c1) - ((int) 'a');

    	Character c2 = s.charAt(1); 
    	int col = Integer.parseUnsignedInt(c2.toString()) - 1;
    	
    	return new Cell(row, col);
    }
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        in = new Scanner(System.in);
        new Main().run();
        in.close();
        // Example input:
//        e2 e4
//        a1 b2
//        b2 c3
//        a1 h8
//        a1 h7
//        h8 a1
//        b1 c3
//        f6 f6

	}

	
	private class Cell {
		int x;
		int y;
		
		public Cell(int px, int py){
			x = px;
			y = py;
		}
		

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Cell other = (Cell) obj;
			if (x != other.x)
				return false;
			if (y != other.y)
				return false;
			return true;
		}

		public void print(){
			System.out.println(x + " " + y);
		}


		
	}
}
