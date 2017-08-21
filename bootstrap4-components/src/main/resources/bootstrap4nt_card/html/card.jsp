<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="headerSize" value="${currentNode.properties.headerSize.string}"/>
<c:if test="${headerSize == 'default'}">
    <c:set var="headerSize" value="div"/>
</c:if>
<c:set var="textAlign" value=" ${currentNode.properties.textAlign.string}"/>
<c:if test="${textAlign == ' text-left'}">
    <c:remove var="textAlign"/>
</c:if>
<c:set var="imageNode" value="${currentNode.properties.image.node}"/>
<c:set var="footer" value="${currentNode.properties.footer.string}"/>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:colors')}">
    <c:set var="backgroundColor" value=" bg-${currentNode.properties.backgroundColor.string}"/>
    <c:if test="${backgroundColor eq ' bg-default'}">
        <c:remove var="backgroundColor"/>
    </c:if>
    <c:set var="textColor" value=" text-${currentNode.properties.textColor.string}"/>
    <c:set var="borderColor" value=" border-${currentNode.properties.borderColor.string}"/>
    <c:if test="${borderColor eq ' border-default'}">
        <c:remove var="borderColor"/>
    </c:if>
</c:if>


<div class="card${textAlign}${backgroundColor}${textColor}${borderColor}">
    <c:if test="${! empty imageNode}">
        <template:include view="image">
            <template:param name="class" value="card-img-top"/>
        </template:include>
    </c:if>
    <c:if test="${! empty title}">
        <${headerSize} class="card-header">${title}</${headerSize}>
    </c:if>
    <div class="card-body">
        <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jmix:droppableContent')}" var="droppableContent">
            <template:module node="${droppableContent}" editable="true"/>
        </c:forEach>
        <c:if test="${renderContext.editMode}">
            <template:module path="*" nodeTypes="jmix:droppableContent"/>
        </c:if>
    </div>
    <c:if test="${not empty footer}">
        <div class="card-footer text-muted">${footer}</div>
    </c:if>
</div>