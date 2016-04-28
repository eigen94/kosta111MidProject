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
import kosta.action.CheckDelete;
import kosta.action.CheckDetail;
import kosta.action.CheckListList;
import kosta.action.CheckUpdate;
import kosta.action.DataUpdate;
import kosta.action.DateCreate;
import kosta.action.DateXY;
import kosta.action.Detailview;
import kosta.action.NoteDetailAction;
import kosta.action.NoteInsertAction;
import kosta.action.NoteListAction;
import kosta.action.ProjectCreateAction;
import kosta.action.ProjectDeleteAction;
import kosta.action.ProjectListAction;
import kosta.action.ProjectSelectAction;
import kosta.action.ProjectUpdateAction;
import kosta.action.SearchIdAction;
import kosta.action.UmlInsertAction;
import kosta.action.UmlListAction;
import kosta.action.UseCaseInsertAction;
import kosta.action.UseCaseListAction;
import kosta.action.UsecaseDiagramListAction;
import kosta.action.UsecaseDiagramtAction;
//import kosta.useCaseAction.UseCaseListAction;
//import kosta.useCaseAction.UseCasePrintAction;
import kosta.action.memberLoginOk;
import kosta.action.memberLogoutOk;
import kosta.action.memberNameOrEmailSearch;
import kosta.action.memberRegister;
import kosta.action.messengerInsert;
import kosta.action.projectDetailAction;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();
	}

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String tmp = requestURI.substring(contextPath.length() + 1);
		String command = tmp.substring(tmp.indexOf("/") + 1);

		Action action = null;
		ActionForward forward = null;

		if (command.equals("insert.do")) {
			action = new ProjectCreateAction();
			forward = action.execute(request, response);
		} else if (command.equals("projectList.do")) {
			action = new ProjectListAction();
			forward = action.execute(request, response);
		} else if (command.equals("projectDetail.do")) {
			action = new projectDetailAction();
			forward = action.execute(request, response);
		} else if (command.equals("projectSelect.do")) {
			action = new ProjectSelectAction();
			forward = action.execute(request, response);
		} else if (command.equals("projectUpdate.do")) {
			action = new ProjectUpdateAction();
			forward = action.execute(request, response);
		} else if (command.equals("delete.do")) {
			action = new ProjectDeleteAction();
			forward = action.execute(request, response);
		} else if (command.equals("CheckCreate.do")) {
			action = new CheckCreate();
			forward = action.execute(request, response);
		} else if (command.equals("check.do")) {
			action = new CheckDetail();
			forward = action.execute(request, response);
		} else if (command.equals("checkListList.do")) {
			action = new CheckListList();
			forward = action.execute(request, response);
		} else if (command.equals("checkDelete.do")) {
			action = new CheckDelete();
			forward = action.execute(request, response);
		} else if (command.equals("checkListUpdate.do")) {
			action = new CheckUpdate();
			forward = action.execute(request, response);
		} else if (command.equals("data.do")) {
			action = new DateCreate();
			forward = action.execute(request, response);
		} else if (command.equals("checkDetail.do")) {
			action = new Detailview();
			forward = action.execute(request, response);
		} else if (command.equals("dataLink.do")) {
			action = new DataUpdate();
			forward = action.execute(request, response);
		} else if (command.equals("dataXY.do")) {
			action = new DateXY();
			forward = action.execute(request, response);
		} else if (command.equals("uml.do")) {
			action = new UmlInsertAction();
			forward = action.execute(request, response);
		} else if (command.equals("umlList.do")) {
			action = new UmlListAction();
			forward = action.execute(request, response);
		} else if (command.equals("loginOk.do")) {
			action = new memberLoginOk();
			forward = action.execute(request, response);
		} else if (command.equals("logoutOk.do")) {
			action = new memberLogoutOk();
			forward = action.execute(request, response);
		} else if (command.equals("registerOk.do")) {
			action = new memberRegister();
			forward = action.execute(request, response);
		} else if (command.equals("usecaseDiagram.do")) {
			action = new UsecaseDiagramtAction();
			forward = action.execute(request, response);
		} else if (command.equals("usecaseDiagramList.do")) {
			action = new UsecaseDiagramListAction();
			forward = action.execute(request, response);
		} else if (command.equals("memberNameOrEmailSearch.do")) {
			action = new memberNameOrEmailSearch();
			forward = action.execute(request, response);
		} else if (command.equals("useCaseInsert.do")) {
			action = new UseCaseInsertAction();
			forward = action.execute(request, response);
		} else if (command.equals("useCaseList.do")) {
			action = new UseCaseListAction();
			forward = action.execute(request, response);
		} else if (command.equals("noteInsert.do")) {
			action = new NoteInsertAction();
			forward = action.execute(request, response);
		}  else if (command.equals("searchId.do")) {
			action = new SearchIdAction();
			forward = action.execute(request, response);
		} else if (command.equals("noteList.do")) {
			action = new NoteListAction();
			forward = action.execute(request, response);
		} else if (command.equals("noteDetail.do")) {
			action = new NoteDetailAction();
			forward = action.execute(request, response);
		} else if (command.equals("messengerInsert.do")){
			action = new messengerInsert();
			forward = action.execute(request, response);
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				// System.out.println(forward.getPath());
				response.sendRedirect(forward.getPath());
			}

			else {
				// System.out.println("forward: " +forward.getPath());
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
