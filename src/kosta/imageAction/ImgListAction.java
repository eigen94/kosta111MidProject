package kosta.imageAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

import kosta.imgModel.Image;
import kosta.imgService.ImageService;

public class ImgListAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {

		int check_id = Integer.parseInt(request.getParameter("check_id"));
		ImageService service = ImageService.getInstance();
		String check_content = service.listImgBoardService(check_id);
		
//		JSONParser parser = new JSONParser();
//		JSONArray jsonArr = new JSONArray();
//		jsonArr = (JSONArray)parser.parse(check_content);
		
//		List<String> list2 =new ArrayList<String>();
//		List<Integer> list3 = new ArrayList<Integer>();
//		for(int i=0;i<list.size();i++){
//			list2.add(list.get(i).getImgCheck_content());
//			list3.add(list.get(i).getImgCheck_id());
//		}
//		request.setAttribute("list", list2);
//		request.setAttribute("idList", list3);
		ImgActionForward forward = new ImgActionForward();
		request.setAttribute("out", check_content);
		forward.setRedirect(false);
		forward.setPath("outJsonString.jsp");

		return forward;
	}
}
