package kosta.imgMapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kosta.imgModel.Image;
import kosta.model.ProjectDetail;


public interface imgBoardMapper {

	int imgInsertService(Image image);
	int imgDeleteService(Image image);
	String imgListBoard(int check_id);
	int imgUpdateService(Image img);
	int imgModify(Image img);
	
}
