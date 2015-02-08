<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.user.signup"/></title>
</head>
<body>
<div id="create-user" class="content scaffold-create" role="main">

	<h1 align="center"><g:message code="default.user.signup" /></h1>
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
	<g:form url="[resource:userInstance, action:'save']"  enctype="multipart/form-data">
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<fieldset class="buttons ">
			<div class="row">
				<div class="col-md-10">
				</div>
				<div class="col-md-2">
					<g:submitButton name="create" class="save btn btn-success" value="${message(code: 'default.user.signup', default: 'Create')}"  />

				</div>

			</div>
		</fieldset>
	</g:form>
</div>
</body>
</html>
