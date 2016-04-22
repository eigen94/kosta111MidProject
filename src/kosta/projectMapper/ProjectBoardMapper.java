package kosta.projectMapper;
import java.util.List;

import kosta.model.DB;
import kosta.model.ProjectBoard;
import kosta.model.ProjectDetail;
public interface ProjectBoardMapper {

	public List<ProjectBoard> projectList();
	public int projectInsert(ProjectBoard projectBoard);
	public int projectUpdate(ProjectBoard projectBoard);
	public ProjectBoard projectSelect(int p_id);
	public int projectDelete(int p_id);
	public Integer selectMaxP_id();
	public Integer getDetailId();
	public void checkCreate(ProjectDetail detail);
	public List<ProjectDetail> detailList(int id);
	public ProjectDetail selectDetail(int check_id);
	public void checkDelet(int id);
	public void checkUpdate(ProjectDetail detail);
	public Integer dBId();
	
	public List<String> dBList(int id);
	public void createDB(DB db);
}
