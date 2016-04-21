package kosta.note;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import kosta.noteMapper.noteMapper;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class NoteDao {
	private static NoteDao dao= new NoteDao();
	public static NoteDao getInstance(){
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory(){
		String resource = "mybatis-config.xml";
		InputStream input = null;
		
		try {
			input= Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(input);
	}

	public int insertNote(Note note) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re=-1;
		try {
			re=sqlSession.getMapper(noteMapper.class).insertNote(note);
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
			note = sqlSession.getMapper(noteMapper.class).selectNote(n_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return note;
	}
	
	

}
