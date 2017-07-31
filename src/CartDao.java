package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.Cart;
import model.Product;

@Repository
public interface CartDao {

	// 1. 장바구니 추가
	public void insertCart(Cart vo);
	// 2. 장바구니 목록

	public List<Cart> listCart(String userId);

	// 3. 장바구니 삭제
	public void deleteCart(int cartId);
	// 4. 장바구니 수정

	public void modifyCart(Cart vo);
	// 5. 장바구니 금액 합계

	public int sumMoney(String userId);
	// 6. 장바구니 동일한 상품 레코드 확인

	public int countCart(Cart cart);
	// 7. 장바구니 상품수량 변경

	public void updateCart(Cart vo);

	public int cartCount(String userid);
	
//	public List<Product> selectAll(int num);
	
}
