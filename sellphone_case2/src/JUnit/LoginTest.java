package JUnit;

import org.junit.Test;

import com.gogh.DAO.MemberDAO;

public class LoginTest {

	@Test
	public void test() {
		String mid="1001";
		String mpw = "1001";
		
		MemberDAO mDao = MemberDAO.getInstance();
		int flag = mDao.memLogin(mid, mpw);
		
		if(flag >0) {
			System.out.println("환영합니다.");
		} else {
			System.out.println("등록된 회원이 아닙니다.");
		}
	}

}
