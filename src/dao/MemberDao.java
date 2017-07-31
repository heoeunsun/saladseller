package dao;

import model.Member;

public interface MemberDao {
	public Member selectOne(String id);
	public void insertMember(Member member);
}
