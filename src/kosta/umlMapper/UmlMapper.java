package kosta.umlMapper;

import java.util.List;

public interface UmlMapper {

	int umlInsert(String json);
	List<String> umlList(int check_id);
}
