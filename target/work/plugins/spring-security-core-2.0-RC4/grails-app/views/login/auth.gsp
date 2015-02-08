<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	#login {
		margin: 15px 0px;
		padding: 0px;
		text-align: center;
	}

	#login .container {
		padding-bottom: 6px;
		margin: 60px auto;
		text-align: left;
	}

	.total{
		width: 100%;
	}

	</style>
</head>

<body>

<body>
<div id='login'>

		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><g:message code="springSecurity.label.singIn"/> </h3>
						</div>
						<div class="panel-body">
							<form action='${postUrl}' method='POST' id='loginForm'  autocomplete='off' class='cssform' >
								<fieldset>
									<div class="form-group">
										<input class="form-control text_ total" id='username' placeholder="Username" name="j_username" type="text">
									</div>
									<div class="form-group">
										<input class="form-control text_ total"  id='password'  placeholder="Password" name="j_password" type="password" value="">
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>> <g:message code="springSecurity.login.remember.me.label"/>
										</label>
									</div>
									<input class="btn btn-lg btn-success btn-block" type="submit" id="submit" value='${message(code: "springSecurity.login.button")}'>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
