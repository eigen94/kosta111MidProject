package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.DB;
import kosta.model.DBList;
import kosta.service.Service;

public class Detailview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("check_id"));
		
		Service service = Service.getInstance();
		
		List<DB> list = new ArrayList<DB>();
		list = service.dBList(id);
	/*	List<DB> list2 = new ArrayList<DB>();
		
		DB db = new DB();
		DBList dbl = new DBList();
		int j = 1;
		int x = 0;
		System.out.println("-------list");
		System.out.println(list);
		for(int i=0;i<list.size();i++){
			x=i+1;
			db = list.get(i);
			list2.add(db);
			if (list.size() == x) {
				x = i;
			}
			if (list.get(i).getD_id() < list.get(x).getD_id()) {
				dbl.setList(list2);
				request.setAttribute("list" + j, dbl);
				System.out.println("확인");
				System.out.println(dbl);
				j++;

			}else if(list.size()==i+1){
				dbl.setList(list2);
				request.setAttribute("list"+j, dbl);
				j++;
				System.out.println("마지막");
				System.out.println(dbl);
			}
		}*/
		request.setAttribute("list", list);	
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("data.jsp?check_id="+id);
		return forward;
	}

}
