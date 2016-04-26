package kosta.imageAction;

import java.io.Console;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imgService.ImageService;

public class ImgFileAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ImgActionForward forward = new ImgActionForward();
		
		String fileJson = request.getParameter("jsonUpload");
		System.out.println(fileJson);
		
		ImageService service = ImageService.getInstance();
		
		forward.setRedirect(false);
		
		return forward;
	}
}
