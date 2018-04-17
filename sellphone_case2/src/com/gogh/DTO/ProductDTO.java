package com.gogh.DTO;

public class ProductDTO {
	private String p_code;
	private String p_name;
	private String p_price2;
	private String p_img;

	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(String p_code, String p_name, String p_price2, String p_img) {
		super();
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_price2 = p_price2;
		this.p_img = p_img;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_price2() {
		return p_price2;
	}

	public void setP_price2(String p_price2) {
		this.p_price2 = p_price2;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
}
