package interfaces;

import entities.Carte;
import entities.User;

import java.util.List;

public interface IUser {
    User logIn(String user_name, String parola);
    User add(User user);
    List<User> getUsers();
    User find(int uID);
    User delete(int uID);
    User edit(User nouUser);
}
