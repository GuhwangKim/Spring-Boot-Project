<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="utf-8" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-free">
<head>
	<meta charset="utf-8" />
	<title>어드민 | 비숲</title>
	<jsp:include page="A_head.jsp"/>
</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<jsp:include page="A_menu.jsp"/>

			<!-- Layout container -->
			<div class="layout-page">

				<!-- Content wrapper -->
				<div class="content-wrapper">

					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">공지사항 등록</h4>
						<div class="card">
							<!-- Account -->
							<div class="card-body">
								
	<form action="aSwFaqwrite" method="post">
	   <table width="500" border="1">
			<tr>
				<td> (Q)질문 </td>
				<td> <input type="text" name="board_title" size = "50"> </td>
			</tr>
			<tr>
				<td> (A)답변 </td>
				<td> <input type="text" name="board_content" size = "50"> </td>
			</tr>
			<tr>
				<td>게시글 유형</td>
				<td> <select name="board_category">
								<option value="1" selected="selected">회원정보문의</option>
								<option value="2">주문 및 결제 문의</option>
								<option value="3">배송문의</option>
								<option value="4">교환 및 반품 문의</option>
												</select>									
											</td>
										</tr>
			<tr >
				<td colspan="2"> 
				<input type="submit" value="입력"> &nbsp;&nbsp; 
				<input type="button" value="목록" 
						onclick="location.href='aSwFaqList'"></td>
			</tr>
	   </table>
	</form>
							
							</div>
							<!-- /Account -->
						</div>
					</div>
					<!-- / Content -->

					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

	<jsp:include page="A_footer.jsp"/>
</body>
</html>