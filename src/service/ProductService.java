package service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import model.Product;

public interface ProductService {

	public HashMap<String, Object> getProductListAll();
	
	public HashMap<String, Object> getProductList(int cat_id);

	public boolean addProduct(Product product, MultipartFile file);

	public boolean deleteProduct(int num);

	public Product readProduct(int num);

	public Product getProduct(int num);

	public boolean updateProduct(int num, Product product, MultipartFile file);
	
	public int memberCount();

	public int[] productCount();
	
	public int selectCat_id(int num);

	HashMap<String, Object> getProductList_s(HashMap<String, Object> params);

}
