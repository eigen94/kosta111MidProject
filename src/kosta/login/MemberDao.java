package kosta.login;

import java.io.InputStream;

import kosta.loginMapper.loginMapper;




import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDao {
	
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInsetance(){
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory(){
		String resource = "mybatis-config.xml";
		InputStream input = null;
		
		try {
			input = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(input);
	}

	public int loginMember(int m_id, String m_pwd) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Member member = new Member();
		
		member.setM_id(m_id);
		member.setM_pwd(m_pwd);
	
		int re = -1;
		
		try {
			re = sqlSession.getMapper(loginMapper.class).loginMember(member);
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
}
