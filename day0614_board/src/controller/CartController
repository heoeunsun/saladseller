package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ProductDao;
import model.Cart;
import model.Product;
import service.CartService;
import service.ProductService;

@Controller
@RequestMapping
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;

	// 1. 장바구니 추가
	@RequestMapping(value = "/productCart")
	public String insert(@ModelAttribute Cart cart, int num, HttpSession session) {

		String userid = (String) session.getAttribute("userid");
		int cat_id = productService.selectCat_id(num);

		cart.setUserId(userid);
		cart.setAmount(1);
		cart.setCartId(cat_id);
		cart.setProductId(num);

		int count = cartService.countCart(cart);
		if (count == 0)cartService.insertCart(cart);
		else cartService.updateCart(cart);
		
		return "redirect:/cartList";
	}

	// 2. 장바구니 목록
	@RequestMapping("/cartList")
	public String list(HttpSession session, Model model) {
		/* 장바구니 카운트 */
		String userid = (String) session.getAttribute("userid");
		int cartCount = cartService.cartCount(userid);
		model.addAttribute("cartCount", cartCount);

		HashMap<String, Object> result = new HashMap<String, Object>();

		List<Cart> list = cartService.listCart(userid); // 장바구니 정보
		// Cart안의 제품번호를 얻어 product 가져옴
		int sumMoney = cartService.sumMoney(userid); // 장바구니 전체 금액 호출

		int fee = sumMoney >= 100000 ? 0 : 2500;
		System.out.println(list);
		result.put("list", list); // 장바구니 정보를 map에 저장
		result.put("count", list.size()); // 장바구니 상품의 유무
		result.put("sumMoney", sumMoney); // 장바구니 전체 금액
		result.put("fee", fee); // 배송금액
		result.put("allSum", sumMoney + fee); // 주문 상품 전체 금액

		System.out.println(result);
		model.addAttribute("result", result);
		return "cartList";
	}

	// 3. 장바구니 삭제
	@RequestMapping("/cartDelete")
	public String delete(@RequestParam int cartId) {
		cartService.deleteCart(cartId);
		return "redirect:/cartList";
	}

	// 4. 장바구니 수정
	@RequestMapping("/cartUpdate")
	public String update(@RequestParam int[] amount, @RequestParam int[] productId, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		// 레코드의 갯수 만큼 반복문 실행
		for (int i = 0; i < productId.length; i++) {
			System.out.println(amount[i]);
			Cart cart = new Cart();
			cart.setUserId(userid);
			cart.setAmount(amount[i]);
			cart.setProductId(productId[i]);
			cartService.modifyCart(cart);
		}
		return "redirect:/cartList";
	}
}
