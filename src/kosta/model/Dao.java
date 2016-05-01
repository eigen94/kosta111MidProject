package kosta.model;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.messengerMapper.MessengerMapper;
import kosta.noteMapper.NoteMapper;
import kosta.projectMapper.ProjectBoardMapper;
import kosta.umlMapper.UmlMapper;
import kosta.usecaseDiagramMapper.usecaseDiagramMapper;
import kosta.usecaseMapper.usecaseMapper;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Dao {
	private static Dao dao = new Dao();

	public static Dao getInstance(){      
		return dao;
	}

	public SqlSessionFactory getSqlSessionFactory(){
		String resource = "mybatis-config.xml";
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}      return new SqlSessionFactoryBuilder().build(input);
	}

	

	public List<ProjectBoard> projectList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		List<ProjectBoard> list = sqlSession.getMapper(ProjectBoardMapper.class).projectList();
		return list;
	}

	public void projectInsert(ProjectBoard projectBoard) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try {
			re = sqlSession.getMapper(ProjectBoardMapper.class).projectInsert(projectBoard);
			
			if(re > 0)
			{
				
				sqlSession.commit();
			}
			
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally
		{
			sqlSession.close();
		}		
		
	}

	public void projectUpdate(ProjectBoard projectBoard) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try {
			re = sqlSession.getMapper(ProjectBoardMapper.class).projectUpdate(projectBoard);
			
			if(re > 0)
			{
				
				sqlSession.commit();
			}
			
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally
		{
			sqlSession.close();
		}
		
	}

	public ProjectBoard projectSelect(int p_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		ProjectBoard projectBoard = null;
		
		try {
			projectBoard = sqlSession.getMapper(ProjectBoardMapper.class).projectSelect(p_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return projectBoard;
	}

	public void projectDelete(int p_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		int re2 = -1;
		int re3= -1;
		try {
			re3 = sqlSession.getMapper(ProjectBoardMapper.class).checkDelAllinProject(p_id);
			re2 = sqlSession.getMapper(MessengerMapper.class).deleteMessege(p_id);
			re = sqlSession.getMapper(ProjectBoardMapper.class).projectDelete(p_id);
			if(re > 0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	}
	
	public int selectMaxP_id()
	{
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int id = 0;
		if(sqlSession.getMapper(ProjectBoardMapper.class).selectMaxP_id() == null)
		{
			sqlSession.close();
			return id;
		}
		else
		{
			id=sqlSession.getMapper(ProjectBoardMapper.class).selectMaxP_id();
			sqlSession.close();
			return id;
		}
	}

	public int getDetailId() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int id = 0;
		if(sqlSession.getMapper(ProjectBoardMapper.class).getDetailId() == null)
		{
			sqlSession.close();
			return id;
		}
		else
		{	
			id=sqlSession.getMapper(ProjectBoardMapper.class).getDetailId();
			sqlSession.close();
			return id;
		}
		
	}

	public int checkCreate(ProjectDetail detail) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = 0;
		System.out.println("dao checkCreate : "+detail);
		try {
			re = sqlSession.getMapper(ProjectBoardMapper.class).checkCreate(detail);
			if (re>0)
			{
				sqlSession.commit();
			}
			else
			{
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}

	public List<ProjectDetail> detailListService(int id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		List<ProjectDetail> list = sqlSession.getMapper(ProjectBoardMapper.class).detailList(id);
		sqlSession.close();
		return list;
		
	}

	public ProjectDetail selectDetail(int check_id) {
	SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		ProjectDetail detail = sqlSession.getMapper(ProjectBoardMapper.class).selectDetail(check_id);
		sqlSession.close();
		return detail;
	}

	public void CheckDelete(int id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			sqlSession.getMapper(ProjectBoardMapper.class).checkDelet(id);
		
			
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	}

	public void CheckUpdate(ProjectDetail detail) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			sqlSession.getMapper(ProjectBoardMapper.class).checkUpdate(detail);
		
				sqlSession.commit();
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally
		{
			sqlSession.close();
		}
		
	}

	public int dBId() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int id = 0;
		if(sqlSession.getMapper(ProjectBoardMapper.class).dBId() == null)
		{
			sqlSession.close();
			return id+1;
		}
		else
		{	
			id=sqlSession.getMapper(ProjectBoardMapper.class).dBId()+1;
			sqlSession.close();
			return id;
		}
	}

	public String dBList(int id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
//		List<DB> list = sqlSession.getMapper(ProjectBoardMapper.class).dBList(id);
		String list = sqlSession.getMapper(ProjectBoardMapper.class).dBList(id);
		//System.out.println(list);
		sqlSession.close();
		if(list == null){
			return null;
		}else{
			
			return list;
		}
	}

	public void createDB(DB db) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			sqlSession.getMapper(ProjectBoardMapper.class).createDB(db);
			
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	}

	public void umlInsert(ProjectDetail json) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try {
			re = sqlSession.getMapper(UmlMapper.class).umlInsert(json);
			
			if(re > 0)
			{
				sqlSession.commit();
			}
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			sqlSession.close();
		}
		
		
	}

	public List<String> umlList(int check_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		return sqlSession.getMapper(UmlMapper.class).umlList(check_id);
	}

	public void useCaseInsert(ProjectDetail json) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re =-1;
		
		try {
			re=sqlSession.getMapper(usecaseMapper.class).useCaseInsert(json);
			
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
	}

	public void usecaseDiagram(ProjectDetail json) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re =-1;
		
		try {
			re=sqlSession.getMapper(usecaseDiagramMapper.class).usecaseDiagram(json);
			
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
	}

	public void updateDB(DB db) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		
		try {
			sqlSession.getMapper(ProjectBoardMapper.class).updateDB(db);
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	}

	public void linkDB(DB db) {
			SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			sqlSession.getMapper(ProjectBoardMapper.class).linkDB(db);
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	}

	public CheckList useCaseList(int check_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		CheckList checkList = sqlSession.getMapper(usecaseMapper.class).useCaseList(check_id);
		return checkList;
	}

	public String usecaseDiagramList(int check_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		String str = sqlSession.getMapper(usecaseDiagramMapper.class).usecaseDiagramList(check_id);
		return str;
	}
	
	public int insertNote(Note note) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re=-1;
		try {
			re=sqlSession.getMapper(NoteMapper.class).insertNote(note);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}


	public List<Note> selectNote(int n_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Note> note = new ArrayList<Note>();
		try {
			note = sqlSession.getMapper(NoteMapper.class).selectNote(n_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return note;
	}

	public List<String> searchId(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<String> list = null;
		try {
			list = sqlSession.getMapper(NoteMapper.class).searchId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}

	public int getEmail(String receive) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int eMail = 0;
		try {
			eMail = sqlSession.getMapper(NoteMapper.class).getEmail(receive);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return eMail;
	}

	public List<Note> noteList(int startRow, Search search) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Note> list = null;
		try {
			list = sqlSession.getMapper(NoteMapper.class).noteList(new RowBounds(startRow, 3), search);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		System.out.println(search.getReceive());
		System.out.println(list);
		return list;
	}

	public int countNote(Search search) {
		int num;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		if(sqlSession.getMapper(NoteMapper.class).countNote(search) == 0){
			sqlSession.close();
			return 0;
		}else{
			num = (int)sqlSession.getMapper(NoteMapper.class).countNote(search);
			sqlSession.close();
			return num;
		}
	}

	public String noteDetail(int n_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String content = "";
		try {
			content = sqlSession.getMapper(NoteMapper.class).noteDetail(n_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return content;
	}

	public int messengerInsert(int sender, int projectId, String msg) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Messenger messeger = new Messenger();
		messeger.setMsg_sender(sender);
		messeger.setMsg_content(msg);
		messeger.setMsg_projectid(projectId);
		int re=-1;
		try {
			re=sqlSession.getMapper(MessengerMapper.class).messengerInsert(messeger);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}

	public List<Messenger> loadMessege(Messenger Messenger) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Messenger> list = new ArrayList<Messenger>();
		try {
			list=sqlSession.getMapper(MessengerMapper.class).loadMessege(Messenger);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}

	public int getMaxMsgId() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = 0;
		try {
			re=sqlSession.getMapper(MessengerMapper.class).getMaxMsgId();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}

	
}












