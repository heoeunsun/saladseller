package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import model.Cart;
import model.Product;

@Repository
public class CartDaoImpl implements CartDao {

	SqlSession sqlSession;

	// 1. 장바구니 추가
	public void insertCart(Cart vo) {
		sqlSession.insert("insertCart", vo);
	}
	// 2. 장바구니 목록

	public List<Cart> listCart(String userId) {
		return sqlSession.selectList("listCart", userId);
	}

	// 3. 장바구니 삭제
	@Override
	public void deleteCart(int cartId) {
		sqlSession.delete("deleteCart", cartId);
	}

	// 4. 장바구니 수정
	@Override
	public void modifyCart(Cart vo) {
		sqlSession.update("modifyCart", vo);
	}

	// 5. 장바구니 금액 합계
	@Override
	public int sumMoney(String userId) {
		sqlSession.selectOne("sumMoney", userId);
		return sqlSession.selectOne("sumMoney", userId);
	}

	// 6. 장바구니 동일한 상품 레코드 확인
	@Override
	public int countCart(Cart cart) {
		System.out.println("여기온당");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productId", cart.getProductId());
		map.put("userId", cart.getUserId());
		return sqlSession.selectOne("countCart", map);
	}

	// 7. 장바구니 상품수량 변경
	@Override
	public void updateCart(Cart vo) {
		sqlSession.update("sumCart", vo);
	}

	@Override
	public int cartCount(String userid) {
		return 0;
	}
	
//	public List<Product> selectAll(int num){
//		return null;
//	}
	
}
