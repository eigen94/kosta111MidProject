package kosta.usecaseMapper;

import kosta.model.CheckList;

public interface usecaseMapper {

	public int useCaseInsert(String json);

	public CheckList useCaseList(int check_id);

}
