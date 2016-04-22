package kosta.imageAction;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.action.ActionForward;
import kosta.imgModel.Image;
import kosta.imgService.ImageService;
import kosta.service.Service;

public class ImgCrateAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ImgActionForward forward = new ImgActionForward();
		
		String json = request.getParameter("json");
		System.out.println(json);
		
		ImageService service = ImageService.getInstance();
		
		String str = json;
		
		service.imgInsertService(str);
		
		forward.setRedirect(false);
		forward.setPath("imgListBoard.img");
		
		return forward;
	}

}
