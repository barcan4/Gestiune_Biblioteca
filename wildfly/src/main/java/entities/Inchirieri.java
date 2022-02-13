package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "inchirieri")
public class Inchirieri implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rID;
    private String dateRent;
    private String dateReturned;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="uID")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="cID")
    private Carte carte;

    public Inchirieri() {
    }

    public Inchirieri(String dateRent, String dateReturned) {
        this.dateRent = dateRent;
        this.dateReturned = dateReturned;
    }

    public Inchirieri(String dateRent, String dateReturned, User user, Carte carte) {
        this(dateRent, dateReturned);
        this.user = user;
        this.carte = carte;
    }

    public int getrID() {
        return rID;
    }

    public void setrID(int rID) {
        this.rID = rID;
    }

    public String getDateRent() {
        return dateRent;
    }

    public void setDateRent(String dateRent) {
        this.dateRent = dateRent;
    }

    public String getDateReturned() {
        return dateReturned;
    }

    public void setDateReturned(String dateReturned) {
        this.dateReturned = dateReturned;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Carte getCarte() {
        return carte;
    }

    public void setCarte(Carte carte) {
        this.carte = carte;
    }

    @Override
    public String toString() {
        return "Inchirieri{" +
                "rID=" + rID +
                ", dateRent='" + dateRent + '\'' +
                ", dateReturned='" + dateReturned + '\'' +
                ", user=" + user +
                ", carte=" + carte +
                '}';
    }
}
