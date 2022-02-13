package interfaces;

import entities.Carte;
import entities.Inchirieri;
import entities.User;

public interface IInchirieri {
    Inchirieri rent(User user, Carte carte);
    Inchirieri returnC(User user, Carte carte);
}
