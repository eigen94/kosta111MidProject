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
import kosta.action.CheckCreate;
import kosta.action.CheckDetail;
import kosta.action.CheckDelete;
import kosta.action.CheckUpdate;
import kosta.action.ProjectDeleteAction;
import kosta.action.ProjectListAction;
import kosta.action.ProjectCreateAction;
import kosta.action.ProjectSelectAction;
import kosta.action.ProjectUpdateAction;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
    public Controller() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String tmp = requestURI.substring(contextPath.length()+1);
    	String command = tmp.substring(tmp.indexOf("/")+1);
    	    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(command.equals("insert.do"))
    	{   		
    		action = new ProjectCreateAction();
    		forward = action.execute(request, response);
    	}
    	
    	else if(command.equals("projectList.do"))
    	{    		
    		action = new ProjectListAction();
    		forward = action.execute(request, response);
    	}

    	else if(command.equals("projectSelect.do"))
    	{    		
    		action = new ProjectSelectAction();
    		forward = action.execute(request, response);
    	}
    	
    	else if(command.equals("projectUpdate.do"))
    	{
    		action = new ProjectUpdateAction();
    		forward = action.execute(request, response);
    	}
    	
    	else if(command.equals("delete.do"))
    	{
    		action = new ProjectDeleteAction();
    		forward = action.execute(request, response);
    	}else if(command.equals("projectDetail.do")){
    		action = new CheckCreate();
       		forward = action.execute(request, response);
    	}else if(command.equals("check.do")){
    		action = new CheckDetail();
    		forward = action.execute(request, response);
    	}else if(command.equals("checkDelete.do"))
    	{
    		action = new CheckDelete();
    		forward = action.execute(request, response);
    	}else if(command.equals("checkListUpdate.do"))
    	{
    		action = new CheckUpdate();
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
