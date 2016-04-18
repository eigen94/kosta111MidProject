package kosta.projectMapper;
import java.util.List;

import kosta.model.ProjectBoard;
public interface ProjectBoardMapper {

	public List<ProjectBoard> projectList();
	public int projectInsert(ProjectBoard projectBoard);
	public int projectUpdate(ProjectBoard projectBoard);
}
