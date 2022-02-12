package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="carti")
public class Carte implements Serializable {
    @Id
    @GeneratedValue
    private int cID;
    private String titlu;
    private String autor;
    private String editura;
    private int anPublicatie;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="uID")
    private User user;

    public Carte() {}

    public Carte(int cID, String titlu, String autor, String editura, int anPublicatie) {
        this.cID = cID;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Carte{" +
                "cID=" + cID +
                ", titlu='" + titlu + '\'' +
                ", autor='" + autor + '\'' +
                ", editura='" + editura + '\'' +
                ", anPublicatie=" + anPublicatie +
                ", user=" + user +
                '}';
    }
}
