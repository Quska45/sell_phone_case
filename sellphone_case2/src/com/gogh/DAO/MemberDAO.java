package com.gogh.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gogh.DTO.MemberDTO;
import com.gogh.common.DBManager;
import com.gogh.mybatis.SqlMapConfig;

public class MemberDAO {
	
	//MyBatis 세팅값 호출
	//이것도 싱글톤패턴으로 만들어져 있다.
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	//mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
			
	private MemberDAO() {
	
	}
	
	//미리 객체 생성을 해두고 메소드로 이것을 가져다 쓰는 방식이다.
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result, flag;
	//flag는 아이디 중복 체크에 사용되며 1이면 중복이 아니고 0이면 중복임.
	
	//IdOlapCkAction을 통해 입력받은 아이디가 중복인지 아닌지를 체크하는 메소드
	public int memIdCheck(String memberid) {
		List<MemberDTO> list = new ArrayList<>();
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("memidcheck", memberid);
			
			//쿼리의 결과를 통해 입력받은 아이디가 중복인지 아닌지 알 수 있게 한다.
			String mid = null;
			
			if(list.size()==0) {
				System.out.println("list에 들어 있는게 없습니다.");
				mid = null;
			} else {
				System.out.println("list에는 뭔가 들어 있습니다.");
				mid = list.get(0).getMid();
			}
			
			
			
			//mid를 통해 flag에 0, 1을 입력 시키고 이것을 IdOlapCkAction으로 보낸다.
			if(mid != null) {
				System.out.println("중복된 아이디 입니다.");
				flag = 0;
			} else {
				System.out.println("사용가능한 아이디 입니다.");
				flag = 1;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return flag;
	}
	
	
	//회원등록을 위한 메소드를 만든다.
	public int memInsert(MemberDTO mDto) { //매개변수에 타입을 쓰는 이유는 매개변수의 타입을 모르기 때문이다.
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.insert("meminsert", mDto);
			
			if(result > 0) {
				System.out.println("회원등록 성공");
			} else {
				System.out.println("회원등록 실패");
			}
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	//로그인 ID, PW 등록된 회원인지 체크하는 메소드를 만든다.
	public int memLogin(String mid, String mpw) {
		int flag = 0;
		List<MemberDTO> list = new ArrayList<>(); 
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO(mid, mpw);
		try {
			list = sqlSession.selectList("memlogin", mDto);
			
			for(MemberDTO mDto2 : list) {
				System.out.println(mDto2.getMid());
				System.out.println(mDto2.getMpw());
				System.out.println(mDto2.getMname());
				System.out.println(mDto2.getMemail());
			}
			System.out.println("memlogin list아이디입니다." +list);
			
			if(list.size() == 0) { //rs.niext()는 값이 없으면 false를 반환함
				System.out.println("null입니다.");
				System.out.println("ID, PW가 없는 경우 입니다.");
				flag = 0;
			} else {
				//로그인 시켜줘야 하는 경우
				System.out.println("null이 아닙니다.");
				 System.out.println("로그인 OK");
				flag = 1;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return flag;
	}
	
	
	//session에 값을 담아 주는 메소드 이다.
		public MemberDTO sessionLogin(String mid, String mpw) {
			MemberDTO mDto = new MemberDTO(mid, mpw);
			MemberDTO mDtoLogin = new MemberDTO();
			List<MemberDTO> list = new ArrayList<>();
			sqlSession = sqlSessionFactory.openSession();
			try {
				list = sqlSession.selectList("sessionlogin", mDto);
				
				
				if(list.size() == 0) {
					System.out.println("null입니다.");
					System.out.println("ID, PW가 없는 경우 입니다.");
					flag = 0;
				} else {
					//로그인 시켜줘야 하는 경우
					System.out.println("null이 아닙니다.");
					 System.out.println("로그인 OK");
					flag = 1;
					for(MemberDTO mDto2 : list) {
						String id = mDto2.getMid();
						String pw = mDto2.getMpw();
						String name = mDto2.getMname();
						String email = mDto2.getMemail();
						
						mDtoLogin = new MemberDTO(id, pw, name, email);
					}
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return mDtoLogin;
		}
	
	
	
	
	
	
}
