package kosta.imageAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imgModel.Image;
import kosta.imgService.ImageService;

public class ImgListAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) {

		ImageService service = ImageService.getInstance();
		List<Image> list = service.listImgBoardService();
		List<String> list2 =new ArrayList<String>();
		List<Integer> list3 = new ArrayList<Integer>();
		for(int i=0;i<list.size();i++){
			list2.add(list.get(i).getImgCheck_content());
			list3.add(list.get(i).getImgCheck_id());
		}
		request.setAttribute("list", list2);
		request.setAttribute("idList", list3);
		ImgActionForward forward = new ImgActionForward();
		forward.setRedirect(false);
		forward.setPath("test.jsp");

		return forward;
	}
}
