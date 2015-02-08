<%@ page import="fr.isima.webdev.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.user.edit" args="[userInstance.username]" /></title>
</head>



<body>

<div id="edit-user" class="content scaffold-edit" role="main">
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${userInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<g:form url="[resource:userInstance, action:'update']" method="PUT"  enctype="multipart/form-data">
		<g:hiddenField name="version" value="${userInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<fieldset class="buttons">
			<div class="row">
				<div class="col-md-10">
				</div>
				<div class="col-md-2">
					<g:actionSubmit class="save btn btn-warning"  action="update" value="${message(code: 'default.user.update', default: 'Update')}" />
				</div>

			</div>
		</fieldset>
	</g:form>
</div>
</body>
</html>
