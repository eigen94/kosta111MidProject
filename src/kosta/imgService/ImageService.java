package kosta.imgService;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import kosta.imgModel.Image;
import kosta.imgModel.ImageDao;
import kosta.imgModel.ImageUtil;

import kosta.model.ProjectDetail;

import kosta.model.DB;
import kosta.model.ProjectBoard;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




public class ImageService {
	public static ImageDao dao;
	public static ImageService service = new ImageService();
	private static final int PAGE_SIZE = 2;

	public static ImageService getInstance() {
		dao = ImageDao.getInstance();
		return service;
	}
	

	public void imgInsertService(String str, HttpServletRequest request) throws Exception {

		ProjectDetail detail = new ProjectDetail();
		detail.setCheck_content(str);
		dao.imgInsertService(detail);
		/*-------------------------------*/
		
		//HttpServletRequest request;
		
		Image img = new Image();
		
		int i = str.indexOf(":")+2;
		int j = str.indexOf(",")-1;
		String check_uploadName = str.substring(i, j);
		System.out.println(check_uploadName);
		
		///////////
		
		String uploadPath = request.getRealPath("imgUpload");
		System.out.println(uploadPath);
		int size =20 * 1024*1024;//20mb
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		
		img.setCheck_uploadName(multi.getParameter("check_uploadName"));
		
		//파일 업로드일때
		if(multi.getFilesystemName("check_uploadName")!=null){
			check_uploadName = multi.getFilesystemName("check_uploadName");
			img.setCheck_uploadName(check_uploadName);
			
			//썸네일 이미지(jpg,gif) aaa.gif => aaa_small.gif
			String pattern = check_uploadName.substring(check_uploadName.lastIndexOf(".")+1);
			String headName = check_uploadName.substring(0,check_uploadName.lastIndexOf("."));
			
			//원본 파일 이미지 -> 객체화
			String imagePath = uploadPath + "//" + check_uploadName;
			File src = new File(imagePath);
			
			//썸네일 이미지 -> 객체화
			String thumImagePath = uploadPath + "//" + headName + "_small." + pattern;
			File dest = new File(thumImagePath);
			
			//썸네일 이미지 생성
			if(pattern.equals("jpg")||pattern.equals("gif")||pattern.equals("png")){
				ImageUtil.resize(src, dest, 100, ImageUtil.RATIO);
			}
			
		} else {
			img.setCheck_uploadName("");
		}
		
	}
	
	public List<String> listImgBoardService() {
		return dao.listImgBoardService();
	}

}
