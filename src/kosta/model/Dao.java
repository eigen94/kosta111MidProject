package kosta.model;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import kosta.projectMapper.ProjectBoardMapper;
import kosta.umlMapper.UmlMapper;

import org.apache.ibatis.io.Resources;
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
		try {
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

	public void checkCreate(ProjectDetail detail) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		System.out.println(detail);
		try {
			sqlSession.getMapper(ProjectBoardMapper.class).checkCreate(detail);
			
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
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

	public void umlInsert(String json) {
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

	public List<String> umlList() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		return sqlSession.getMapper(UmlMapper.class).umlList();
	}

	
}












