<%@ page import="fr.isima.webdev.Topic" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
		<title>${topicInstance.title}</title>

	</head>
	<body>
	<div class="container">
		<h2><g:message code="label.Topic.newTopic"/></h2>

	<g:if test="${topicInstance.content == null}">
			<ul class="errors" role="alert">
				<div class="alert alert-danger" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
					<span class="sr-only">Has error:</span>
						The content has not to be null
				</div>
			</ul>
	</g:if>
		<g:form class="form-horizontal" role="form" action="updateTopic" controller="topic">
			<g:hiddenField name="idTopic" value="${topicInstance.id}"></g:hiddenField>
			<div class="form-group">
				<label class="control-label col-sm-2" ><g:message code="default.topic.title"/> :</label>
				<div class="col-sm-10">
					<input type="text" name="title" class="form-control" value="${topicInstance.title}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd"><g:message code="default.topic.content"/>:</label>
				<div class="col-sm-10">
					<ckeditor:editor name="content" id="pwd" height="400px" width="80%">
						${topicInstance.content}
					</ckeditor:editor>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<g:submitButton  name="send" content="${message(code:'default.submit')}"  class="btn btn-default"/>
				</div>
			</div>

		</g:form>
	</div>
	</body>
</html>


