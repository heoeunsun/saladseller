package model;

public class Cart {
	private int cartId; // 장바구니 번호
	private String userId; // 사용자 아이디
	private int productId; // 상품 번호
	private String productName; // 상품 이름
	private int productPrice; // 상품 단가
	private int amount; // 구매 수량
	private int money; // 상품 가격
	private String productImage; // 상품 이미지

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", userId=" + userId + ", productId=" + productId + ", productName="
				+ productName + ", productPrice=" + productPrice + ", amount=" + amount + ", money=" + money
				+ ", productImage=" + productImage + "]";
	}
}
