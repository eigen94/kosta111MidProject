package kosta.imageAction;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imgService.ImageService;

public class ImgDeleteAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		
		ImageService service = ImageService.getInstance();
		service.imgDeleteService(check_id);
		
		ImgActionForward forward = new ImgActionForward();

		forward.setRedirect(true);
		forward.setPath("imgListBoard.img");
		
		
		return forward;
	}

}
