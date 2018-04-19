package com.gogh.DAO;

import java.sql.SQLPermission;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gogh.DTO.BoardDTO;
import com.gogh.DTO.CriteriaDTO;
import com.gogh.mybatis.SqlMapConfig;

import oracle.jdbc.OracleConnection.CommitOption;

public class BoardDAO {
	//MyBatis 세팅값 호출
		//이것도 싱글톤패턴으로 만들어져 있다.
		SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
		//mapper에 접근하기 위한 SqlSession
		SqlSession sqlSession;
			
		//싱글톤패턴으로 만들어 줬다.
		private BoardDAO() {
		
		}
		
		//미리 객체 생성을 해두고 메소드로 이것을 가져다 쓰는 방식이다.
		private static BoardDAO instance = new BoardDAO();
		public static BoardDAO getInstance() {
			return instance;
		}
		int result = 0;
		
		//게시판에 글목록을 띄워주기 위해 사용하는 메소드
		public List<BoardDTO> listAll(CriteriaDTO criDto) {
			//sqlSessionFactory를 열어야 마이바티스를 쓸 수 있따.
			//설정했던 모든 것들이 들어 있다.
			sqlSession = sqlSessionFactory.openSession();
			List<BoardDTO> list = new ArrayList<>();
			
			try {
				//sql문을 사용해 가져온 값을 리스트에 담아준다.
				//Resultset을 거칠 필요없이 바로 자바 객체인 list에 담을 수 있다.
				list = sqlSession.selectList("listCriteria",criDto);
				
				for(BoardDTO boardDTO : list) {
					System.out.print(boardDTO.getBno());
					System.out.print(boardDTO.getTitle());
					System.out.print(boardDTO.getContents());
					System.out.print(boardDTO.getwriter());
					System.out.print(boardDTO.getregdate());
					System.out.print(boardDTO.getViewcnt());
					System.out.println();
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return list;
		}
		
		
		public int totalCount(CriteriaDTO criDto) {
			sqlSession = sqlSessionFactory.openSession();
			try {
				//몇건이 출력될지 출력하는 단건을 출력시키기 때문에 단건만 출력하는 것이다.
				//즉 게시글의 건수가 여기 담기게 된다.
				result = sqlSession.selectOne("scountPaging", criDto);
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			
			return result;
		}
		
		//게시글을 등록하는 메소드
		public int boardInsert(String title, String content, String writer) {
			sqlSession = sqlSessionFactory.openSession();
			
			try {
				BoardDTO bDto = new BoardDTO(title, content, writer);
				//문법상 매개변수는 1개만 보낼 수 있기 때문에 DTO를 사용한다.
				result = sqlSession.insert("boardinsert", bDto);
				
				sqlSession.commit();
				System.out.println("result = " + result);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			
			
			return result;
		}
		
		
		//게시글 목록에서 항목을 클릭하면 페이지 내에 있는 정보를 가져오는 메소드
		public BoardDTO boardDetailView(Integer bno){
			
			sqlSession = sqlSessionFactory.openSession();
			//리턴할 때 list가 전역변수가 아니면 리턴이 안된다. 
			BoardDTO bDto = null;
			try {
				//여러건 출력 : selectList = LIST Type
				//단건 출력 : selectOne = DTO Type
				bDto = sqlSession.selectOne("boarddetailview", bno);
				System.out.println(bDto);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return bDto;
		}
		
		
		public int boardDetailSave(Integer bno, String title, String content) {
			sqlSession = sqlSessionFactory.openSession();
			int result = 0;
			try {
				BoardDTO bDto = new BoardDTO(bno, title, content);
				
				result = sqlSession.update("boarddetailsave", bDto);
				sqlSession.commit();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return result;
		}
		
		public int boardDelete(Integer bno){
			sqlSession = sqlSessionFactory.openSession();
			int result = 0;
			try {
				result = sqlSession.delete("boarddelete", bno);
				sqlSession.commit();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return result;
		}
		
		
		//게시글을 클릭하면 조회수가 늘어나게 해준다.
		public void boardViewCnt(Integer bno) {
			sqlSession = sqlSessionFactory.openSession();
			try {
				result = sqlSession.update("boardViewCnt", bno);
				sqlSession.commit();
				
				if(result > 0) {
					System.out.println("조회수가 증가했습니다.");
				} else {
					System.out.println("조회수 증가에 문제가 있습니다.");
					
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
		}
		
		
		public List<BoardDTO> boardSearch(CriteriaDTO criDto){
			sqlSession = sqlSessionFactory.openSession();
			List<BoardDTO> list = null;
			try {
				System.out.println("keyword=====>" + criDto.getKeyword());
				System.out.println("flag=====>" + criDto.getFlag());
				
				list = sqlSession.selectList("boardSearch", criDto);
				
				for(BoardDTO bDto : list) {
					System.out.print(bDto.getBno()+", ");
					System.out.print(bDto.getTitle()+", ");
					System.out.print(bDto.getContents()+", ");
					System.out.print(bDto.getwriter()+", ");
					System.out.print(bDto.getregdate()+", ");
					System.out.print(bDto.getViewcnt()+", ");
					System.out.println();
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			
			return list;
		}
		
}














