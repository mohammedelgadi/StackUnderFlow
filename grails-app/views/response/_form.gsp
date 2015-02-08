<%@ page import="fr.isima.webdev.Response" %>



<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="response.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${fr.isima.webdev.User.list()}" optionKey="id" required="" value="${responseInstance?.author?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="response.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${responseInstance?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['response.id': responseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="response.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${responseInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="response.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${responseInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'isAccepted', 'error')} ">
	<label for="isAccepted">
		<g:message code="response.isAccepted.label" default="Is Accepted" />
		
	</label>
	<g:checkBox name="isAccepted" value="${responseInstance?.isAccepted}" />

</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="response.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${responseInstance.score}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="response.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${fr.isima.webdev.Topic.list()}" optionKey="id" required="" value="${responseInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'votes', 'error')} ">
	<label for="votes">
		<g:message code="response.votes.label" default="Votes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${responseInstance?.votes?}" var="v">
    <li><g:link controller="vote" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vote" action="create" params="['response.id': responseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vote.label', default: 'Vote')])}</g:link>
</li>
</ul>


</div>

