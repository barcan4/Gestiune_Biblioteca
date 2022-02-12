package interfaces;

import entities.Carte;
import entities.User;

import java.util.List;

public interface IUser {
    User add(User user);
    List<User> getUsers();
    User find(int uID);
    User delete(int uID);
    User edit(User nouUser);
    Carte rent(int cID);
}
