package kosta.mapper;
import java.util.List;

import kosta.model.ProjectBoard;
public interface ProjectBoardMapper {

	public List<ProjectBoard> projectList();

	public int insetProjectBoard(ProjectBoard projectBoard);
}
