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
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_name = req.getParameter("user_name");
        String parola = req.getParameter("parola");
        if (user_name != null && parola != null) {
            User user_logged = user.logIn(user_name, parola);
            if (user_logged != null) {
                req.getSession().setAttribute("user_logged", user_logged);
                resp.sendRedirect(req.getContextPath() + "/dispatcher");
            }
        }
        doGet(req, resp);
    }
}
