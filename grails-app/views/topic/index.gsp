
<%@ page import="fr.isima.webdev.Topic" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
	<title></title>
	<asset:stylesheet src="style.css"/>
	<script>
		$(document).ready(function () {
			/* initially hide list items */
			$("#dino-list li").show();
			/* filter dinosaurs as you type */
			$("#dino-search").on("keyup click input", function () {
				if (this.value.length > 0) {
					$("#dino-list li").hide().filter(function () {
						return $(this).text().toLowerCase().indexOf($("#dino-search").val().toLowerCase()) != -1;
					}).show();
				}
				else {
					$("#dino-list li").show();
				}
			});
		});
	</script>
</head>

<body>
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default marg">
				<div class="panel-heading">
					<h3 class="panel-title"><g:message code="default.topic.listTags"/></h3>
				</div>
				<div class="panel-body">
					<input type="text" class="margbuttom list-group-item active" id="dino-search" placeholder="${message(code:'default.topic.tagName')}">
					<ul id="dino-list" class="list-group">
						<g:each in="${tags}" var="tag">
							<g:link controller="topic" action="showByTag" id="${tag.id}">
								<li class="list-group-item"><span class="badge">${tag.usingCount}</span>${tag.name}</li>
							</g:link>
						</g:each>
					</ul>

				</div>
			</div>
		</div>
		<div class="col-md-9">

			<g:each in="${topicInstanceList}" status="i" var="topicInstance">
				<div class="row panel panel-default parag" >
					<div class="col-md-2">
						<div>
							<span class="badge parag"><g:message code="default.topic.score"/> : ${topicInstance.score} </span></a>
						</div>
						<div>
							<span class="badge parag"><g:message code="default.topic.score"/> : ${topicInstance.nmbreViews} </span></a>
						</div>
						<div>
							<span class="badge parag"><g:message code="default.topic.score"/> : ${topicInstance.responses.size()} </span></a>
						</div>
					</div>
					<div class="col-md-10" >

						<p class="parag">
						<div class="media">
							<div class="media-left">
								<img height="50px" width="50px" class="media-object" src="${topicInstance.author.photoString()}" alt="" />
							</div>
							<div class="media-body">
								<g:link controller="topic" action="show" id="${topicInstance.id}">
								<h4 class="media-heading">${topicInstance.title}</h4>
								</g:link>

									${raw(topicInstance.content)}

								<cite title="Source Title">
									<h6><g:message code="default.postedBy"/>
										${topicInstance.author}
										<g:message code="default.at"/> <g:formatDate format="yyyy-MM-dd HH:mm" date="${topicInstance.date}"/>
									</h6>
								</cite>
								<g:each in="${topicInstance.tags}" var="tagstance">
									<span class="label label-primary">${tagstance.name}</span>
								</g:each>
							</div>
						</div>
					</p>
					</div>
				</div>
			</g:each>

		</div>

	</div>

</div>
</body>
</html>
