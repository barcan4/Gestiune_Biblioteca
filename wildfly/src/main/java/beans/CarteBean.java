package beans;

import entities.Carte;
import interfaces.ICarti;
import javax.persistence.PersistenceContext;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

@Stateless
@Remote(ICarti.class)
public class CarteBean implements ICarti {

    @PersistenceContext(unitName = "ejb")
    private EntityManager entityManager;

    @Override
    public Carte add(Carte carte) {
        entityManager.persist(carte);
        return carte;
    }

    @Override
    public List<Carte> getCarti() {
        TypedQuery<Carte> query = entityManager.createQuery("select c from Carte c", Carte.class);
        return query.getResultList();
    }

    @Override
    public Carte find(int cID) {
        return entityManager.find(Carte.class, cID);
    }

    @Override
    public Carte delete(int cID) {
        Carte c = find(cID);
        entityManager.createQuery("delete from Carte c where c.cID = " + cID).executeUpdate();
        return c;
    }

    @Override
    public Carte edit(Carte nouaCarte) {
        Carte vecheCarte = find(nouaCarte.getcID());
        if (vecheCarte != null) {
            entityManager.createQuery("update Carte c set c.titlu='" + nouaCarte.getTitlu() +
                    "' , c.autor='"+ nouaCarte.getAutor() +
                    "' , c.editura='" + nouaCarte.getEditura() +
                    "' , c.anPublicatie='" + nouaCarte.getAnPublicatie() +
                    "' , c.uID='" + nouaCarte.getUser().getuID() + "'");
        }
        return vecheCarte;
    }
}
