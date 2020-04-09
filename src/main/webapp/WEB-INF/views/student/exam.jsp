<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<style>
#dongho{
	margin:auto;
	font-size:5em;
	font-weight:bold;
	color:red;
	}
.thoigian{
  overflow: hidden; 
              top: 50px;
              left:20px;
              position: fixed;
              width: 20%;
}	
.coppy{
-webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
}
</style>

<script>
var formValues = JSON.parse(localStorage.getItem('formValues')) || {};
var $checkboxes = $("#checkbox-container :checkbox");


function allChecked(){
  return $checkboxes.length === $checkboxes.filter(":checked").length;
}


function updateStorage(){
  $checkboxes.each(function(){
    formValues[this.id] = this.checked;
  });

  localStorage.setItem("formValues", JSON.stringify(formValues));
}



$checkboxes.on("change", function(){
  updateStorage();
});

// On page load
$.each(formValues, function(key, value) {
  $("#" + key).prop('checked', value);
});


</script>


<script language="JavaScript">
    window.onload = function() {
        document.addEventListener("contextmenu", function(e) {
            e.preventDefault();
        }, false);
        document.addEventListener("keydown", function(e) {
            //document.onkeydown = function(e) {
            // "I" key
            if (e.ctrlKey && e.shiftKey && e.keyCode == 73) {
                disabledEvent(e);
            }
            // "J" key
            if (e.ctrlKey && e.shiftKey && e.keyCode == 74) {
                disabledEvent(e);
            }
            // "S" key + macOS
            if (e.keyCode == 83 && (navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey)) {
                disabledEvent(e);
            }
            // "U" key
            if (e.ctrlKey && e.keyCode == 85) {
                disabledEvent(e);
            }
            // "F12" key
            if (event.keyCode == 123) {
                disabledEvent(e);
            }
        }, false);
 
        function disabledEvent(e) {
            if (e.stopPropagation) {
                e.stopPropagation();
            } else if (window.event) {
                window.event.cancelBubble = true;
            }
            e.preventDefault();
            return false;
        }
    };
</script>
<div class="coppy">
<div class="gallery-cont text-center pb-5" id="gallery">
	</br> </br> </br> </br> </br> </br> </br>
	
		<h1 style="color: #424242;size: 30px;">Trắc nghiệm ${subject.name }</h1>
	</div>
	<div class="container">
		<div>
			<form
				action="${pageContext.request.contextPath }/student/seeResult"
				method="post"  name="qrcodeRedirectForm">
				<div class="panel panel-default col-8 " style="margin: auto;">
				<c:forEach var="question" items="${sessionScope.questions }">
					 <div class="panel-heading">
						<p><b style="color: black;">${question.text }</b></p>
					</div>
					<c:forEach var="questionSub" items="${question.getQuestionSubs() }" varStatus="a">
						<div class="panel-body">
						<h4>
							<input type="checkbox"  id="option${a.index+1 }" name="selectedQuestionSubsID"
								value="${questionSub.id }"> ${questionSub.text }<br></h4>
						</div>
					</c:forEach>
					<br>
				</c:forEach>
				<br>
				<div style="margin: auto;">
				<button type="submit" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal">Complete</button></div>
					<br>
				</div>
				<br>
				
				<div class="container">
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">

									<h4 class="modal-title">Confirm</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<p>Are you sure?</p>
								</div>
								<div class="modal-footer">
									<input type="submit" value="OK" class="btn btn-default">
								</div>
							</div>

						</div>
					</div>

				</div>
			</form>
		</div>

    
	</div>
	
			<div class="thoigian">
		
        <div id="dongho">
</div>
</div>
</div>
	<script>
 
var total =${sessionScope.countdown };

var s =60;
function demnguoc(){
	total--;
	var m =parseInt(total/s);
	if(total !=0){
		document.getElementById("dongho").innerHTML ="Time left: "+m + ":"+ parseInt(total-(m*s));
		setTimeout("demnguoc()",1000);
		}
			else{
				document.getElementById("dongho").innerHTML = "Out of time";

            window.setTimeout('document.qrcodeRedirectForm.submit()')
				}
	}
	demnguoc();
</script>