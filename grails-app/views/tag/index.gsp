
<%@ page import="fr.isima.webdev.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:stylesheet src="bootstrap.min.css"/>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<asset:javascript src="application.js"></asset:javascript>
	</head>
	<body>

	<div class="container">
		<div class="col-md-2">

		</div>
		<div class="col-md-10">

		</div>

	</div>
	<!--
		<a href="#list-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'tag.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'tag.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="usingCount" title="${message(code: 'tag.usingCount.label', default: 'Using Count')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tagInstanceList}" status="i" var="tagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tagInstance.id}">${fieldValue(bean: tagInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: tagInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: tagInstance, field: "usingCount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tagInstanceCount ?: 0}" />
			</div>
		</div>
		-->

	</body>
</html>
