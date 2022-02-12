package interfaces;

import entities.Carte;

import java.util.List;

public interface ICarti {
    Carte add(Carte carte);
    List<Carte> getCarti();
    Carte find(int cID);
    Carte delete(int cID);
    Carte edit(Carte nouaCarte);
}
