package kosta.imageAction;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kosta.imgModel.Image;
import kosta.imgService.ImageService;

public class ImgDeleteAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		System.out.println("check_id : "+check_id);
		String fname = request.getParameter("fname");
		
		ImageService service = ImageService.getInstance();
		JSONArray arr = new JSONArray();
		JSONParser parser = new JSONParser();
		String getList = service.listImgBoardService(check_id);
		if(getList.equals("")){
			
		} else {
			try {
				arr = (JSONArray)parser.parse(getList);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(arr);
		for(int i=0; i<arr.size(); i++){
			JSONObject obj = new JSONObject();
			obj = (JSONObject)arr.get(i);
			if(obj.containsValue(fname)){
				arr.remove(i);
			}
		}
		System.out.println(arr);
		
		String check_content = arr.toString();
		Image image = new Image();
		image.setImgCheck_id(check_id);
		image.setImgCheck_content(check_content);
		service.imgDeleteService(image);
		
		ImgActionForward forward = new ImgActionForward();

		forward.setRedirect(false);
		forward.setPath("");
		
		
		return forward;
	}

}
