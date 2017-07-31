function boardCheck(file) {


	if (document.frm.p_name.value.length == 0) {
		alert("제품명을 입력하세요");
		return false;
	}
	if (document.frm.file.files[0].size == 0) {
		alert("제품사진을 첨부하세요.");
		return false;
	}
	if (document.frm.descript.value.length == 0) {
		alert("제품설명을 입력하세요");
		return false;
	}
	if (document.frm.specification.value.length == 0) {
		alert("제품특징을 입력하세요");
		return false;
	}
	if (document.frm.price.value.length == 0) {
		alert("가격을 입력하세요");
		return false;
	}
	if (document.frm.stock.value.length == 0) {
		alert("재고를 입력하세요");
		return false;
	}
//
//	if (typeof document.frm.stock.value !== "number") {
//		alert("재고는 숫자로 입력하세요.");
//		return false;
//	}
//	
//	if (typeof document.frm.price.value !== "int") {
//		alert("가격은 숫자로 입력하세요.");
//		return false;
//	}
	
	else {
		alert("제품이 정상적으로 등록 되었습니다.");
		return true;
	}
	return true;
}

function deleteCheck() {
	var returnValue = confirm("해당 상품을 삭제하시겠습니까?");
	if(returnValue){
		return true;
	}else{
		return false;
	}
}

function cartCheck() {
	var returnValue = confirm("장바구니에 담으시겠습니까?");
	if(returnValue){
		return true;
	}else{
		return false;
	}
}


function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}

function joinCheck() {
	alert("진입");
	if (document.joinForm.id.value=='') {
		alert("아이디를 입력하세요.");
		return false
	}
	if (document.joinForm.pw.value=='') {
		alert("비밀번호를 입력하세요.");
		return false
	}
	if (document.joinForm.email.value=='') {
		alert("비밀번호를 입력하세요.");
		return false
	}
	if (document.joinForm.addr.value=='') {
		alert("배송받을 주소를 입력하세요.");
		return false
	}
	if (document.joinForm.phone.value=='') {
		alert("연락처를 입력하세요.");
		return false
	}
	return true;
}