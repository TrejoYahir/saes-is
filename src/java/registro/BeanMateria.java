package registro;

/**
 *
 * @author Diego EG
 */
public class BeanMateria {
    private String id;
    private String nombre;
    private float creditos;
    private int nivel;
    private int cupo;
    private int area;
    private String serializacion;

    public String getSerializacion() {
        return serializacion;
    }

    public void setSerializacion(String serializacion) {
        this.serializacion = serializacion;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getCreditos() {
        return creditos;
    }

    public void setCreditos(float creditos) {
        this.creditos = creditos;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getCupo() {
        return cupo;
    }

    public void setCupo(int cupo) {
        this.cupo = cupo;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public BeanMateria(String id, String nombre, float creditos, int nivel, int cupo, int area, String serializacion) {
        this.id = id;
        this.nombre = nombre;
        this.creditos = creditos;
        this.nivel = nivel;
        this.cupo = cupo;
        this.area = area;
        this.serializacion = serializacion;
    }
    
    
}
