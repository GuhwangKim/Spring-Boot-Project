<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String context = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="utf-8" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="UTF-8">
<title>배송/판매(배송처리)</title>
<jsp:include page="A_head.jsp"/>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
	
<style type="text/css">
	.search th{
		float: right;
	}

	.miainT th{
		text-align: center;
    	padding-right: 10px;
    	padding-left: 0px;
		
	}
	.table-borderless a:hover{
		color: red;
		font-weight: bold;
	}

	.table main{
		border-bottom: 1px;
		border-left: none;
		border-right: none;
		border-top: none;
	}
	
	#px td{
    	padding-right: 10px;
    	padding-left: 0px;	
	}
	
</style>	

<script type="text/javascript">
	function getDel(Vdeptno) {
		alert("Vdeptno->"+Vdeptno)
		$.ajax(
			{
				url:"<%=context%>/jhGetDelSeqA",
				data:{payno:Vdeptno},
				dataType:'text',
				success:function(data){
					alert("data->"+data);
					$('#deliveryno'+Vdeptno).val(data);
				}
			}		
		)
		
	}
	
	function getDelEnt(Payno) {
		alert("Payno->"+Payno)
		var payno=Payno;
		var deliveryno=$('#deliveryno'+payno).val();
		alert("Vdeptno->"+payno)
		$.ajax(
			{
				url:"<%=context%>/jhPaymentUpdDelA",
				data:{payno:payno, deliveryno:deliveryno},
				dataType:'text',
				success:function(data){
					alert("주문번호 "+data+" 운송장 번호 등록 완료");
					$('.tr'+Payno).remove();
				}
			}
		)
	}
</script>
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
						<h4 class="fw-bold py-3 mb-4">배송/판매(배송처리)</h4>
						<div class="card">
							
							
							
							<!-- Account -->
							<div class="card-body">
								<table class="table table-borderless" border="1" style="margin-bottom: 40px; text-align: center;">
									<tr>
										<td><a href="jhDelivListA" >배송처리</a></td>
										<td><a href="jhSelListA">판매목록</a></td>
									</tr>
								</table>
								<form action="jhDelivSearchA">
								<input type="hidden" name="currentPage" value="${pg.currentPage }">
									<table class="table table-borderless" border="1">
										<tr class="search">
											<th>검색어</th>
											<td>
												<select name="search" style="height: 29px;" >
													<option value="s_payno">주문번호</option>
													<option value="s_name">주문자 이름</option>
												</select>
												<input type="text" name="keyword1" >
												<%-- 초기화 하려고 뺌 새로고침 할 때 가지고 가려면 있어야함 value=${keyword1 } --%>
											</td>
										<tr class="search">
											<th>결제일</th>
											<td>
												<input type="date" name="sdate">
												<input type="date" name="edate">
											</td>
										</tr> 
									</table>
									<div style="text-align: center;margin-top: 10px;" >
										<input type="submit" value="검색" class="btn btn-primary">
										<button onclick="location.href='jhDelivListA'" class="btn btn-light">초기화</button>
									</div>
								</form>
								<br>
								<br>
								<br>
								<c:choose>	
									<c:when test="${not empty listPayed }">
										<table class="table main">
											<tr class="miainT">
												<th>번호</th><th>주문일(결제일)</th><th>주문번호</th><th>운송장번호</th><th>주문자</th><th>상품명</th><th>수량</th><th>배송지정보</th><th>총결제금액</th>
											</tr>
											<c:forEach var="list" items="${listPayed}" varStatus="status">
												<!--1. status.index == 0 처음 시작일 때 무조건   보여줌 -->
										    	<tr class="tr${list.payno }" id="px">	
												    <c:if test="${status.index == 0}">	
													<c:set var="num" value="${pg.start }"></c:set>
											    		<td>${num }</td>							
										    			<td>${list.pay_date }</td>
														<td>${list.payno }</td>
														<td>
															<input type="text" id="deliveryno${list.payno }"  style="margin-bottom: 10px; width: 100px;">
															<input type="button" class="btn btn-primary btn-sm" id="delseqCall" value="송장번호호출" onclick="getDel(${list.payno })">
															<input type="button" class="btn btn-success btn-sm" id="delseqEnt" value="송장번호입력" onclick="getDelEnt(${list.payno })">
														</td>
														<td>${list.name }</td>
														<td>${list.prod_name }</td>
												        <td>${list.buy_qty }</td>
														<td>
															수령인 : ${list.rec_name } <br>
															배송지 정보 : ${list.del_address } <br>
															${list.del_daddress }
														</td>
														<td><fmt:formatNumber value="${list.real_amount }" pattern="###,###,###"/></td>
														<!-- 다시 다음 줄 비교를 위해 -->
														<c:set var="payno" value="${list.payno}" />
														<c:set var="num" value="${num+1}"></c:set>	
													</c:if>
												</tr>
												
												<c:choose>
										     	<c:when test="${status.index > 0 }">
										        <!-- 2-1. 처음 값이 아닐 때 payno중복되면 안보여줌 -->
													<c:if test="${list.payno eq payno}">
														<tr class="tr${list.payno }" id="px">	
													 		<td></td>   
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>${list.prod_name }</td>
															<td>${list.buy_qty }</td>
															<td></td>
															<td></td>
															<c:set var="payno" value="${list.payno}"/>
														</tr>
													</c:if>
											        <!-- 2-2. 처음 값이 아닐 때 중복되지 않는 payno일 땐 보여줌 -->
										    		<c:if test="${list.payno ne  payno}">
												    	<tr class="tr${list.payno }" id="px">
												    		<hr>
												    		<td>${num }</td>   
															<td>${list.pay_date } </td>
															<td>${list.payno }</td>
															<td>
																<input type="text" id="deliveryno${list.payno }">
																<input type="button" class="btn btn-primary btn-sm" id="delseqCall" value="송장번호호출" onclick="getDel(${list.payno })">
																<input type="button" class="btn btn-success btn-sm" id="delseqEnt" value="송장번호입력" onclick="getDelEnt(${list.payno })">
															</td>
															<td>${list.name }</td>
															<td>${list.prod_name }</td>
												            <td>${list.buy_qty }</td>
															<td>
																수령인 : ${list.rec_name } <br>
																배송지 정보 : ${list.del_address } <br>
																${list.del_daddress }
															</td>
															<td><fmt:formatNumber value="${list.real_amount }" pattern="###,###,###"/></td>
															<!-- 다시 다음 줄 비교를 위해 -->
															<c:set var="payno" value="${list.payno}" />
															<c:set var="num" value="${num+1}"></c:set>
														</tr>
														<hr>
													</c:if>
												</c:when>
												</c:choose>
											</c:forEach>
										</table>
									</c:when>
									<c:otherwise>
										검색 결과 없음
									</c:otherwise>
								</c:choose>
								
								
							<%-- 	<c:if test="${pg.startPage > pg.pageBlock }">
									<a href="jhDelivSearchA?currentPage=${pg.startPage-pg.pageBlock }">[이전]</a>
								</c:if>
								
								<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
									<a href="jhDelivSearchA?currentPage=${i}&keyword=${keyword1 }">[${i}]</a>
								</c:forEach>
								
								<c:if test="${pg.endPage < pg.totalPage }">
									<a href="jhDelivSearchA?currentPage=${pg.startPage+pg.pageBlock }">[다음]</a>
								</c:if> --%>
								
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