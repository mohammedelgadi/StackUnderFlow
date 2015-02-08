<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>StackUnderFlow</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>

    <asset:stylesheet src="style.css"/>
    <asset:javascript src="application.js"></asset:javascript>
    <asset:stylesheet src="style.css"></asset:stylesheet>
    <style>
        .pad{
            padding: 8px;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="row-fluid">
        <div class="col-md-4">
            <div class="panel panel-default marg ">
                <div class="panel-heading">
                    <h3 class="panel-title"><g:message code="default.topic.listTags"/> </h3>
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
            <g:if test="${theBestUser != null}">

                <div align="center" class="marg">
                    <div class="panel panel-default marg">
                        <div class="panel-heading">
                            <h3 class="panel-title"><g:message code="default.topic.bestUser"/> </h3>
                        </div>
                        <div class="panel-body">
                            <img alt="" src="${theBestUser.photoString()}"  height="60" width="60" class="img-circle"><br>
                            <HR>
                            <div class="col-md-5">
                                <small>
                                    <strong><g:message code="default.user.name"/> :</strong><br>
                                    <strong><g:message code="default.user.email"/> :</strong><br>
                                    <strong><g:message code="default.topic.score"/> :</strong>
                                    <strong><HR></strong>
                                </small>
                            </div>
                            <div class="col-md-7">
                                <small>
                                    ${theBestUser.username} <br>
                                    ${theBestUser.mail}<br>
                                    ${theBestUser.score}
                                </small>
                                <strong><HR></strong>
                            </div>
                            <strong><g:message code="default.topic.badge"/></strong><br>
                            <g:each in="${theBestUser.badges}" var="badge">
                                <span class="badge" >${badge.badge.title}</span>
                            </g:each>
                        </div>
                    </div>

                </div>
            </g:if>
        </div>
        <div class="col-md-8">
            <ul id="tabs" class="nav nav-tabs marg" >
                <li  class="active"><a href="#newest" data-toggle="tab"><g:message code="default.topic.newest"/> <span class="label label-info">${recents.size()}</span></a></li>
                <li><a href="#frequent" data-toggle="tab"><g:message code="default.topic.frequent"/> <span class="label label-info">${viewed.size()}</span></a></li>
                <li><a href="#votes" data-toggle="tab"><g:message code="default.topic.votes"/> <span class="label label-info">${bests.size()}</span></a></li>
                <li><a href="#unanswered" data-toggle="tab"><g:message code="default.topic.unanswered"/> <span class="label label-info">${unuswered.size()}</span></a></li>
            </ul>
            <div id="my-tab-content" class="tab-content">
                <div class="tab-pane active" id="newest">
                    <input type='hidden' id='current_page' />
                    <input type='hidden' id='show_per_page' />
                    <div id='content'>
                    <p>
                        <g:each in="${recents}" var="topicInstance">
                                <div class="row panel panel-default" >
                                    <div class="col-md-2">
                                        <span class="badge"><g:message code="default.topic.score"/> : ${topicInstance.score} </span>
                                        <span class="badge"><g:message code="default.topic.views"/> : ${topicInstance.nmbreViews} </span>
                                        <span class="badge"><g:message code="default.topic.answers"/> : ${topicInstance.responses.size()} </span>
                                        <g:if test="${topicInstance.author == currentUser || topicInstance.author.authorities.contains('ROLE_ADMIN')}">
                                            <g:link controller="message" action="removeMessage" id="${topicInstance.id}">
                                                <span class="label label-danger"><g:message code="default.remove"/> </span>
                                            </g:link>
                                            <g:link controller="topic" action="edit" resource="${topicInstance}">
                                                <span class="label label-info"><g:message code="default.edit"/> </span>
                                            </g:link>
                                            <div class="marg"></div>
                                        </g:if>
                                    </div>
                                    <div class="col-md-10">
                                        <div>
                                            <div class="media pad">
                                                <div class="media-left">
                                                    <img height="50px" width="50px" class="media-object" src="${topicInstance.author.photoString()}" alt="" />
                                                </div>
                                                <div class="media-body">
                                                    <g:link controller="topic" action="show" id="${topicInstance.id}">
                                                        <h4 class="media-heading">${topicInstance.title}</h4>
                                                    </g:link>
                                                    ${raw(topicInstance.content)}
                                                    <cite title="Source Title">
                                                        <h6>
                                                            <g:message code="default.postedBy"/> ${topicInstance.author} <g:message code="default.at"/> <g:formatDate format="yyyy-MM-dd HH:mm" date="${topicInstance.date}"/>
                                                        </h6>
                                                    </cite>
                                                    <g:each in="${topicInstance.tags}" var="tagstance">
                                                        <span class="label label-primary">${tagstance.name}</span>
                                                    </g:each>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </p>
                        </g:each>

                    </div>
                    <g:if test="${recents.size() >= 4}">
                        <div id='page_navigation'></div>
                    </g:if>
                </div>
                <div class="tab-pane" id="frequent">
                    <g:each in="${viewed}" var="topicInstance">
                        <!--<g:link controller="topic" action="show" id="${topicInstance.id}">-->
                            <div class="row panel panel-default" >
                                <div class="col-md-2">
                                    <span class="badge"><g:message code="default.topic.score"/> : ${topicInstance.score} </span>
                                    <span class="badge"><g:message code="default.topic.views"/> : ${topicInstance.nmbreViews} </span>
                                    <span class="badge"><g:message code="default.topic.answers"/> : ${topicInstance.responses.size()} </span>
                                    <g:if test="${topicInstance.author == currentUser || topicInstance.author.authorities.contains('ROLE_ADMIN')}">
                                        <g:link controller="message" action="removeMessage" id="${topicInstance.id}">
                                            <span class="label label-danger"><g:message code="default.remove"/></span>
                                        </g:link>
                                        <g:link controller="topic" action="edit" resource="${topicInstance}">
                                            <span class="label label-info"><g:message code="default.edit"/></span>
                                        </g:link>
                                        <div class="marg"></div>
                                    </g:if>
                                </div>
                                <div class="col-md-10">
                                    <div class="media pad">
                                        <div class="media-left">
                                            <img height="50px" width="50px" class="media-object" src="${topicInstance.author.photoString()}" alt="" />
                                        </div>
                                        <div class="media-body">
                                            <g:link controller="topic" action="show" id="${topicInstance.id}">
                                                <h4 class="media-heading">${topicInstance.title}</h4>
                                            </g:link>
                                            ${raw(topicInstance.content)}
                                            <cite title="Source Title">
                                                <small>
                                                    <g:message code="default.postedBy"/> ${topicInstance.author} <g:message code="default.at"/> <g:formatDate format="yyyy-MM-dd HH:mm" date="${topicInstance.date}"/>
                                                </small>
                                            </cite>
                                            <g:each in="${topicInstance.tags}" var="tagstance">
                                                <span class="label label-primary">${tagstance.name}</span>
                                            </g:each>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!--</g:link>-->
                    </g:each>
                </div>
                <!-- second -->
                <div class="tab-pane" id="votes">
                    <g:each in="${bests}" var="topicInstance">
                        <!--<g:link controller="topic" action="show" id="${topicInstance.id}">-->
                        <div class="row panel panel-default" >
                            <div class="col-md-2">
                                <span class="badge"> <g:message code="default.topic.score"/>: ${topicInstance.score} </span>
                                <span class="badge"><g:message code="default.topic.views"/> : ${topicInstance.nmbreViews} </span>
                                <span class="badge"><g:message code="default.topic.answers"/> : ${topicInstance.responses.size()} </span>
                                <g:if test="${topicInstance.author == currentUser || topicInstance.author.authorities.contains('ROLE_ADMIN')}">
                                    <g:link controller="message" action="removeMessage" id="${topicInstance.id}">
                                        <span class="label label-danger"><g:message code="default.remove"/></span>
                                    </g:link>
                                    <g:link controller="topic" action="edit" resource="${topicInstance}">
                                        <span class="label label-info"><g:message code="default.edit"/></span>
                                    </g:link>
                                    <div class="marg"></div>
                                </g:if>
                            </div>
                            <div class="col-md-10">
                                <div class="media pad">
                                    <div class="media-left">
                                        <img height="50px" width="50px" class="media-object" src="${topicInstance.author.photoString()}" alt="" />
                                    </div>
                                    <div class="media-body">
                                        <g:link controller="topic" action="show" id="${topicInstance.id}">
                                            <h4 class="media-heading">${topicInstance.title}</h4>
                                        </g:link>
                                        ${raw(topicInstance.content)}
                                        <cite title="Source Title">
                                            <small>
                                                <g:message code="default.postedBy"/> ${topicInstance.author} <g:message code="default.at"/> <g:formatDate format="yyyy-MM-dd HH:mm" date="${topicInstance.date}"/>
                                            </small>
                                        </cite>
                                        <g:each in="${topicInstance.tags}" var="tagstance">
                                            <span class="label label-primary">${tagstance.name}</span>
                                        </g:each>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--</g:link>-->
                    </g:each>
                </div>
                <!-- other -->
                <div class="tab-pane" id="unanswered">
                    <g:each in="${unuswered}" var="topicInstance">
                        <!--<g:link controller="topic" action="show" id="${topicInstance.id}">-->
                        <div class="row panel panel-default" >
                            <div class="col-md-2">
                                <span class="badge"><g:message code="default.topic.score"/> : ${topicInstance.score} </span>
                                <span class="badge"><g:message code="default.topic.views"/>  : ${topicInstance.nmbreViews} </span>
                                <span class="badge"><g:message code="default.topic.answers"/>  : ${topicInstance.responses.size()} </span>
                                <g:if test="${topicInstance.author == currentUser || topicInstance.author.authorities.contains('ROLE_ADMIN')}">
                                    <g:link controller="message" action="removeMessage" id="${topicInstance.id}">
                                        <span class="label label-danger"><g:message code="default.remove"/></span>
                                    </g:link>
                                    <g:link controller="topic" action="edit" resource="${topicInstance}">
                                        <span class="label label-info"><g:message code="default.edit"/></span>
                                    </g:link>
                                    <div class="marg"></div>
                                </g:if>
                            </div>
                            <div class="col-md-10">
                                <div class="media pad">
                                    <div class="media-left">
                                        <img height="50px" width="50px" class="media-object" src="${topicInstance.author.photoString()}" alt="" />
                                    </div>
                                    <div class="media-body">
                                        <g:link controller="topic" action="show" id="${topicInstance.id}">
                                            <h4 class="media-heading">${topicInstance.title}</h4>
                                        </g:link>
                                        ${raw(topicInstance.content)}
                                        <cite title="Source Title">
                                            <small>
                                                <g:message code="default.postedBy"/> ${topicInstance.author} <g:message code="default.at"/> <g:formatDate format="yyyy-MM-dd HH:mm" date="${topicInstance.date}"/>
                                            </small>
                                        </cite>
                                        <g:each in="${topicInstance.tags}" var="tagstance">
                                            <span class="label label-primary">${tagstance.name}</span>
                                        </g:each>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--</g:link>-->
                    </g:each>
                </div>
            </div>


        </div>
    </div>


</div>

<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('#tabs').tab();
    });
</script>


</body>
</html>
