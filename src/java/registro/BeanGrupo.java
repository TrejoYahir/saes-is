package registro;

/**
 *
 * @author Diego EG
 */
public class BeanGrupo {
    private String turno;
    private int nivel;
    private int numero;

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public BeanGrupo(String turno, int nivel, int numero) {
        this.turno = turno;
        this.nivel = nivel;
        this.numero = numero;
    }
    
    
}
