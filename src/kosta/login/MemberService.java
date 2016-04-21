package kosta.login;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

public class MemberService {
	public static MemberDao dao;
	public static MemberService service = new MemberService();
	public static MemberService getInsetance(){
		dao = MemberDao.getInsetance();
		return service;	
	}	
	
	public Member loginMemberService(String m_email, String m_pwd){
		System.out.println(testSHA256(m_pwd));
		return dao.loginMember(m_email,testSHA256(m_pwd));
	}
		
	//for password->hashed password
	public String testSHA256(String str){
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
			
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}
	
	public int insertMember(HttpServletRequest request){
		int re = 0;
		String hashedPwd = testSHA256(request.getParameter("m_pwd"));
		Member member = new Member();
		
		member.setM_email(request.getParameter("m_email"));
		member.setM_pwd(hashedPwd);
		member.setM_name(request.getParameter("m_name"));
		member.setM_phone(request.getParameter("m_phone"));
		member.setM_question(Integer.parseInt(request.getParameter("m_question")));
		member.setM_answer(request.getParameter("m_answer"));
		re = dao.insertMember(member);
		
		return re;
	}
	

}
