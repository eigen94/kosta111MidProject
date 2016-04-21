package kosta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.service.Service;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

public class UmlInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {			
		
		ActionForward forward = new ActionForward();
				
		String json = request.getParameter("json");
		System.out.println(json);
		
		Service service = Service.getInstance();
				
		service.umlInsertService(json);
		
		/*JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
		try {
			jsonObj = (JSONObject)parser.parse(json);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		System.out.println(jsonObj.get("name"));
		System.out.println(jsonObj.get("attribute"));
		System.out.println(jsonObj.get("operation"));*/
		
		
		
		return null;
	}

}
