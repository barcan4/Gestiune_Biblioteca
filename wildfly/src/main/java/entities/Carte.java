package entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name="carti")
public class Carte implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cID;
    private String titlu;
    private String autor;
    private String editura;
    private int anPublicatie;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "carte")
    private Collection<User> useri = new ArrayList<>();

    public Carte() {}

    public Carte(int cID, String titlu, String autor, String editura, int anPublicatie) {
        this.cID = cID;
        this.titlu = titlu;
        this.autor = autor;
        this.editura = editura;
        this.anPublicatie = anPublicatie;
    }

    public Carte(String titlu, String autor, String editura, int anPublicatie) {
        this.titlu = titlu;
        this.autor = autor;
        this.editura = editura;
        this.anPublicatie = anPublicatie;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public String getTitlu() {
        return titlu;
    }

    public void setTitlu(String titlu) {
        this.titlu = titlu;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditura() {
        return editura;
    }

    public void setEditura(String editura) {
        this.editura = editura;
    }

    public int getAnPublicatie() {
        return anPublicatie;
    }

    public void setAnPublicatie(int anPublicatie) {
        this.anPublicatie = anPublicatie;
    }

    public Collection<User> getUseri() {
        return useri;
    }

    public void setUseri(Collection<User> useri) {
        this.useri = useri;
    }

    @Override
    public String toString() {
        return "Carte{" +
                "cID=" + cID +
                ", titlu='" + titlu + '\'' +
                ", autor='" + autor + '\'' +
                ", editura='" + editura + '\'' +
                ", anPublicatie=" + anPublicatie +
                ", useri=" + useri +
                '}';
    }
}
