package kosta.imageAction;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.imgModel.Image;
import kosta.imgModel.ImageUtil;
import kosta.imgService.ImageService;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImgFileAction implements ImgAction {

	@Override
	public ImgActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String uploadPath = request.getRealPath("imgUpload");
		int size =20 * 1024*1024;//20mb
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	
		String content = multi.getFilesystemName("check_urlId")+","+multi.getParameter("check_textArea");
		System.out.println(content);
		//파일 업로드일때
		if(multi.getFilesystemName("check_urlId")!=null){
			String check_urlId = multi.getFilesystemName("check_urlId");
			
			//썸네일 이미지(jpg,gif) aaa.gif => aaa_small.gif
			String pattern = check_urlId.substring(check_urlId.lastIndexOf(".")+1);
			String headName = check_urlId.substring(0,check_urlId.lastIndexOf("."));
			
			//원본 파일 이미지 -> 객체화
			String imagePath = uploadPath + "//" + check_urlId;
			
			File src = new File(imagePath);
			
			//썸네일 이미지 -> 객체화
			String thumImagePath = uploadPath + "//" + headName + "_small." + pattern;
			
			File dest = new File(thumImagePath);
			
			//썸네일 이미지 생성
			if(pattern.equalsIgnoreCase("jpg")||pattern.equalsIgnoreCase("gif")||pattern.equalsIgnoreCase("png")){
			
				ImageUtil.resize(src, dest, 100, ImageUtil.RATIO);
			}
			
		}else{
			/*board.setB_fname("");*/
		}
		
		ImageService service = ImageService.getInstance();
		
		service.imgInsertService(content);
		ImgActionForward forward = new ImgActionForward();
		forward.setRedirect(true);
		forward.setPath("imgListBoard.img");
		
		return forward;
	}
}
