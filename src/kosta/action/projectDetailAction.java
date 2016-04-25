package kosta.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.ProjectBoard;
import kosta.model.ProjectDetail;
import kosta.service.Service;

public class projectDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Service service = Service.getInstance();

	    String tmp = request.getParameter("p_id");
	    		int p_id=0;
	    		if(tmp!=null){
	    			p_id = Integer.parseInt(tmp);
	    		}
		List<ProjectBoard> list = service.projectListService();
		ProjectBoard project = service.projectSelectService(p_id);
		List<ProjectDetail> checkList = service.detailListService(p_id);
		request.setAttribute("checkList", checkList);
		request.setAttribute("list", list);
		request.setAttribute("project", project);
		request.setAttribute("p_id", p_id);
		
		ActionForward action = new ActionForward();
		action.setPath("projectDetail.jsp?p_id="+p_id);
		action.setRedirect(false);
		
		return action;
	}

}
