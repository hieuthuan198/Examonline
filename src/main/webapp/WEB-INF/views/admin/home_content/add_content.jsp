<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="inner-block">
<div class="inbox-details-body">
							<div class="alert alert-info">
								Please fill details to send a new message
							</div>
					
							<form class="com-mail">
								<input type="text" value="Title:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'To';}">
								<textarea rows="6" value="Description 1" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">Description 1</textarea>
								
								<textarea rows="6" value="Message :" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Description 1</textarea>
								<div class="form-group">
									<div class="btn btn-default btn-file">
										<i class="fa fa-paperclip"> </i> Attachment
										<input type="file" name="attachment">
									</div>
								</div>
								<input type="submit" value="Add Content"> 
										<button><a href="${pageContext.request.contextPath }/admin/homecontent/">Back</a></button>	
							</form>
						</div>
						</div>