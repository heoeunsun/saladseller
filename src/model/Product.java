package model;

public class Product {

	private int p_num;
	private int cat_id;
	private String p_name;
	private String image;
	private String descript;
	private String specification;
	private int price;
	private int stock;


	@Override
	public String toString() {
		return "product [p_num=" + p_num + ", cat_id=" + cat_id + ", p_name=" + p_name + ", image=" + image
				+ ", descript=" + descript + ", specification=" + specification + ", price=" + price + ", stock="
				+ stock + "]";
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

}
