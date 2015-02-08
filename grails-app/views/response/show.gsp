
<%@ page import="fr.isima.webdev.Response" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'response.label', default: 'Response')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-response" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-response" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list response">
			
				<g:if test="${responseInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="response.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="user" action="show" id="${responseInstance?.author?.id}">${responseInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${responseInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="response.comments.label" default="Comments" /></span>
					
						<g:each in="${responseInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${responseInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="response.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${responseInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${responseInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="response.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${responseInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${responseInstance?.isAccepted}">
				<li class="fieldcontain">
					<span id="isAccepted-label" class="property-label"><g:message code="response.isAccepted.label" default="Is Accepted" /></span>
					
						<span class="property-value" aria-labelledby="isAccepted-label"><g:formatBoolean boolean="${responseInstance?.isAccepted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${responseInstance?.score}">
				<li class="fieldcontain">
					<span id="score-label" class="property-label"><g:message code="response.score.label" default="Score" /></span>
					
						<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${responseInstance}" field="score"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${responseInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="response.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${responseInstance?.topic?.id}">${responseInstance?.topic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${responseInstance?.votes}">
				<li class="fieldcontain">
					<span id="votes-label" class="property-label"><g:message code="response.votes.label" default="Votes" /></span>
					
						<g:each in="${responseInstance.votes}" var="v">
						<span class="property-value" aria-labelledby="votes-label"><g:link controller="vote" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:responseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${responseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
