package com.gogh.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gogh.DTO.ReplyDTO;
import com.gogh.mybatis.SqlMapConfig;

public class ReplyDAO {
			//MyBatis 세팅값 호출
			//이것도 싱글톤패턴으로 만들어져 있다.
			SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
			//mapper에 접근하기 위한 SqlSession
			SqlSession sqlSession;
				
			//싱글톤패턴으로 만들어 줬다.
			private ReplyDAO() {
			
			}
			
			//미리 객체 생성을 해두고 메소드로 이것을 가져다 쓰는 방식이다.
			private static ReplyDAO instance = new ReplyDAO();
			public static ReplyDAO getInstance() {
				return instance;
			}
			int result = 0;
			
			
			//댓글에 대한 정보를 가져오는 함수
			public List<ReplyDTO> replySelect(Integer bno) {
				sqlSession = sqlSessionFactory.openSession();
				List<ReplyDTO> list = null;
				try {
					list = sqlSession.selectList("replyAll", bno);
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return list;
			}
			
			
			public int replyInsert(ReplyDTO rDto) {
				
				sqlSession = sqlSessionFactory.openSession();
				try {
					result = sqlSession.insert("replyInsert", rDto);
					
					sqlSession.commit();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				
				return result;
			}
			
			
			//댓글 삭제하는 메소드
			public void replyDelete(Integer rno) {
				sqlSession = sqlSessionFactory.openSession();
				try {
					result = sqlSession.delete("replydelete", rno);
					sqlSession.commit();
					
					if(result > 0) {
						System.out.println("댓글 삭제 성공");
					} else {
						System.out.println("댓글 삭제 실패");
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				
			}
			
			//게시글 삭제시 댓글 연쇄 삭제
			public int replyDeleteAll(Integer bno) {
				sqlSession = sqlSessionFactory.openSession();
				try {
					result = sqlSession.delete("replydeleteall", bno);
					sqlSession.commit();
					
					if(result > 0) {
						System.out.println("게시글 삭제 시 댓글 삭제 성공");
					} else {
						System.out.println("게시글 삭제 시 댓글 삭제 실패");
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					//세션에 값이 없으면 닫을 필요가 없기 때문에 널이 아닐경우에만 닫도록 해준다.
					if(sqlSession != null)
						sqlSession.close();
				}
				return result;
			}
		
			
			
}
