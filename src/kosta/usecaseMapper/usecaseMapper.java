package kosta.usecaseMapper;

import java.util.List;

import kosta.model.CheckList;

public interface usecaseMapper {

	public int useCaseInsert(String json);

	public CheckList useCaseList(int check_id);

}
