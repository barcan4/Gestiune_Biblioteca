package beans;

import entities.Carte;
import entities.User;
import interfaces.IUser;
import javax.persistence.PersistenceContext;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

@Stateless
@Remote(IUser.class)
public class UserBean implements IUser {

    @PersistenceContext(unitName = "ejb")
    private EntityManager entityManager;

    @Override
    public User logIn(String user_name, String parola) {
        TypedQuery<User> query = entityManager.createQuery("select u from User u where u.user_name='" + user_name
                + "' and u.parola='" + parola
                + "'", User.class);
        return query.getSingleResult();
    }

    @Override
    public User add(User user) {
        entityManager.persist(user);
        return user;
    }

    @Override
    public List<User> getUsers() {
        TypedQuery<User> query = entityManager.createQuery("select u from User u", User.class);
        return query.getResultList();
    }

    @Override
    public User find(int uID) {
        return entityManager.find(User.class, uID);
    }

    @Override
    public User delete(int uID) {
        User u = find(uID);
        entityManager.createQuery("delete from User u where u.uID=" + uID).executeUpdate();
        return u;
    }

    @Override
    public User edit(User nouUser) {
        User vechiUser = find(nouUser.getuID());
        if (vechiUser != null) {
            entityManager.createQuery("update User u set u.nume='" + nouUser.getNume() +
                    "' , u.prenume='"+ nouUser.getPrenume() +
                    "' , u.user_name='" + nouUser.getUser_name() +
                    "' , u.parola='" + nouUser.getParola() +
                    "' , u.isAdmin='" + nouUser.isAdmin() + "'");
        }

        return vechiUser;
    }
}
