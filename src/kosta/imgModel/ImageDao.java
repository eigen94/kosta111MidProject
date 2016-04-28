package kosta.imgModel;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kosta.imgMapper.imgBoardMapper;
import kosta.model.ProjectDetail;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ImageDao {

	private static ImageDao dao = new ImageDao();

	public static ImageDao getInstance() {
		return dao;
	}

	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream input = null;

		try {
			input = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(input);
	}

	public void imgInsertService(String content) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = sqlSession.getMapper(imgBoardMapper.class).imgInsertService(content);
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
	}

	public List<Image> listImgBoardService() {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		List<Image> list = sqlSession.getMapper(imgBoardMapper.class).imgListBoard();
		
		return list;
		}
	
	public void imgDeleteService(int check_id){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = sqlSession.getMapper(imgBoardMapper.class).imgDeleteService(check_id);
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
	}

	public void imgModify(Image img) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = sqlSession.getMapper(imgBoardMapper.class).imgModify(img);
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
		
	}
}

