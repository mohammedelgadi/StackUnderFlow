<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="label.Topic.create"/> </title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>

    <asset:javascript src="chosen.jquery.js"/>
    <asset:javascript src="prism.js"/>
    <asset:stylesheet src="chosen.css"/>
    <asset:stylesheet src="prism.css"/>
    <script>
        $(document).ready(function(){
            $('#addTag').hide();
            $('#showForm').click(function(){
                $('#addTag').show();
            });
        });
    </script>

    <style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
    </style>

</head>
<body>
<div class="container">
    <h2><g:message code="label.Topic.newTopic"/> </h2>



    <g:form class="form-horizontal" role="form" >
        <div class="form-group">
            <label class="control-label col-sm-2"><g:message code="default.topic.title"/> :</label>
            <div class="col-sm-10">
                <input type="text" name="title" value="${topicInstance.title}" class="form-control"  placeholder="${message(code:'label.addTitle')}">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">Tags:</label>
            <div class="col-sm-10">
                <g:select from="${listTags}" name="selectedValues" value="" data-placeholder="${message(code:'label.Tag.chooseTage')}" style="width:350px;" multiple="true"   class="chosen-select" tabindex="8">
                </g:select>
                <span  id="showForm" class="label label-success"><g:message code="default.topic.new"/> </span>
            </div>
        </div>

        <div class="form-group" id="addTag">
            <label class="control-label col-sm-2"><g:message code="default.topic.newTag"/> :</label>
            <div class="col-sm-10">
                    <input type="text" name="tagname" class="input-small" placeholder="${message(code:'label.Tag.tapename')}">
                    <input type="text" name="description"  class="input-small" placeholder="${message(code:'label.Tag.description')}">
                    <g:actionSubmit  action="addTag" value="${message(code:'label.create')}" class="btn"><g:message code="label.add" /> </g:actionSubmit>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="pwd"><g:message code="default.topic.content"/> :</label>
            <div class="col-sm-10">
                <ckeditor:editor name="content" id="pwd" height="400px" width="80%">
                    ${topicInstance.content}
                </ckeditor:editor>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <g:actionSubmit action="createTopic" value="${message(code:'default.submit')}"   name="send" content="Submit"  class="btn btn-default"/>
            </div>
        </div>
    </g:form>
</div>


<script type="text/javascript">
    var config = {
        '.chosen-select'           : {},
        '.chosen-select-deselect'  : {allow_single_deselect:true},
        '.chosen-select-no-single' : {disable_search_threshold:10},
        '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
        '.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }


</script>



</body>
</html>
