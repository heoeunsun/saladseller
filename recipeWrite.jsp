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
<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
	role="banner" style="background-image: url(images/111.jpg);">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="display-t">
					<div class="display-tc animate-box" data-animate-effect="fadeIn">
						<h1>Add recipe</h1>
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
					<h1>Add recipe</h1>
					
		<form name="frm" method = "post" action ="recipeWrite" enctype="multipart/form-data">
			<div class="row form-group">
			<div class="col-md-6">
			<table>
				<tr>
					<td><input type="text" name="title" class="form-control" placeholder="title"></td>
				</tr>
				<tr>
					<td><input type="text" name="name" class="form-control" value="${userid}" readonly="readonly"></td>
				</tr>				
				<tr>
					<td><input type="file" id="file" name="file" class="form-control"></td>
				<tr>
				<tr>
					<td><img src="images/google.jpg" id="p_image" alt="user"  width="500px"></td>
				</tr>
				<tr>
					<td><textarea rows="15" cols="70" name="content1" class="form-control" placeholder="meterial"></textarea></td>
				</tr>
				<tr>
					<td><textarea rows="15" cols="70" name="content2" class="form-control" placeholder="recipe"></textarea></td>
				</tr>
			</table>
			<br>
			<div class="button-group">
				<input type="submit" class="btn btn-primary" value="submit" onclick="return recipeCheck()">
				<input type="reset" value="reset" class="btn btn-primary">
				<input type="button" value="list" class="btn btn-primary" onclick="location.href='recipe'">
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