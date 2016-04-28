package kosta.imgMapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kosta.imgModel.Image;
import kosta.model.ProjectDetail;


public interface imgBoardMapper {

	int imgInsertService(String content);
	int imgDeleteService(int check_id);
	List<Image> imgListBoard();
	int imgUpdateService(Image img);
	int imgModify(Image img);
	
}
