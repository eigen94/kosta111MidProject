package kosta.imageAction;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imgService.ImageService;

public class ImgListAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		ImageService service = ImageService.getInstance();
		List<HashMap<String, String>> list = service.listImgBoardService();
		
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i).values());
		}
		
		request.setAttribute("list", list);
		ImgActionForward forward = new ImgActionForward();
		forward.setRedirect(false);
		forward.setPath("imgListBoard.jsp");

		return forward;
	}
}
