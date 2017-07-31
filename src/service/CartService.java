package service;

import java.util.List;

import model.Cart;
import model.Product;

public interface CartService {

	public void insertCart(Cart vo);
	public List<Cart> listCart(String userId);
	public void deleteCart(int cartId);
	public int sumMoney(String userId);
	public void modifyCart(Cart vo);
	public void updateCart(Cart vo);
	public int countCart(Cart cart);
	public int cartCount(String userid);
//	public List<Product> selectAll(int num);
}
