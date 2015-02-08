
<%@ page import="fr.isima.webdev.User" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	.stylish-panel {
		padding: 20px 0;
		text-align: center;
	}
	.stylish-panel > div > div{
		padding: 10px;
		border: 1px solid transparent;
		border-radius: 4px;
		transition: 0.2s;
	}
	.stylish-panel > div:hover > div{
		margin-top: -10px;
		border: 1px solid rgb(200, 200, 200);
		box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 5px 2px;
		background: rgba(200, 200, 200, 0.1);
		transition: 0.5s;
	}

	.stylish-panel > div:hover img {
		border-radius: 50%;
		-webkit-transform: rotate(360deg);
		-moz-transform: rotate(360deg);
		-o-transform: rotate(360deg);
		-ms-transform: rotate(360deg);
		transform: rotate(360deg);
	}
	</style>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.user.title.index"/></title>
</head>
<body>
<br>
<div class="container">
	<g:each in="${userlist}" var="list">
		<div class="row stylish-panel">
			<g:each in="${list}" var="userInstance">

				<div class="col-md-3">
					<div>
						<img alt="" src="${userInstance.photoString()}"  height="200" width="200" class="img-circle img-thumbnail">
						<h2>${userInstance.username}</h2>
						<p>${userInstance.bio}
						</p>
						<g:link  class="btn btn-primary" action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link>

					</div>
				</div>
			</g:each>

		</div>

	</g:each>
</div>


</body>
</html>
