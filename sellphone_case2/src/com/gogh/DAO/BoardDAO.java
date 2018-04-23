package com.gogh.DAO;

import java.sql.SQLPermission;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
				
				if(result > 0 ){
					System.out.println("게시글 삭제 성공");
				} else {
					System.out.println("게시글 삭제 실패");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return result;
		}
		
		
		//게시글을 클릭하면 조회수가 늘어나게 해준다.
		public void boardViewCnt(Integer bno, HttpSession countSession) {
			sqlSession = sqlSessionFactory.openSession();
			try {
				long update_time = 0;
				
				//조회수를 증가할 때 생기는 read_time_게시글 번호가 없이면 현재 처음 조회수를 1증가하는 경우임
				//"read_time_" + bno의 값을 가지는 값을 가져오라는 것인데 처음 접속 했을 때는 당연히 값이 없다.
				if(countSession.getAttribute("read_time_" + bno) != null) {
					update_time = (long)countSession.getAttribute("read_time_" + bno);
				}
				
				//현재 시간을 담는다.
				long current_time = System.currentTimeMillis();
				
				//현재 시간과 조회수 1증가한 시간을 비교해서 24시간(1일)이 지났으면 조회수 1증가 
				if(current_time - update_time > 24 * 60 * 60 * 1000) {
					result = sqlSession.update("boardViewCnt", bno);
					sqlSession.commit();
					
					//조회수 1증가한 시간을 session에 담는다.
					//current
					countSession.setAttribute("read_time_" + bno, current_time);
				}
				
				
				
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
		
		
		//게시판 상세 페이지에서 좋아요를 누르면 좋아요의 숫자를 늘려줌
		public int boardFavorite(Integer bno, HttpSession countSession) {
			sqlSession = sqlSessionFactory.openSession();
			int result = 0;
			try {
				long update_time = 0;
				
				//"read_time_" + bno의 값을 가지는 값을 가져오라는 것인데 처음 접속 했을 때는 당연히 값이 없다. 따라서 최초 한 번은 좋아요가 무조건 증가 하게 된다.
				//두 번째 좋아요를 누를 때는 read_good_bno가 생기기 때문에 if문을 타게 된다. 세션에 저장되는 값은 최초 좋아요를 클릭했을 때의 시간이다.
				if(countSession.getAttribute("read_good_" + bno) != null) {
					update_time = (long)countSession.getAttribute("read_good_" + bno);
				}
				
				//현재 시간을 담는다.
				long current_time = System.currentTimeMillis();
				
				//현재 시간과 조회수 1증가한 시간을 비교해서 24시간(1일)이 지났으면 조회수 1증가 
				//시간의 단위는 밀리세컨드이기 때문에 1000을 곱했다.
				if(current_time - update_time > 24 * 60 * 60 * 1000) {
					
					result = sqlSession.update("boardFavorite", bno);
					sqlSession.commit();
					
					//조회수 1증가한 시간을 session에 담는다.
					//"read_good_" + bno에 current_time이 담기게 된다.
					countSession.setAttribute("read_good_" + bno, current_time);
				}
				
				
				if(result > 0) {
					System.out.println("좋아요가 하나 올라갔습니다.");
				} else {
					System.out.println("좋아요 실패입니다.");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return result;
		}
		
		//tblboard 테이블에 있는 컬럼을 bno에 따라 한 개만 select해오는 메소드
		public BoardDTO boardSelectOne(Integer bno) {
			sqlSession = sqlSessionFactory.openSession();
			BoardDTO bDTO = null;
			try {
				bDTO = sqlSession.selectOne("boardselectone", bno);
				System.out.println(bDTO.getBno());
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return bDTO;
		}
		
		//flag 값에 따라 각각 다른 순서로 게시글 리스트를 정렬 해주는 메소드
		public List<BoardDTO> boardSort(CriteriaDTO criDto){
			sqlSession = sqlSessionFactory.openSession();
			List<BoardDTO> list = new ArrayList<>();
			try {
				list = sqlSession.selectList("boardsort", criDto);
				
				for(BoardDTO bDto : list){
					System.out.print(bDto.getBno());
					System.out.print(bDto.getContents());
					System.out.print(bDto.getGoodcnt());
					System.out.print(bDto.getReplycnt());
					System.out.print(bDto.getTitle());
					System.out.print(bDto.getViewcnt());
					System.out.print(bDto.getwriter());
					System.out.print(bDto.getregdate());
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














