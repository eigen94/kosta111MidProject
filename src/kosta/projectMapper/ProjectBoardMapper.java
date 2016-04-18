package kosta.projectMapper;
import java.util.List;

import kosta.model.ProjectBoard;
public interface ProjectBoardMapper {

	public List<ProjectBoard> projectList();
	public int projectInsert(ProjectBoard projectBoard);
	public int projectUpdate(ProjectBoard projectBoard);
	public ProjectBoard projectSelect(int p_id);
	public int projectDelete(int p_id);
}
