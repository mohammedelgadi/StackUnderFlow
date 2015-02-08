<%@ page import="fr.isima.webdev.Topic" %>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="topic.title.label" default="Title" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${topicInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'content', 'error')} required">
    <label for="content">
        <g:message code="topic.content.label" default="Content" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="content" required="" value="${topicInstance?.content}"/>



</div>


<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tags', 'error')} ">
    <label for="tags">
        <g:message code="topic.tags.label" default="Tags" />

    </label>
    <g:select name="tags" from="${fr.isima.webdev.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${topicInstance?.tags*.id}" class="many-to-many"/>

</div>





</div>

