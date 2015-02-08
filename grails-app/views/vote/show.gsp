
<%@ page import="fr.isima.webdev.Vote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vote.label', default: 'Vote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vote" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vote">
			
				<g:if test="${voteInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="vote.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="user" action="show" id="${voteInstance?.author?.id}">${voteInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="vote.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${voteInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="vote.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:link controller="message" action="show" id="${voteInstance?.message?.id}">${voteInstance?.message?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="vote.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${voteInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:voteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${voteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
