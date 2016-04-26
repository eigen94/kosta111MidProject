package kosta.imgMapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kosta.model.ProjectDetail;


public interface imgBoardMapper {

	int imgInsertService(ProjectDetail detail);
	List<String> imgListBoard();
	
}
