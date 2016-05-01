package kosta.umlMapper;

import java.util.List;

import kosta.model.ProjectDetail;

public interface UmlMapper {

	int umlInsert(ProjectDetail json);
	List<String> umlList(int check_id);
}
