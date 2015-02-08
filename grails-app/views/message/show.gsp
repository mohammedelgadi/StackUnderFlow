
<%@ page import="fr.isima.webdev.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-message" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list message">
			
				<g:if test="${messageInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="message.comments.label" default="Comments" /></span>
					
						<g:each in="${messageInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="message.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${messageInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="message.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${messageInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.score}">
				<li class="fieldcontain">
					<span id="score-label" class="property-label"><g:message code="message.score.label" default="Score" /></span>
					
						<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${messageInstance}" field="score"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.votes}">
				<li class="fieldcontain">
					<span id="votes-label" class="property-label"><g:message code="message.votes.label" default="Votes" /></span>
					
						<g:each in="${messageInstance.votes}" var="v">
						<span class="property-value" aria-labelledby="votes-label"><g:link controller="vote" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:messageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${messageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
