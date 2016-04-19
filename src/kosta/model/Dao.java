package kosta.model;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import kosta.projectMapper.ProjectBoardMapper;

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
		
		if(sqlSession.getMapper(ProjectBoardMapper.class).selectMaxP_id() == null)
		{
			return 0;
		}
		else
		{
			return sqlSession.getMapper(ProjectBoardMapper.class).selectMaxP_id();
		}
	}

	
}












