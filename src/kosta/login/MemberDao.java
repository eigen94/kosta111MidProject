package kosta.login;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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

	public Member loginMember(String m_email, String m_pwd) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Member member = new Member();
		
		member.setM_email(m_email);
		member.setM_pwd(m_pwd);
	
		int re = -1;
		
		try {
			re = sqlSession.getMapper(loginMapper.class).loginMember(member);
			System.out.println(re);
			if(re>0){
				sqlSession.commit();
				member = sqlSession.getMapper(loginMapper.class).getMemberInfo(member);
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return member;
	}

	public int insertMember(Member member) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try {
			re = sqlSession.getMapper(loginMapper.class).insertMember(member);
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

	public List<Member> memberNameOrEmailSearch(String searchKey) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		List<Member> list = new ArrayList<Member>();
		try {
			list = sqlSession.getMapper(loginMapper.class).memberNameOrEmailSearch(searchKey);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
		
	}
}
