package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;
import model.Cart;
import model.Product;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;

	// 1. 장바구니 추가
	@Override
	public void insertCart(Cart vo) {
		System.out.println(vo);
		cartDao.insertCart(vo);
	}

	// 2. 장바구니 목록
	@Override
	public List<Cart> listCart(String userid) {
		return cartDao.listCart(userid);
	}

	// 3. 장바구니 삭제
	@Override
	public void deleteCart(int cartId) {
		cartDao.deleteCart(cartId);
	}

	// 4. 장바구니 수정
	@Override
	public void modifyCart(Cart vo) {
		cartDao.modifyCart(vo);
	}

	// 5. 장바구니 금액 합계
	@Override
	public int sumMoney(String userid) {
		return cartDao.sumMoney(userid);
	}

	// 6. 장바구니 상품 확인
	@Override
	public int countCart(Cart cart) {
		return cartDao.countCart(cart);
	}

	// 7. 장바구니 상품 수량 변경
	@Override
	public void updateCart(Cart vo) {
		cartDao.updateCart(vo);
	}
	
	@Override
	public int cartCount(String userid) {
		return cartDao.cartCount(userid);
	}
	
//	@Override
//	public List<Product> selectAll(int num){
//		return cartDao.selectAll(num);
//	}
}