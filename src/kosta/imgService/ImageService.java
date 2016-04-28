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
	

	public void imgInsertService(String content){
		System.out.println(content + "service");
		dao.imgInsertService(content);
	}
	
	public List<Image> listImgBoardService() {
		return dao.listImgBoardService();
	}
	
	public void imgDeleteService(int check_id){
		dao.imgDeleteService(check_id);
	}


	public void imgModify(Image img) {
		dao.imgModify(img);
		
	}
	
	

}
