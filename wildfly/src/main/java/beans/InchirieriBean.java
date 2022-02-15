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
import java.util.List;

@Stateless
@Remote(IInchirieri.class)
public class InchirieriBean implements IInchirieri {

    @PersistenceContext(unitName = "ejb")
    private EntityManager entityManager;

    @Override
    public Inchirieri rent(User user, Carte carte) {
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());

        if (getInchirieriNr(user) > 4) {
            return null;
        }
        if (getInchiriere(user, carte) != null) {
            return null;
        }
        Inchirieri inchiriere = new Inchirieri(formatter.format(date), "", user, carte);
        entityManager.persist(inchiriere);
        return inchiriere;
    }

    @Override
    public Long getInchirieriNr(User user) {
        TypedQuery<Long> query = entityManager.createQuery("select count(inc) from Inchirieri inc " +
                "where inc.user=" + user.getuID() + " and inc.dateReturned=''", Long.class);
        return query.getSingleResult();
    }

    @Override
    public Inchirieri getInchiriere(User user, Carte carte) {
        TypedQuery<Inchirieri> query = entityManager.createQuery("select inc from Inchirieri inc " +
                "where inc.user=" + user.getuID() + " and inc.carte=" + carte.getcID() + "" +
                " and inc.dateReturned=''", Inchirieri.class);
        List<Inchirieri> incList = query.getResultList();
        if (incList.isEmpty()) {
            return null;
        }
        return incList.get(0);
    }

    @Override
    public List<Inchirieri> getInchirieri(User user) {
        TypedQuery<Inchirieri> query = entityManager.createQuery("select inc from Inchirieri inc " +
                "where inc.user=" + user.getuID(), Inchirieri.class);
        return query.getResultList();
    }

    @Override
    public void removeInchirieri(Carte carte) {
        entityManager.createQuery("delete from Inchirieri inc where inc.carte = " + carte.getcID()).executeUpdate();
    }

    @Override
    public Inchirieri returnC(User user, Carte carte) {
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());

        TypedQuery<Inchirieri> query = entityManager.createQuery("select inc from Inchirieri inc " +
                "where inc.user=" + user.getuID() +
                " and inc.carte=" + carte.getcID() +
                " and inc.dateReturned=''", Inchirieri.class);
        Inchirieri result = query.getSingleResult();

        entityManager.createQuery("update Inchirieri inc set inc.dateReturned='" + formatter.format(date) +
                "' where inc.rID=" + result.getrID()).executeUpdate();
        return result;
    }
}
