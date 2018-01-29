package controller;

import java.io.IOException;
//import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Amministratore;
import persistence.DatabaseManager;
import persistence.dao.AmministratoreDao;

@SuppressWarnings("serial")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//disconnessione
		if((request.getParameter("logout") != null) && (request.getParameter("logout").equals("true"))) {
			session.setAttribute("username", null);
			request.setAttribute("loggato", false);		
			RequestDispatcher dispacher = request.getRequestDispatcher("home.jsp");
			dispacher.forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		HttpSession session = req.getSession();
		session.setAttribute("username", null);
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		AmministratoreDao dao = DatabaseManager.getInstance().getDaoFactory().getAmministratoreDao();
		Amministratore amministratore = dao.findByPrimaryKey(username);
		 
		if(amministratore == null) {

			req.setAttribute("popUp", true);
			req.setAttribute("popUpMessage", "Nessun utente registrato come "+ username);			
			RequestDispatcher dispacher = req.getRequestDispatcher("home.jsp");
			dispacher.forward(req, resp);
					 
		} else { 

			//connessione
			if(password.equals(amministratore.getPassword())) {
				
				session.setAttribute("username", username);				
				req.setAttribute("loggato", true);
				req.setAttribute("username", username);//JSTL
				RequestDispatcher dispacher = req.getRequestDispatcher("home.jsp");
				dispacher.forward(req, resp);
								
			} else {
				
				req.setAttribute("popUp", true);
				req.setAttribute("popUpMessage", "Spiacente, password non corrispondente per "+username);			
				RequestDispatcher dispacher = req.getRequestDispatcher("home.jsp");
				dispacher.forward(req, resp);
				
			}				
		}
	}
}