package kosta.loginMapper;

import java.util.List;

import kosta.login.Member;

public interface loginMapper {
	public int loginMember(Member member);
	public int insertMember(Member member);
	public Member getMemberInfo(Member member);
	public List<Member> memberNameOrEmailSearch(String searchKey);

}
