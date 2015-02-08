<%@ page import="fr.isima.webdev.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="message.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${fr.isima.webdev.Comment.list()}" multiple="multiple" optionKey="id" size="5" value="${messageInstance?.comments*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="message.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${messageInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="message.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${messageInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="message.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${messageInstance.score}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'votes', 'error')} ">
	<label for="votes">
		<g:message code="message.votes.label" default="Votes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${messageInstance?.votes?}" var="v">
    <li><g:link controller="vote" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vote" action="create" params="['message.id': messageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vote.label', default: 'Vote')])}</g:link>
</li>
</ul>


</div>

