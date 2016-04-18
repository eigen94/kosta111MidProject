package kosta.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.action.Action;
import kosta.action.ActionForward;
import kosta.action.insertAction;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
    public Controller() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length()+1);
    	System.out.println(command);
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(command.equals("board/insert.do"))
    	{    		
    		System.out.println("인서트 두 ");
    		action = new insertAction();
    		forward = action.execute(request, response);
    	}
    	
    	if(forward != null)
    	{
    		if(forward.isRedirect())
    		{
    			response.sendRedirect(forward.getPath());
    		}
    		
    		else
    		{
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
    	
    }
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
