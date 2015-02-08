<%@ page import="fr.isima.webdev.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>${topicInstance.title}</title>
    <asset:stylesheet src="style.css"></asset:stylesheet>

</head>
<body>

<div class="container">
    <div class="row page">
        <div class="col-md-2">

        </div>
        <div class="col-md-9">
            <div class="row panel panel-default" >
                <div class="col-md-1">
                    <div>
                        <span class="badge parag"><g:message code="default.topic.score"/> : ${topicInstance.score} </span></a>
                    </div>
                    <div>
                        <span class="badge parag"><g:message code="default.topic.views"/> : ${topicInstance.nmbreViews} </span></a>
                    </div>
                    <div>
                        <span class="badge parag"><g:message code="default.topic.answers"/> : ${topicInstance.responses.size()} </span></a>
                    </div>
                </div>
                <div class="col-md-1">
                    <div>
                       <g:link controller="message" action="vote" id="${topicInstance.id}">
                           <asset:image src="like.png" height='40px' width="40px" />
                       </g:link>
                    </div>
                    <div>
                        <g:link controller="message" action="devote" id="${topicInstance.id}">
                            <asset:image src="dislike.png" height='40px' width="40px" />
                        </g:link>
                    </div>
                </div>
                <div class="col-md-10">
                      <p class="hh">
                        <div class="media-left">
                            <img height="50px" width="50px" class="media-object" src="${topicInstance.author.photoString()}" alt="" />
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"><b>${topicInstance.title}</b></h4>
                            ${raw(topicInstance.content)}
                            <cite title="Source Title">
                                <h6><g:message code="default.postedBy"/> ${topicInstance.author} at <b>${topicInstance.date}</b></h6>
                            </cite>
                            <g:each in="${topicInstance.tags}" var="tagstance">
                                <span class="label label-primary">${tagstance.name}</span>
                            </g:each>
                        </div>
                      </p>
                </div>
            </div>
            <div id="AnswersAndComments">
                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-10">
                        <g:if test="${topicInstance?.responses}">
                            <g:each in="${topicInstance.responses}" var="response">
                                <div  class="row panel panel-default">
                                    <div class="col-md-1">
                                        <div>
                                            <g:link controller="message" action="vote" id="${response.id}">
                                                <asset:image src="like.png" height='40px' width="40px" />
                                            </g:link>
                                        </div>
                                        <div>
                                            <span class="badge"><g:message code="default.topic.score"/> : ${response.score} </span></a>
                                        </div>
                                        <div>
                                            <g:link controller="message" action="devote" id="${response.id}">
                                                <asset:image src="dislike.png" height='40px' width="40px" />
                                            </g:link>
                                        </div>
                                    </div>
                                    <div class="col-md-11">
                                        <div class="row parag">
                                            <div class="col-md-1">
                                                <img height="50px" width="50px" class="media-object" src="${response.author.photoString()}" alt="" />
                                            </div>
                                            <div class="col-md-11">
                                                ${response.content}
                                                <cite title="Source Title">
                                                    <h6><g:message code="default.postedBy"/> ${response.author} <g:message code="default.at"/> <g:formatDate format="yyyy-MM-dd HH:mm" date="${response.date}"/></h6>
                                                </cite>
                                                <div class="row">
                                                    <div class="col-md-1">
                                                    </div>
                                                    <div class="col-md-11 pa">
                                                        <g:each in="${response.comments}" var="comment">
                                                            <HR>
                                                            ${comment.content}
                                                            <cite>
                                                                <h6><g:message code="default.postedBy"/> ${comment.author} <g:message code="default.at"/> <g:formatDate format="yyyy-MM-dd HH:mm" date="${comment.date}"/></h6>                                                            </cite>
                                                        </g:each>
                                                    </div>
                                                </div>
                                                <HR>
                                                <g:form controller="message" action="addAnswer">
                                                <textarea class="form-control margtop" rows="1" name="answer"></textarea>
                                                    <g:submitButton name="comment" class="btn btn-primary margbuttom margtop"></g:submitButton>
                                                    <g:hiddenField name="id" value="${response.id}"></g:hiddenField>
                                                </g:form>
                                                <HR>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                        </g:if>
                    </div>
                </div>
            </div>
            <div id="answer">
                <g:form class="form-horizontal" controller="message" action="addAnswer">
                    <div class="form-group">
                        <label class="col-sm-1 control-label"><b><g:message code="default.topic.answers"/> </b></label>
                        <div class="col-sm-11">
                            <textarea class="form-control" rows="2" width="100%" name="answer"></textarea>
                            <g:hiddenField name="id" value="${topicInstance.id}"></g:hiddenField>
                            <g:submitButton name="comment"  class="btn btn-primary parag"><g:message code="label.comment"/> </g:submitButton>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
        <div class="col-md-2"/>
    </div>
</div>
</div>

<g:if test="${topicInstance.author == connectedUser || topicInstance.author.authorities.contains('ROLE_ADMIN')}">

    <div class="row">
        <div class="col-md-9">

        </div>
        <div class="col-md-3">
            <g:form url="[resource:topicInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-info parag" action="edit" resource="${topicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:actionSubmit class="btn btn-danger parag" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>

        </div>
    </div>

</g:if>


</body>
</html>
