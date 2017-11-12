package clases;

/**
 *
 * @author Rogelio
 */
public class NodoInscripcion {
    private String boleta;
    private Float promedio;

    public NodoInscripcion() {
    }

    
    public NodoInscripcion(String boleta, Float promedio) {
        this.boleta = boleta;
        this.promedio = promedio;
    }

    public String getBoleta() {
        return boleta;
    }

    public Float getPromedio() {
        return promedio;
    }

    public void setBoleta(String boleta) {
        this.boleta = boleta;
    }

    public void setPromedio(Float promedio) {
        this.promedio = promedio;
    }
    
    
    
    
}
