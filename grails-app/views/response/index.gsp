
<%@ page import="fr.isima.webdev.Response" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'response.label', default: 'Response')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-response" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-response" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="response.author.label" default="Author" /></th>
					
						<g:sortableColumn property="content" title="${message(code: 'response.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'response.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="isAccepted" title="${message(code: 'response.isAccepted.label', default: 'Is Accepted')}" />
					
						<g:sortableColumn property="score" title="${message(code: 'response.score.label', default: 'Score')}" />
					
						<th><g:message code="response.topic.label" default="Topic" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${responseInstanceList}" status="i" var="responseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${responseInstance.id}">${fieldValue(bean: responseInstance, field: "author")}</g:link></td>
					
						<td>${fieldValue(bean: responseInstance, field: "content")}</td>
					
						<td><g:formatDate date="${responseInstance.date}" /></td>
					
						<td><g:formatBoolean boolean="${responseInstance.isAccepted}" /></td>
					
						<td>${fieldValue(bean: responseInstance, field: "score")}</td>
					
						<td>${fieldValue(bean: responseInstance, field: "topic")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${responseInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
