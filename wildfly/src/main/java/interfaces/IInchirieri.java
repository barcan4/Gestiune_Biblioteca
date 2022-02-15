package interfaces;

import entities.Carte;
import entities.Inchirieri;
import entities.User;

import java.util.List;

public interface IInchirieri {
    Inchirieri rent(User user, Carte carte);
    Long getInchirieriNr(User user);
    Inchirieri getInchiriere(User user, Carte carte);
    List<Inchirieri> getInchirieri(User user);
    void removeInchirieri(Carte carte);
    Inchirieri returnC(User user, Carte carte);
}
