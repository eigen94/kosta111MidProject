package kosta.usecaseMapper;

import kosta.model.CheckList;
import kosta.model.ProjectDetail;

public interface usecaseMapper {

	public int useCaseInsert(ProjectDetail json);

	public CheckList useCaseList(int check_id);

}
