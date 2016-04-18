package kosta.model;

import java.io.InputStream;
import java.sql.SQLException;

import kosta.mapper.ProjectBoardMapper;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class Dao {
	private static Dao dao = new Dao();

	public static Dao getInstance() {
		return dao;
	}

	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(input);
	}

	public int insertProject(ProjectBoard project) throws SQLException {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = sqlSession.getMapper(ProjectBoardMapper.class).insertProject(project);
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}
	
}



















