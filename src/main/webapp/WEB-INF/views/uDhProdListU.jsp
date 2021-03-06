<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<link href="css/common.css" rel="stylesheet" type="text/css">
<link href="css/product.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
	<div id="wrap">
	
		<jsp:include page="/WEB-INF/views/header.jsp"/>
		
		<!-- ----------------------------------------------------------------------main시작----------------------------------- -->
		<div class="margin_wrap">
			<div class="main">
						
				<h2 class="hr">${cg}</h2>
				
				<c:if test="${cg == 'ALL'}"><p>Total ${total}</p></c:if>
				<c:if test="${cg != 'ALL'}"><p>Total ${cateTotal}</p></c:if>
				
				<div class="prod_wrap">
					<ul class="clearfix">
						<!-- 상품 리스트 -->
						<c:if test="${cg == 'ALL'}">
							<c:forEach var="product" items="${prodList}">
								<li class="prod_list">
									<a href="prodDetail?prodno=${product.prodno}">
										<div class="prod_th_img">
											<img alt="상품이미지" src="../upload/${product.th_img}">
										</div>
										<div>
											<p class="brand_name">${product.brand_name}</p> 
											<p class="prod_name">${product.prod_name}</p>
										</div>
										<div class="price">
											<c:if test="${product.dc_rate > 0}">
												<span>${product.dc_rate}%</span>
												<span><fmt:formatNumber value="${product.sale_price}" pattern="###,###,###"/>원</span>
												<span><fmt:formatNumber value="${product.prod_price}" pattern="###,###,###"/>원</span>
											</c:if>
											<c:if test="${product.dc_rate == 0}">
												<span></span>
												<span><fmt:formatNumber value="${product.sale_price}" pattern="###,###,###"/>원</span>
												<span></span>
											</c:if>
										</div>
									</a>
									<div class="like">
										<button></button>
									</div>
								</li>
							</c:forEach>
						</c:if>
						
						<c:if test="${cg != 'ALL'}">
							<c:forEach var="product" items="${prodCateList}">
								<li class="prod_list">
									<a href="prodDetail?prodno=${product.prodno}">
										<div class="prod_th_img">
											<img alt="상품이미지" src="../upload/${product.th_img}">
										</div>
										<div>
											<p class="brand_name">${product.brand_name}</p> 
											<p class="prod_name">${product.prod_name}</p>
										</div>
										<div class="price">
											<c:if test="${product.dc_rate > 0}">
												<span>${product.dc_rate}%</span>
												<span><fmt:formatNumber value="${product.sale_price}" pattern="###,###,###"/>원</span>
												<span><fmt:formatNumber value="${product.prod_price}" pattern="###,###,###"/>원</span>
											</c:if>
											<c:if test="${product.dc_rate == 0}">
												<span></span>
												<span><fmt:formatNumber value="${product.sale_price}" pattern="###,###,###"/>원</span>
												<span></span>
											</c:if>
										</div>
									</a>
									<div class="like">
										<button></button>
									</div>
								</li>
							</c:forEach>
						</c:if>
						
						<!-- 상품 리스트 -->
					</ul>
				</div>
			</div>
		</div>
		<!-- ----------------------------------------------------------------------main끝----------------------------------- -->
		 
		<jsp:include page="/WEB-INF/views/footer.jsp"/>
		
	</div> <!-- wrap -->
</body>
</html>