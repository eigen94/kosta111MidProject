package kosta.model;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import kosta.mapper.ProjectBoardMapper;

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

	public void insetProjectBoard(ProjectBoard projectBoard) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try {
			re = sqlSession.getMapper(ProjectBoardMapper.class).insetProjectBoard(projectBoard);
			
			if(re > 0)
			{
				System.out.println("Dd");
				sqlSession.commit();
			}
			
			else
			{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		finally
		{
			sqlSession.close();
		}		
		
	}
}
