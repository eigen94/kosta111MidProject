package kosta.login;

public class MemberService {
	public static MemberDao dao;
	public static MemberService service = new MemberService();
	public static MemberService getInsetance(){
		dao = MemberDao.getInsetance();
		return service;	
	}	
	
	public int loginMemberService(int m_id, String m_pwd){
		return dao.loginMember(m_id,m_pwd);
	}
	

}
