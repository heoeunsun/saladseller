package service;

import model.Member;

public interface MemberService {
	public boolean login(String id,String pw);
	boolean insertMember(Member member);
}
