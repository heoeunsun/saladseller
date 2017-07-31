package dao;

import java.util.HashMap;
import java.util.List;

import model.Product;

public interface ProductDao {
	//insert,update,delete,selectOne,selectAll
	public List<Product> selectAll(int cat_id);
	public List<Product> selectAll2();
	public void insertProduct(Product product);
	public void insertAttach(HashMap<String, Object> params);
	public void updateProduct(HashMap<String, Object> params);
	public void deleteProduct(int num);
	public Product selectOne(HashMap<String, Object> params);
	public int selectCat_id(int num);
	public int memberCount();
	public int productCount1();
	public int productCount2();
	public int productCount3();
	public List<Product> searchProduct(HashMap<String, Object> params);
}
