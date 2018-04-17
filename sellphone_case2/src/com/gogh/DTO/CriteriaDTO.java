package com.gogh.DTO;

//검색기준 또는 분류기준
public class CriteriaDTO {
	private int page;	//페이지번호(하단의 번호들 클릭)
	private int perPageNum;	//한 페이지에 보여줄 게시글 수
	
	
	public CriteriaDTO() {
		// TODO Auto-generated constructor stub
		//페이지가 뜨는 것의 기본은 1페이지기 때문에 1을 넣어줌
		this.page = 1;
		//보여지는 페이지의 기본 값은 10개 이기 때문에 10을 넣어줌. 게시글을 열개 띄워준다는 것임
		this.perPageNum = 10;
	}
	
	

	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		//페이지를 0보다 작게 하려고 하면 다시 1페이지로 돌아가야하기 때문에 이렇게 해준다.
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	//아래 두개 메소드의 값을 각각 구해보면 pagestart부터 perpagenum까지 10개 씩 된다는 것을 알 수 있다.
	//method for MyBatis SQL Mapper: 조회 시작 Row 취득하는 메서드
	public int getPageStart() {
		return (((this.page-1) * perPageNum) + 1);
		
	}
	
	//method for MyBatis SQL Mapper: 조회 마지막 row 취득하는 메서드
	public int getPerPageNum() {
		return this.page*perPageNum;
		//2페이지 x 10 = 20번 게시글까지 출력
	}


	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	
	
	
	
	
}





















