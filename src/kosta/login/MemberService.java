package kosta.login;

public class MemberService {
	public static MemberDao dao;
	public static MemberService service = new MemberService();
	public static MemberService getInsetance(){
		dao = MemberDao.getInsetance();
		return service;	
	}	
	
	public int insertMember(Member member){
		return dao.insertMember(member);
	}

}
