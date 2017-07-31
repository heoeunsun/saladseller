package service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;
import model.Member;

@Service
public class MemberServiceImpl  implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public boolean login(String id, String pw) {
		//memeberDao: select
		Member member = memberDao.selectOne(id);
		System.out.println(member);
		if(member != null && member.getM_pass().equals(pw)){
			System.out.println("true입니다");
			return true;			
		}else{
			System.out.println("false입니다");
			return false;
		}
	}
	
	@Override
	public boolean insertMember(Member member) {
		try {
			System.out.println(member);
			memberDao.insertMember(member);
			System.out.println("dao성공");
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
