package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

public class messengerInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		Service service = Service.getInstance();
		int re = 0;
//		re = service.messengerInsert()
		return null;
	}

}
