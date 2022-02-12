package entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name="user_bib")
public class User implements Serializable {

    @Id
    @GeneratedValue
    private int uID;
    private String nume;
    private String prenume;
    private String user_name;
    private String parola;
    private boolean isAdmin;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
    private Collection<Carte> carti = new ArrayList<>();

    public User() {}

    public User(int uID, String nume, String prenume, String user_name, String parola, boolean isAdmin) {
        this.uID = uID;
        this.nume = nume;
        this.prenume = prenume;
        this.user_name = user_name;
        this.parola = parola;
        this.isAdmin = isAdmin;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getParola() {
        return parola;
    }

    public void setParola(String parola) {
        this.parola = parola;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public Collection<Carte> getCarti() {
        return carti;
    }

    public void setCarti(Collection<Carte> carti) {
        this.carti = carti;
    }

    @Override
    public String toString() {
        return "User{" +
                "uID=" + uID +
                ", nume='" + nume + '\'' +
                ", prenume='" + prenume + '\'' +
                ", user_name='" + user_name + '\'' +
                ", parola='" + parola + '\'' +
                ", isAdmin=" + isAdmin +
                ", carti=" + carti +
                '}';
    }
}
