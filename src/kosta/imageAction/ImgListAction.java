package kosta.imageAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imgService.ImageService;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ImgListAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {

		ImageService service = ImageService.getInstance();
		List<String> list = service.listImgBoardService();

		/*
		 * for(int i=0; i<list.size(); i++){ System.out.println(list.get(i));
		 * list.get(i); }
		 */

		JSONParser parser = new JSONParser();
		JSONObject jsonObj = null;
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		for (int i = 0; i < list.size(); i++) {
			try {
				jsonObj = (JSONObject) parser.parse(list.get(i));
			} catch (Exception e) {
				e.printStackTrace();
			}
			jsonList.add(jsonObj);
		}
		
		request.setAttribute("jsonList", jsonList);
		ImgActionForward forward = new ImgActionForward();
		forward.setRedirect(false);
		forward.setPath("imgListBoard.jsp");

		return forward;
	}
}
