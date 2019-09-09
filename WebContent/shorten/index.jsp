<%@page import="org.jsoup.Jsoup"%>
<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Shorten URL</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Shorten URL Generator</h5>
					<form>
						<div class="form-group">
							<input type="text" id="url" name="url" class="form-control" placeholder="URL *" value="http://" />
						</div>
						<div class="form-group">
							<p id="shortenUrl">shorten url</p>
						</div>
						<div class="form-group">
							<a href="" id="refreshNumber" class="btn btn-info btn-lg btn-block"><i class="fa fa-refresh" aria-hidden="true"></i> GENERATE</a>
						</div>
					</form>
					<script>
						$(function(){
							$("#refreshNumber").on("click",function(e){
								e.preventDefault();
								if($("#url").val()==""){
									alert("url을 입력하세요.");
									$("#url").focus();
									return;
								}
								
								$.ajax({
									type : 'GET',
									url : 'createShortenUrl.jsp?url='+$("#url").val(),
									dataType : 'json',
									success : function(json){
										console.log(json);
										if(json.result=="ok"){
											let imageSrc = json.path;
											$("#img_form_url").attr("src",imageSrc);
										}else{
											alert("Shorten URL이 생성되지 않았습니다.");
										}
									}
								});
							});
						});
					</script>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>