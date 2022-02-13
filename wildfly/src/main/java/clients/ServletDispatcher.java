package clients;

import entities.Carte;
import entities.User;
import interfaces.ICarti;
import interfaces.IInchirieri;
import interfaces.IUser;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/dispatcher")
public class ServletDispatcher extends HttpServlet {

    @EJB
    private ICarti carti;

    @EJB
    private IInchirieri inchirieri;

    @EJB
    private IUser useri;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Carte> carteList = carti.getCarti();
        req.getSession().setAttribute("carteList", carteList);
        //if - logged in as admin / else
//        resp.sendRedirect(req.getContextPath() + "/carti.jsp");
        resp.sendRedirect(req.getContextPath() + "/carti_user.jsp");
        //req.getRequestDispatcher(req.getContextPath() + "WEB-INF/carti.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action!=null && action.equals("update")){
            int cID = Integer.parseInt(req.getParameter("cID"));
            String titlu = req.getParameter("titlu");
            String autor = req.getParameter("autor");
            String editura = req.getParameter("editura");
            int anPub = Integer.parseInt(req.getParameter("anPub"));
            carti.edit(new Carte(cID, titlu, autor, editura, anPub));
            doGet(req, resp);
        }
        if(action!=null && action.equals("delete")){
            int cID = Integer.parseInt(req.getParameter("cID"));
            carti.delete(cID);
            doGet(req, resp);
        }

        if(action!=null && action.equals("add")){
            String titlu = req.getParameter("titlu");
            String autor = req.getParameter("autor");
            String editura = req.getParameter("editura");
            int anPub = Integer.parseInt(req.getParameter("anPub"));
            Carte c = new Carte(titlu,autor,editura,anPub);
            carti.add(c);
            doGet(req, resp);
        }

        if(action!=null && action.equals("rent")){
            int cID = Integer.parseInt(req.getParameter("cID"));
            //User user = (User) req.getSession().getAttribute("user_logged");
            //int uID = user.getUID();
            int testID = 2;
            inchirieri.rent(useri.find(testID), carti.find(cID));
            doGet(req, resp);
        }

        if(action!=null && action.equals("return")){
            int cID = Integer.parseInt(req.getParameter("cID"));
            //User user = (User) req.getSession().getAttribute("user_logged");
            //int uID = user.getUID();
            int testID = 2;
            inchirieri.returnC(useri.find(testID), carti.find(cID));
            doGet(req, resp);
        }
    }


}
