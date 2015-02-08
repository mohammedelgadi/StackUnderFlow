<%@ page import="fr.isima.webdev.User" %>
<style type="text/css">
.user-row {
	margin-bottom: 14px;
}

.user-row:last-child {
	margin-bottom: 0;
}

.dropdown-user {
	margin: 13px 0;
	padding: 5px;
	height: 100%;
}

.dropdown-user:hover {
	cursor: pointer;
}

.table-user-information > tbody > tr {
	border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
	border-top: 0;
}


.table-user-information > tbody > tr > td {
	border-top: 0;
}
.toppad
{margin-top:20px;
}
.list-custum{
	margin-left: 2%;
	margin-right: 2%;
	margin-top: 2%;
}


</style>
<div class="panel panel-info list-custum">
	<div class="panel-heading">
		<h3 class="panel-title" >${userInstance.username}</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-3 col-lg-3 " align="center"> <img alt="" src="${userInstance.photoString()}" height="200" width="200"> </div>


			<div class=" col-md-9 col-lg-9 ">
				<table class="table table-user-information">
					<tbody>


					<tr>
						<td><g:message code="default.user.username"/>:</td>
						<td>
							<input type="text" class="form-control" name="username" value="${userInstance.username}" class="input-xlarge">
						</td>
					</tr>
					<tr>
						<td><g:message code="default.user.password"/>:</td>
						<td>
							<input type="password" class="form-control" name="password" value="" placeholder="*******" class="input-xlarge">
						</td>
					</tr>

					<tr>
						<td><g:message code="default.user.firstname"/>:</td>
						<td>
							<input type="text" class="form-control" name="firstname" value="${userInstance.firstname}" class="input-xlarge">
						</td>
					</tr>

					<tr>
						<td><g:message code="default.user.lastname"/>:</td>
						<td>
							<input type="text" class="form-control" name="lastname" value="${userInstance.lastname}" class="input-xlarge">
						</td>
					</tr>

					<tr>
						<td><g:message code="default.user.bio"/>:</td>
						<td>
							<input type="textarea" class="form-control" name="bio" value="${userInstance.bio}" class="input-xlarge">
						</td>
					</tr>

					<tr>
						<td><g:message code="default.user.email"/>:</td>
						<td>
							<input type="email" class="form-control" name="mail" value="${userInstance.mail}" class="input-xlarge">
						</td>
					</tr>

					<tr>
						<td><g:message code="default.user.profilepic"/>:</td>
						<td>
							<input type="file" id="photoProfile" name="photoProfile"  class="input-xlarge">
						</td>
					</tr>



					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
