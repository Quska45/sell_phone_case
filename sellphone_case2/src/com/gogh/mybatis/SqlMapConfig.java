package com.gogh.mybatis;

import java.io.Reader;

 

import org.apache.ibatis.io.Resources;

import org.apache.ibatis.session.SqlSessionFactory;

import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory sqlSessionFactory;
	
	//실질적으로 값을 담는 부분. setter라고 볼 수 있다.
	static {
		String resource = "com/gogh/mybatis/Configuration.xml";
		try {
			//XML파일을 자바에서 쓸 수 있게 읽어 오는 것이다.
			Reader reader = Resources.getResourceAsReader(resource);
			
			if(sqlSessionFactory == null){
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//값을 가져다 쓸 수 있게 리턴하는 부분. getter에 해당한다.
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
