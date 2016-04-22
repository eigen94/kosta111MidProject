package kosta.imgService;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;











import kosta.imgModel.Image;
import kosta.imgModel.ImageDao;
import kosta.imgModel.ImageUtil;
import kosta.model.ProjectBoard;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class ImageService {
	public static ImageDao dao;
	public static ImageService service = new ImageService();
	public static ImageService getInstance(){
		dao = ImageDao.getInstance();
		return service;	
	}
	
	public void imgInsertService(String str){
		dao.imgInsertService(str);
	}
	
	public List<String> listImgBoardService(){
		return dao.listImgBoardService();
	}
	
	
}
