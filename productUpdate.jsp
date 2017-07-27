<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#file").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#p_image').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

<c:set var="cat_id" value="${product.cat_id}" />
<c:choose>
	 <c:when test="${cat_id eq '1'}">
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/chris-lawton-165884.jpg);">
	</c:when>
	<c:when test="${cat_id eq '2'}">
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/jez-timms-90838.jpg);">
	</c:when>
	<c:otherwise>
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image: url(images/img_33.jpg);">
	</c:otherwise>
</c:choose>
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
						<h1>Update product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

		<div id="fh5co-contact">
			<div class="container-fluid">
				<div class="col-md-12 animate-box">
		<div class="fh5co-contact-info">
					<h1>Update product</h1>
		<form name="frm" method ="post" action ="update?num=${product.p_num}" enctype="multipart/form-data" runat="server">
			<div class="row form-group">
			<div class="col-md-6">
			<table>
				<tr>
					<td><input type="text" id="p_name" name="p_name" class="form-control" placeholder="product name" value="${product.p_name}"></td>
				</tr>
				<tr>
					<td><input type="file" id="file" name="file" class="form-control">
						<input type="hidden" name="image" value="${product.image}"></td>
				</tr>
				<tr>
					<td><img src="${product.image}" id="p_image" alt="user" width="500px"></td>
				</tr>
				<tr>
					<td><textarea rows="15" id="descript" cols="70" name="descript" class="form-control" placeholder="description" >${product.descript}</textarea></td>
				</tr>
				<tr>
					<td>
						<textarea rows="15" id="specification" cols="70" name="specification" class="form-control" placeholder="specification">${product.specification}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="price" name="price" class="form-control" placeholder="price"  value="${product.price}">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="stock" name="stock" class="form-control" placeholder="stock" value="${product.stock}">
					</td>
				</tr>
			</table>
			<br>
			<div class="button-group">
				<input type="submit" class="btn btn-primary" value="submit" onclick="return boardCheck()">
				<input type="reset" value="reset" class="btn btn-primary">
				<input type="button" value="list" class="btn btn-primary" onclick="location.href='productList?cat_id=${product.cat_id}'">
			</div>
			</div>
			</div>
		</form>
		</div>
			</div>
		</div>
		
		</div>
<script src="js/board.js"></script>
<%@ include file="/layout/footer.jsp"%>