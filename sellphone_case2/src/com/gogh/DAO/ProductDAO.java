package com.gogh.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gogh.DTO.ProductDTO;
import com.gogh.common.DBManager;
import com.gogh.mybatis.SqlMapConfig;


public class ProductDAO {	
	//MyBatis 세팅값 호출
	//이것도 싱글톤패턴으로 만들어져 있다.
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	//mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
			
	private ProductDAO() {
	
	}
	
	//미리 객체 생성을 해두고 메소드로 이것을 가져다 쓰는 방식이다.
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
			
	//신상품을 조회하고 그 정보를 가져오는 메소드
	public List<ProductDTO> newList() {
		//리스트를 전역 변수로 선언하면 값이 계속 저장되기 때문에 출력시 문제가 될 수 있다. 따라서 지역변수로 선언한다.
		List<ProductDTO> list = new ArrayList<>();
		//환경설정되어 있는 모든 것을 실행 시키는 것임. 그리고 그것을 sqlSession에 넣어주는 것이다.
		sqlSession = sqlSessionFactory.openSession();
		try {
			//결과값이 바로 리스트에 담기기 때문에 rs.next()해서 값을 담을 필요가 없다.
			//매개변수가 여러개면 DTO나 list에 담아서 보내주면 된다.
			//우리가 기존에 썻던 여러 줄을 이 하나로 실행시킬 수 있다. 기존에 하던 것들을 미리 만들어 놓고 가져다 쓰는 개념이다.
			//이것이 프레임 워크의 개념이다. 중복된 것을 미리 만들어 놓고 가져다 쓰는 것이다.
			//Resultset에 담으면 기존에 기존에 list에 일일이 담아주는 과정을 하지 않아도 되서 절차가 엄청 간소화 된다.
			list = sqlSession.selectList("newpdtview");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("ProductDAO의 newList()의 디비 연결 문제 입니다.");
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	
	public List<ProductDTO> bestList() {
		List<ProductDTO> list = new ArrayList<>();
		sqlSession = sqlSessionFactory.openSession();
		try {
			//결과값이 바로 리스트에 담기기 때문에 rs.next()해서 값을 담을 필요가 없다.
			list = sqlSession.selectList("bestpdtview");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("ProductDAO의 bestList()의 디비 연결 문제 입니다.");
		} finally {
			sqlSession.close();
		}
		
		
		return list;
	}
}