package lab4Konexioa;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class JokoaSortu {
	private BufferedReader br;
	private Connection konexioa;

	public JokoaSortu() {
		
	}
	
	private void jokatu() throws NumberFormatException, IOException, SQLException{
		konektatu();
		br = new BufferedReader(new InputStreamReader(System.in));
		menuaErakutsi();
	}
	
	private void konektatu(){
		try {
		//Class.forName("com.mysql.jdbc.Driver"); //deprecated
		Class.forName("com.mysql.cj.jdbc.Driver");

		String zerbitzaria = "jdbc:mysql://localhost:3306/jokoa";
		String erabiltzailea = "root";
		String pasahitza = "";
		konexioa = DriverManager.getConnection(zerbitzaria, erabiltzailea, pasahitza);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	private void menuaErakutsi() throws NumberFormatException, IOException, SQLException{
		int aukera = -1;
		while(aukera!=9){
			System.out.println("Menua");
			System.out.println("1.- Jokalari berria sartu");
			System.out.println("2.- Partida berria sartu");
			System.out.println("3.- Jokalari guztiak erakutsi");
			System.out.println("4.- Jokalariak abizenez bilatu (SQL Injection)");
			System.out.println("5.- Jokalariak abizenez bilatu (Zuzenduta)");
			System.out.println("9.- Irten");
			aukera=Integer.parseInt(br.readLine());
			if(aukera==1) jokalariBerria();
			else if(aukera==2) partidaBerria();
			else if(aukera==3) jokalariGuztiak();
			else if(aukera==4) sqlinjection();
			else if(aukera==5) sqlinjection2();
		}
		konexioa.close();
	}
	
	private void jokalariBerria() throws NumberFormatException, IOException, SQLException{
			Statement st =konexioa.createStatement();
			System.out.println("Sartu NAN zenbakia:");
			int nan=Integer.parseInt(br.readLine());
			System.out.println("Sartu izena");
			String izena = br.readLine();			
			System.out.println("Sartu abizena");
			String abizena = br.readLine();
			String query="insert into jokalari values("+nan+",'"+izena+"','"+abizena+"')";
			st.executeUpdate(query);

		
		
	}
	
	private void partidaBerria() throws SQLException, NumberFormatException, IOException{
		Statement st =konexioa.createStatement();
		System.out.println("Sartu kodea:");
		int kode=Integer.parseInt(br.readLine());
		System.out.println("Sartu iraupena");
		int iraupena = Integer.parseInt(br.readLine());
		System.out.println("Sartu jok puntuak");
		int puntuakj = Integer.parseInt(br.readLine());	
		System.out.println("Sartu ord puntuak");
		int puntuako = Integer.parseInt(br.readLine());
		System.out.println("Sartu jokalaria");
		int nan = Integer.parseInt(br.readLine());
		java.sql.Date data = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		String query="insert into partida values("+kode+",'"+data+"',"+iraupena+","+puntuakj+","+puntuako+","+nan+")";
		System.out.println(query);
		st.executeUpdate(query);
		
	}
	
	private void jokalariGuztiak() throws SQLException{
		Statement st =konexioa.createStatement();
		ResultSet rs=st.executeQuery("select izena from jokalari");
		while(rs.next()){
			System.out.println(rs.getString("izena"));
		}
		
	}
	
	private void sqlinjection() throws SQLException, IOException{
		Statement st = konexioa.createStatement();
		System.out.println("Sartu abizena");
		String abizena = br.readLine();
		ResultSet rs=st.executeQuery("select izena,abizena from jokalari where abizena='"+abizena+"'");
		while(rs.next()){
			System.out.println(rs.getString("izena")+" "+rs.getString("abizena"));
		}				
	}
	
	private void sqlinjection2() throws SQLException, IOException{		
		String query = "select izena,abizena from jokalari where abizena=?";
		PreparedStatement st = konexioa.prepareStatement(query);
		System.out.println("Sartu abizena");
		String abizena = br.readLine();
		st.setString(1, abizena);
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			System.out.println(rs.getString("izena")+" "+rs.getString("abizena"));
		}				
	}
	

	public static void main(String[] args) throws NumberFormatException, IOException, SQLException {
	  JokoaSortu js = new JokoaSortu();
	  js.jokatu();

	}

}
