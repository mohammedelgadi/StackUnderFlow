
<%@ page import="fr.isima.webdev.User" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	.user-row {
		margin-bottom: 14px;
	}

	.user-row:last-child {
		margin-bottom: 0;
	}

	.dropdown-user {
		margin: 13px 0;
		padding: 5px;
		height: 100%;
	}

	.dropdown-user:hover {
		cursor: pointer;
	}

	.table-user-information > tbody > tr {
		border-top: 1px solid rgb(221, 221, 221);
	}

	.table-user-information > tbody > tr:first-child {
		border-top: 0;
	}


	.table-user-information > tbody > tr > td {
		border-top: 0;
	}
	.toppad
	{margin-top:20px;
	}

	.list-custum{
		margin-left: 2%;
		margin-right: 2%;
		margin-top: 2%;
	}


	</style>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title>${userInstance.username}</title>
</head>
<body>

<div class="panel panel-info list-custum">
	<div class="panel-heading">
		<h3 class="panel-title" >${userInstance.username}</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-3 col-lg-3 " align="center">
				<img alt="" src="${userInstance.photoString()}"  height="140" width="140" class="img-circle">
			<g:if test="${userInstance.badges != null && userInstance.badges.size() > 0 }">
				<div class="panel panel-default marg">
					<div class="panel-heading">
						<h3 class="panel-title">badges</h3>
					</div>
					<div class="panel-body">
						<g:each in="${userInstance.badges}" var="badge">
							<span class="badge" >${badge.badge.title}</span>
						</g:each>
					</div>
				</div>
			</g:if>
			</div>



			<div class=" col-md-9 col-lg-9 ">
				<table class="table table-user-information">
					<tbody>
					<g:if test="${userInstance?.username}">
						<tr>
							<td><g:message code="default.user.username"/>:</td>
							<td>${userInstance.username}</td>
						</tr>
					</g:if>
					<g:if test="${userInstance?.firstname}">
						<tr>
							<td><g:message code="default.user.firstname"/>:</td>
							<td>${userInstance.firstname}</td>
						</tr>
					</g:if>
					<g:if test="${userInstance?.lastname}">
						<tr>
							<td><g:message code="default.user.lastname"/>:</td>
							<td>${userInstance.lastname}</td>
						</tr>
					</g:if>
					<g:if test="${userInstance?.bio}">
						<tr>
							<td><g:message code="default.user.bio"/>:</td>
							<td>${userInstance.bio}</td>
						</tr>
					</g:if>
					<g:if test="${userInstance?.mail}">
						<tr>
							<td><g:message code="default.user.email"/>:</td>
							<td aria-labelledby="mail-label">${userInstance.mail}</td>
						</tr>
					</g:if>

					<g:if test="${userInstance?.score}">
						<tr>
							<td>S<g:message code="default.user.score"/>:</td>
							<td>${userInstance.score}</td>
						</tr>
					</g:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div class="panel-footer">
		<g:if test="${user.id == userInstance.id}">
			<g:if test="!${userInstance.authorities.contains('ROLE_ADMIN')}">
				<g:link  data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" action="delete" id="${userInstance.id}"><i class="glyphicon glyphicon-remove"></i></g:link>
			</g:if>
			<g:link  data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning pull-right" action="edit" id="${userInstance.id}"><i class="glyphicon glyphicon-edit"></i></g:link>

		</g:if>
	</div>
</div>

<div class="row list-custum">
	<div class="col-md-4">
		<div>
			<div class="list-group">
				<a href="#" class="list-group-item active">
					<span class="glyphicon glyphicon-question-sign"></span> Questions <span class="badge">${userInstance.listTopics().size()}</span>
				</a>
				<g:each in="${userInstance.listTopics()}" var="topic" >
					<g:link controller="topic" action="show" id="${topic.id}" class="list-group-item">
						<strong>${topic.title}</strong><br>
					${raw(topic.content)}
					</g:link>
				</g:each>

			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div>
			<div class="list-group">
				<a href="#" class="list-group-item active">
					<span class="glyphicon glyphicon-pencil"></span> Responses <span class="badge">${userInstance.listResponses().size()}</span>
				</a>
				<g:each in="${userInstance.listResponses()}" var="response" >
					<g:link controller="topic" action="show" id="${response.question.id}" class="list-group-item">
						<strong>${response.question.title}</strong><br>
						${response.content}
					</g:link>
				</g:each>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div>
			<div class="list-group">
				<a href="#" class="list-group-item active">
					<span class="glyphicon glyphicon-comment"></span> <g:message code="default.user.comments"/> <span class="badge">${userInstance.listComments().size()}</span>
				</a>
				<g:each in="${userInstance.listComments()}" var="comment" >
					<g:link controller="topic" action="show" id="${comment.response.question.id}" class="list-group-item"><strong>${comment.response.question.title}</strong><br>
						${comment.content}
					</g:link>
				</g:each>
			</div>
		</div>
	</div>
</div>




</body>
</html>
