package clients;

import entities.Carte;
import entities.User;
import interfaces.ICarti;
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Carte> carteList = carti.getCarti();
        req.getSession().setAttribute("carteList", carteList);
        resp.sendRedirect(req.getContextPath() + "/carti.jsp");
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
//        super.doPost(req, resp);
    }


}
