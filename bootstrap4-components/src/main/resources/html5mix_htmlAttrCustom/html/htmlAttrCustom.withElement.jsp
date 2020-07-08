<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<${currentResource.moduleParams.element} <template:option node="${currentNode}" nodetype="html5mix:htmlAttrCustom" view="default" /> >
    <template:area path="${currentResource.moduleParams.element}" areaAsSubNode="true" moduleType="area" />
</${currentResource.moduleParams.element}>