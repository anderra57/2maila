package GrafoJuego;

public class Casilla {
    String color; // “blanco” o “negro”
    Integer    valor;
    
    public Casilla(String pColor, Integer pValor){
    	color = pColor;
    	valor = pValor;
    }
    
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((valor == null) ? 0 : valor.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Casilla other = (Casilla) obj;
		if (valor == null) {
			if (other.valor != null)
				return false;
		} else if (!valor.equals(other.valor))
			return false;
		return true;
	}
	
	public String toString() {
		return color + "-" + valor.toString();
	}
}
