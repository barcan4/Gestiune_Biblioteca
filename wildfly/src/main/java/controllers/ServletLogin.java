package controllers;

import entities.User;
import interfaces.IUser;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class ServletLogin extends HttpServlet {

    @EJB
    IUser user;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user_logged = (User) req.getSession().getAttribute("user_logged");
        if (user_logged != null) {
            resp.sendRedirect(req.getContextPath() + "/dispatcher");
        }

        String action = req.getParameter("action");

        if (action != null && action.equals("backLogin")) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_name = req.getParameter("user_name");
        String parola = req.getParameter("parola");

        String action = req.getParameter("action");
        if ((user_name != null && parola != null) && (!user_name.equals("") && !parola.equals(""))) {
            User user_logged = user.logIn(user_name, parola);
            if (user_logged != null) {
                req.getSession().setAttribute("user_logged", user_logged);
                req.getSession().setAttribute("user_name", user_name);
                resp.sendRedirect(req.getContextPath() + "/dispatcher");
            }
        }

        if (action != null && action.equals("logout")) {
            req.getSession().setAttribute("user_logged", null);
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }

        if (action != null && action.equals("register")) {
            resp.sendRedirect(req.getContextPath() + "/register.jsp");
        }

        if (action != null && action.equals("addUser")) {
            String nume = req.getParameter("nume");
            String prenume = req.getParameter("prenume");
            String user_nameReg = req.getParameter("user_nameReg");
            String parolaReg = req.getParameter("parolaReg");

            user.add(new User(nume, prenume, user_nameReg, parolaReg, false));
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }

        doGet(req, resp);
    }
}
