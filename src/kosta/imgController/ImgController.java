package kosta.imgController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imageAction.ImgAction;
import kosta.imageAction.ImgActionForward;
import kosta.imageAction.ImgDeleteAction;
import kosta.imageAction.ImgFileAction;
import kosta.imageAction.ImgListAction;
import kosta.imageAction.ImgModifyAction;


@WebServlet("*.img")
public class ImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ImgController() {
		super();
	}

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String tmp = requestURI.substring(contextPath.length() + 1);
		String command = tmp.substring(tmp.indexOf("/") + 1);

		ImgAction action = null;
		ImgActionForward forward = null;

		if (command.equals("insertFile.img")) {
			action = new ImgFileAction();
			forward = action.execute(request, response);
		}else if(command.equals("imgListBoard.img")){
			action = new ImgListAction();
			forward = action.execute(request, response);
		}else if(command.equals("delete.img")){
			action = new ImgDeleteAction();
			forward = action.execute(request, response);
		}else if(command.equals("modify.img")){
			action = new ImgModifyAction();
			forward = action.execute(request, response);
		}
		

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}

			else {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
