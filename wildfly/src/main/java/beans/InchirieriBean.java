package beans;

import entities.Inchirieri;
import entities.User;
import interfaces.IInchirieri;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.text.SimpleDateFormat;
import java.util.Date;
public class InchirieriBean implements IInchirieri {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Inchirieri rent(int uID, int cID) {
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        System.out.println(formatter.format(date));



        entityManager.persist(new Inchirieri(formatter.format(date), ""));

        return null;
    }

    @Override
    public Inchirieri returnC(int uID, int cID) {
        return null;
    }
}
