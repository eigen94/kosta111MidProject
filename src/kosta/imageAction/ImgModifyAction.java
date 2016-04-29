package kosta.imageAction;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imgModel.Image;
import kosta.imgService.ImageService;

public class ImgModifyAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//var url = 'modify.img?check_id='+check_id+'&&content='+content+'&&imgSrc='+imgSrc;
		
		int check_id = Integer.parseInt(request.getParameter("check_id"));
		String check_content = request.getParameter("content");
		String check_urlId = request.getParameter("imgSrc");
		String content = check_urlId + "," + check_content;
		Image img = new Image();
		img.setImgCheck_id(check_id);
		img.setImgCheck_content(content);
		
		ImageService service = new ImageService();
		service.imgModify(img);
		
		ImgActionForward forward = new ImgActionForward();
		forward.setRedirect(false);
		forward.setPath("imgListBoard.img");
		
		return forward;
	}

}
