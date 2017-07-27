 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
		<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
			role="banner" style="background-image: url(images/oli-dale-139169.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1>Contact Us</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-5 col-md-push-1 animate-box">

						<div class="fh5co-contact-info">
							<h3>Contact Information</h3>
							<ul>
								<li class="address">서울특별시 종로구 종로2가 9
								</li>
								<li class="phone"><a href="tel://1234567920">+82
										010-0000-0000</a></li>
								<li class="email"><a href="mailto:info@yoursite.com">heoeunsun@naver.com</a></li>
								<li class="url"><a href="index.jsp">saladseller</a></li>
							</ul>
						</div>

					</div>
					<div class="col-md-6 animate-box">
						<h3>Get In Touch</h3>
						<form name="contact" action="mailSend" method="post">
							<div class="row form-group">
								<div class="col-md-6">
									<input type="text" name="fname" id="fname" class="form-control"
										placeholder="Your firstname">
								</div>
								<div class="col-md-6">
									<input type="text" name="lname" id="lname" class="form-control"
										placeholder="Your lastname">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="email" name="email" id="email" class="form-control"
										placeholder="Your email address">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="text" name="subject" id="subject"
										class="form-control"
										placeholder="Your subject of this message">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<textarea name="message" id="message" cols="30" rows="10"
										class="form-control" placeholder="Say something about us"></textarea>
								</div>
							</div>
							<div class="form-group">
								<input type="button" value="Send mail" onclick="check()" class="btn btn-primary">
								<input type="hidden" name="to" value="heoeunsun@naver.com">
							</div>
						</form>
						<script>
							function check() {
								document.contact.submit();
							}
						</script>
					</div>
				</div>

			</div>
		</div>
		

 <div id="googleMap"  class="animate-box"  style="width:100%;height:550px;"></div>

	<!-- Google Map -->
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script> -->

<script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDLFEfChTKIlyHd33POCapQbAEE753NizE">
</script>


 
<script>
var map;
function initialize()
{
  var mapProp = {
    center: new google.maps.LatLng(37.570539, 126.985255),
    zoom:17,
    mapTypeId: google.maps.MapTypeId.ROADMAP
    
  };

  var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);




  function addMarker(feature) {
    var marker = new google.maps.Marker({
      position: feature.position,
      icon: 'images/loc.png',
      map: map
    });
  }

  var features = [
    {
      position: new google.maps.LatLng(37.570539, 126.985255),
      type: 'library'
    }
  ];

  for (var i = 0, feature; feature = features[i]; i++) {
    addMarker(feature);
  }
}


 
google.maps.event.addDomListener(window, 'load', initialize);
</script>
	<!-- Main -->
	<script src="js/main.js"></script>

<%@ include file="/layout/footer.jsp" %>
