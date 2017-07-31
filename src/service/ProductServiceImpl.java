package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.ProductDao;
import model.Member;
import model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	private static final String UPLOAD_PATH = "C:\\dev\\workspace\\day0614_board\\WebContent\\images";
	@Autowired
	private ProductDao productDao;

	@Override
	public HashMap<String, Object> getProductListAll() {
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<Product> productList = productDao.selectAll2();
		result.put("productList", productList);
		return result;
	}

	@Override
	public HashMap<String, Object> getProductList(int cat_id) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<Product> productList = productDao.selectAll(cat_id);
		result.put("productList", productList);
		return result;
	}

	@Override
	public HashMap<String, Object> getProductList_s(HashMap<String, Object> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<Product> productList = productDao.searchProduct(params);
		result.put("productList", productList);
		return result;
	}

	@Override
	public Product readProduct(int num) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int cat_id = productDao.selectCat_id(num);
		result.put("num", num);
		result.put("cat_id", cat_id);
		Product product = productDao.selectOne(result);
		return product;
	}

	@Override
	public boolean addProduct(Product product, MultipartFile file) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		try {
			String fullname = uploadFile(file.getOriginalFilename(), file.getBytes());
			productDao.insertProduct(product);
			int num = product.getP_num();
			params.put("fullname", fullname);
			params.put("num", num);
			productDao.insertAttach(params);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateProduct(int num, Product product, MultipartFile file) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			if (file.isEmpty() == false) {
				String fullname = uploadFile(file.getOriginalFilename(), file.getBytes());
				product.setImage("images/" + file.getOriginalFilename());
				params.put("fullname", fullname);
				params.put("num", num);
				productDao.insertAttach(params);
			}
			result.put("num", num);
			result.put("product", product);
			productDao.updateProduct(result);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Product getProduct(int num) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int cat_id = productDao.selectCat_id(num);
		result.put("num", num);
		result.put("cat_id", cat_id);
		Product product = productDao.selectOne(result);
		return product;
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		String savedName = originalName;
		File target = new File(UPLOAD_PATH, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	@Override
	public boolean deleteProduct(int num) {
		try {
			productDao.deleteProduct(num);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public int memberCount() {
		try {
			return productDao.memberCount();
		} catch (Exception e) {
			return 0;
		}
	}

	public int[] productCount() {
		int[] p_count = new int[3];
		try {
			p_count[0] = productDao.productCount1();
			p_count[1] = productDao.productCount2();
			p_count[2] = productDao.productCount3();
			return p_count;
		} catch (Exception e) {
			return null;
		}
	}

	public int selectCat_id(int num) {
		return productDao.selectCat_id(num);
	}

}
