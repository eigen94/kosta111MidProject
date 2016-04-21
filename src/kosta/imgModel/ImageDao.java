package kosta.imgModel;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kosta.imgMapper.imgBoardMapper;

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

	public void imgInsertService(String str) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;

		try {
			re = sqlSession.getMapper(imgBoardMapper.class).imgInsertService(str);

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

	public List<HashMap<String, String>> listImgBoardService() {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		List<Object> list = sqlSession.getMapper(imgBoardMapper.class)
				.imgListBoard();
		
		List<HashMap<String, String>> list2 = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<list.size(); i++){
			String key = ((String)list.get(i)).substring(1, ((String)list.get(i)).indexOf("="));
			String value = ((String)list.get(i)).substring(((String)list.get(i)).indexOf("=")+1,((String)list.get(i)).indexOf("}"));
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put(key, value);
			
			
			list2.add(map);
		}
		
		return list2;
	}
}
