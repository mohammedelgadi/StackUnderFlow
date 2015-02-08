<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="StackUnderFlow"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
		<asset:javascript src="bootstrap.min.js"/>
		<asset:javascript src="jquery.js"/>
		<asset:javascript src="application.js"/>
		<asset:stylesheet src="modern-business.css"/>
		<asset:stylesheet src="bootstrap.min.css"/>
		<asset:stylesheet src="font-awesome.min.css"/>
		<ckeditor:resources/>
		<g:layoutHead/>
	</head>
	<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">StackUnderFlow</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<sec:ifLoggedIn>
						<li>
							<g:link  controller="user"  action="show" id="${sec.loggedInUserInfo(field: "id")}"  ><sec:username/></g:link>
						</li>
						<li>
							<g:remoteLink class="logout" controller="logout" method="post" asynchronous="false" onSuccess="location.reload()"><g:message code="default.user.logout"/></g:remoteLink>
						</li>
					</sec:ifLoggedIn>
					<sec:ifNotLoggedIn>
					<li>
						<a href="/stackOverFLow/user/create"><g:message code="default.user.signup"/></a>
					</li>
					<li>
						<a href="/stackOverFLow/login/auth"><g:message code="default.user.signin"/></a>
					</li>
					</sec:ifNotLoggedIn>
					<li>
						<a href="/stackOverFLow/"><g:message code="default.home.label"/> </a>
					</li>
					<li>
						<a href="contact.html"><g:message code="default.contact"/> </a>
					</li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div>
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
			<div class="btn-group" role="group">
				<g:link  type="button" class="btn btn-default" controller="topic" action="index">Questions</g:link>
			</div>
			<div class="btn-group" role="group">
				<g:link  type="button" class="btn btn-default" controller="user" action="index"><g:message code="default.user.title.index"/></g:link>
			</div>
			<div class="btn-group" role="group">
				<g:link  type="button" class="btn btn-default" controller="badge" action="index">Badges</g:link>
			</div>
			<div class="btn-group" role="group">
				<g:link  type="button" class="btn btn-default" controller="topic" action="create"><g:message code="default.ask"/> </g:link>
			</div>
		</div>
	</div>

	<!--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>-->
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

	</body>
</html>
