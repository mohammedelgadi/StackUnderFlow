
<%@ page import="fr.isima.webdev.Badge" %>
<!DOCTYPE html>
<html>
	<head>
	<meta name="layout" content="main">
		<title>
            <g:message code="label.badge.Badgepart"/>
        </title>
        <style>
            .list-elem{
                margin: 10px;
                width: 70%;
            }
        </style>
	</head>
    <body>
            <div class="row">
                <div class="col-md-2">

                </div>
                <div class="col-md-10 list-elem">
                    <a href="#" class="list-group-item disabled">
                        <g:message code="label.badge.GradCat"/>
                    </a>
                    <ul class="list-group">
                        <g:each in="${badges}" var="badge">
                            <g:if test="${badge.category == 0}">
                                <li class="list-group-item">
                                    <span class="badge">${badge.title}</span>
                                    ${badge.engDescription}
                                </li>
                            </g:if>
                        </g:each>
                    </ul>

                    <a href="#" class="list-group-item disabled">
                        <g:message code="label.badge.scoreCat"/>
                    </a>
                    <ul class="list-group">
                        <g:each in="${badges}" var="badge">
                            <g:if test="${badge.category == 1}">
                                <li class="list-group-item">
                                    <span class="badge">${badge.title}</span>
                                    ${badge.engDescription}
                                </li>
                            </g:if>
                        </g:each>
                    </ul>

                    <a href="#" class="list-group-item disabled">
                        <g:message code="label.badge.TypeCat"/>
                    </a>
                    <ul class="list-group">
                        <g:each in="${badges}" var="badge">
                            <g:if test="${badge.category == 2}">
                                <li class="list-group-item">
                                    <span class="badge">${badge.title}</span>
                                    ${badge.engDescription}
                                </li>
                            </g:if>
                        </g:each>
                    </ul>

                    <a href="#" class="list-group-item disabled">
                        <g:message code="label.badge.GoldCat"/>
                    </a>
                    <ul class="list-group">
                        <g:each in="${badges}" var="badge">
                            <g:if test="${badge.category == 3}">
                                <li class="list-group-item">
                                    <span class="badge">${badge.title}</span>
                                    ${badge.engDescription}
                                </li>
                            </g:if>
                        </g:each>
                    </ul>
                </div>


            </div>
    </body>
</html>
