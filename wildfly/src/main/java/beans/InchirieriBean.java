package beans;

import entities.Carte;
import entities.Inchirieri;
import entities.User;
import interfaces.IInchirieri;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.text.SimpleDateFormat;
import java.util.Date;

@Stateless
@Remote(IInchirieri.class)
public class InchirieriBean implements IInchirieri {

    @PersistenceContext(unitName = "ejb")
    private EntityManager entityManager;

    @Override
    public Inchirieri rent(User user, Carte carte) {
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());

        Inchirieri inchiriere = new Inchirieri(formatter.format(date), "", user, carte);
        entityManager.persist(inchiriere);
        return inchiriere;
    }

    @Override
    public Inchirieri returnC(User user, Carte carte) {
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());

        TypedQuery<Inchirieri> query = entityManager.createQuery("select inc from Inchirieri inc where inc.user=" + user.getuID() + " and inc.carte=" + carte.getcID(), Inchirieri.class);
        Inchirieri result = query.getSingleResult();

        entityManager.createQuery("update Inchirieri inc set inc.dateReturned='" + formatter.format(date) +
                "' where inc.rID=" + result.getrID()).executeUpdate();
        return result;
    }
}
