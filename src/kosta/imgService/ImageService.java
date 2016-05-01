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
	

	public void imgInsertService(Image image){
		dao.imgInsertService(image);
	}
	
	public String listImgBoardService(int check_id) {
		return dao.listImgBoardService(check_id);
	}
	
	public void imgDeleteService(Image image){
		dao.imgDeleteService(image);
	}


	public void imgModify(Image img) {
		dao.imgModify(img);
		
	}
	
	

}
