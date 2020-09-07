package kj1516;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Fitxeroak {
	
	private static FileWriter fw;
	private static BufferedReader br;

	public static int[] irakurri(String pFile) throws IOException{
	
		br = new BufferedReader(new FileReader("C:\\Users\\ANDER\\Documents\\UNIBERTSITATEKO LANAK\\2. MAILA\\DEA\\SIMULAZIOAREN EMAITZAK\\"+pFile)); 
		String st;
		ArrayList<Integer> em2 = new ArrayList<Integer>();
		
		while ((st = br.readLine()) != null) 
			em2.add(Integer.parseInt(st));
		
		int[] emaitza = new int[em2.size()];
		for (int i=0;i<em2.size();i++){
			emaitza[i]=em2.get(i);
		}
		return emaitza;
		} 
	
	public static void idatzi(int[] pDatuak) throws IOException{
		
		Date objDate = new Date();
		String strDateFormat = "yyyyMMdd_HHmmss";
		SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String filename=objSDF.format(objDate);
        fw = new FileWriter("C:\\Users\\ANDER\\Documents\\UNIBERTSITATEKO LANAK\\2. MAILA\\DEA\\SIMULAZIOAREN EMAITZAK\\" + filename + ".txt");
		for (int i=0;i<pDatuak.length;i++){
			fw.write(Integer.toString(pDatuak[i])+"\n");
		}
		fw.flush();
	}
		
	
}
