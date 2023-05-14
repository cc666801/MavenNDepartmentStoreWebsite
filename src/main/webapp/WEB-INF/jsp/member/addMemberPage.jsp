<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>註冊會員</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<!-- 自訂 CSS -->
<style>
body {
	background-color: #f7f7f7;
}

.card {
	margin-top: 50px;
	margin-bottom: 50px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}
</style>
<!-- 引入 Bootstrap 的 CSS 文件 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- 引入 Bootstrap 的 JavaScript 文件 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="col-auto">
						<a href="${contextRoot}/"
							class="btn btn-link text-decoration-none">首頁</a>
					</div>
					<div class="card-header bg-info text-white">
						<h4 class="mb-0">註冊會員</h4>
					</div>
					<div class="card-body">
						<form:form name="myForm" method="post"
							action="${contextRoot}/member/post" modelAttribute="member"
							onsubmit="return checkForm();">

							<c:if test="${not empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
							</c:if>



							<div class="form-group">
								<label for="name">姓名：</label>
								<form:input path="name" id="name" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="account">帳號：</label>
								<form:input path="account" id="account" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="password">密碼：</label>
								<form:password path="password" id="password"
									cssClass="form-control" required="required" />
							</div>
							<div class="form-group">
								<label for="email">Email：</label>
								<form:input path="email" id="email" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="phone">電話：</label>
								<form:input path="phone" id="phone" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="address">地址：</label>
								<form:input path="address" id="address" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="birthday">生日：</label>
								<form:input type="date" path="birthday" id="birthday"
									cssClass="form-control" />
							</div>
							<div class="form-group form-check text-center">
								<input type="checkbox" class="form-check-input"
									id="privacyCheck" required> <label
									class="form-check-label" for="privacyCheck"> 我已經詳細閱讀並同意
									<a href="#" id="privacyLink">隱私權政策</a>
								</label>
							</div>

							<input type="submit" class="btn btn-info btn-block" value="註冊">
						</form:form>
					</div>
				</div>
				<p class="text-center">
					已經有帳號了嗎？<a href="${contextRoot}/member/login">立即登入</a>
				</p>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
	<script>
		function checkForm() {
			var name = document.forms["myForm"]["name"].value;
			var account = document.forms["myForm"]["account"].value;
			var password = document.forms["myForm"]["password"].value;
			var email = document.forms["myForm"]["email"].value;
			var phone = document.forms["myForm"]["phone"].value;
			var address = document.forms["myForm"]["address"].value;
			var birthday = document.forms["myForm"]["birthday"].value;
			var privacyCheck = document.getElementById("privacyCheck").checked;

			if (!privacyCheck) {
				alert("請勾選同意隱私權政策");
				return false;
			}

			if (name == "" || account == "" || password == "" || email == ""
					|| address == "" || phone == "" || password == "") {
				alert("欄位不可為空");
				return false;
			}
			var nameRegex = /^[\u4E00-\u9FA5A-Za-z]{1,10}$/;
			if (!nameRegex.test(name)) {
				alert("姓名必須為中英文，最多 10 個字");
				return false;
			}

			var accountRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$/;
			if (!accountRegex.test(account)) {
				alert("帳號必須為英文和阿拉伯數字混合");
				return false;
			}

			var emailRegex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
			if (!emailRegex.test(email)) {
				alert("Email 格式不正確");
				return false;
			}

			var addressRegex = /^[\u4E00-\u9FA5]+$/;
			if (!addressRegex.test(address)) {
				alert("地址必須為中文，最多 50 個字");
			


			var phoneRegex = /^[0-9]{10}$/;
			if (!phoneRegex.test(phone)) {
				alert("電話必須為 10 個阿拉伯數字");
				return false;
			}

			var passwordRegex = /^[a-zA-Z0-9]{1,20}$/;
			if (!passwordRegex.test(password)) {
				alert("密碼必須為英文字母和數字，最多 20 個字");
				return false;
			}

			return true;

		}
	</script>
	<script>
    document.getElementById('privacyLink').addEventListener('click', function(){
        $('#privacyModal').modal('show');
    });
</script>
	<script>document.getElementById('privacyCheck').addEventListener('click', function(){$('#myModal').modal('show');});</script>
	<!-- jQuery -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
	<script>
    document.getElementById('privacyLink').addEventListener('click', function(){
        $('#privacyModal').modal('show');
    });
</script>

	<!-- 隱私權保護政策模態框 -->
	<div class="modal fade" id="privacyModal" tabindex="-1" role="dialog"
		aria-labelledby="privacyModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="privacyModalLabel">隱私權保護政策</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 隱私權保護政策內容 -->
					<h1>非常歡迎您光臨「Mavenn網站」（以下簡稱本網站）</h1>
					<p>為了讓您能夠安心的使用本網站的各項服務與資訊，特此向您說明本網站的隱私權保護政策，以保障您的權益，請您詳閱下列內容：</p>
					<h2>一、隱私權保護政策的適用範圍</h2>
					<p>隱私權保護政策內容，包括本網站如何處理在您使用網站服務時收集到的個人識別資料。隱私權保護政策不適用於本網站以外的相關連結網站，也不適用於非本網站所委託或參與管理的人員。</p>
					<h2>二、個人資料的蒐集、處理及利用方式</h2>
					<ul>
						<li>當您造訪本網站或使用本網站所提供之功能服務時，我們將視該服務功能性質，請您提供必要的個人資料，並在該特定目的範圍內處理及利用您的個人資料；非經您書面同意，本網站不會將個人資料用於其他用途。</li>
						<li>本網站在您使用服務信箱、問卷調查等互動性功能時，會保留您所提供的姓名、電子郵件地址、聯絡方式及使用時間等。</li>
						<li>於一般瀏覽時，伺服器會自行記錄相關行徑，包括您使用連線設備的 IP
							位址、使用時間、使用的瀏覽器、瀏覽及點選資料記錄等，做為我們增進網站服務的參考依據，此記錄為內部應用，決不對外公佈。</li>
						<li>為提供精確的服務，我們會將收集的問卷調查內容進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。</li>
						<li>您可以隨時向我們提出請求，以更正或刪除本網站所蒐集您錯誤或不完整的個人資料。</li>
					</ul>
					<h2>三、資料之保護</h2>
					<ul>
						<li>本網站主機均設有防火牆、防毒系統等相關的各項資訊安全設備及必要的安全防護措施，加以保護網站及您的個人資料採用嚴格的保護措施，只由經過授權的人員才能接觸您的個人資料，相關處理人員皆簽有保密合約，如有違反保密義務者，將會受到相關的法律處分。</li>
						<li>如因業務需要有必要委託其他單位提供服務時，本網站亦會嚴格要求其遵守保密義務，並且採取必要檢查程序以確定其將確實遵守。</li>
					</ul>
					<h2>四、網站對外的相關連結</h2>
					<p>本網站的網頁提供其他網站的網路連結，您也可經由本網站所提供的連結，點選進入其他網站。但該連結網站不適用本網站的隱私權保護政策，您必須參考該連結網站中的隱私權保護政策。</p>
					<h2>五、與第三人共用個人資料之政策</h2>
					<p>本網站絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。</p>
					<p>前項但書之情形包括不限於：</p>
					<ul>
						<li>經由您書面同意。</li>
						<li>法律明文規定。</li>
						<li>為免除您生命、身體、自由或財產上之危險。</li>
						<li>與公務機關或學術研究機構合作，基於公共利益為統計或學術研究而有必要，且資料經過提供者處理或蒐集者依其揭露方式無從識別特定之當事人。</li>
						<li>當您在網站的行為，違反服務條款或可能損害或妨礙網站與其他使用者權益或導致任何人遭受損害時，經網站管理單位研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。</li>
						<li>有利於您的權益。</li>
						<li>本網站委託廠商協助蒐集、處理或利用您的個人資料時，將對委外廠商或個人善盡監督管理之責。</li>
					</ul>
					<h2>六、Cookie 之使用</h2>
					<p>為了提供您最佳的服務，本網站會在您的電腦中放置並取用我們的 Cookie，若您不願接受 Cookie
						的寫入，您可在您使用的瀏覽器功能項中設定隱私權等級為高，即可拒絕 Cookie 的寫入，但可能會導致網站某些功能無法正常執行。</p>
					<h2>七、隱私權保護政策之修正</h2>
					<p>本網站隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

