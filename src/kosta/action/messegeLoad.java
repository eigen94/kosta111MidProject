package kosta.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kosta.model.Messenger;
import kosta.service.Service;

public class messegeLoad implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		int msg_lastMsgId = Integer.parseInt(request.getParameter("msg_lastMsgId"));
		int msg_startIndex = Integer.parseInt(request.getParameter("msg_startIndex"));
		System.out.println("p_id : "+p_id+" lastMSGId : "+msg_lastMsgId+" startIndex : "+msg_startIndex);
		Service service = Service.getInstance();
		Messenger Messenger = new Messenger();
		
		Messenger.setMsg_projectid(p_id);
		Messenger.setMsg_lastMsgId(msg_lastMsgId);
		Messenger.setMsg_startIndex(msg_startIndex);
		List<Messenger> list = service.loadMessege(Messenger);
		
		System.out.println("list : "+list);
		List<JSONObject> sendList = new ArrayList<JSONObject>();
		for(int i=0; i<list.size(); i++){
			JSONObject jsonObj = new JSONObject();
			int sender = list.get(i).getMsg_sender();
			int msgId = list.get(i).getMsg_id();
			String content = list.get(i).getMsg_content(); 
			jsonObj.put("sender", sender);
			jsonObj.put("content", content);
			jsonObj.put("id", msgId);
			sendList.add(jsonObj);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("out.jsp");
		forward.setRedirect(false);
		request.setAttribute("out", sendList);
		System.out.println("sendList : "+sendList);
		return forward;
	}

}
