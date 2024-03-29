<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="popper.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>

<c:set var="siteNode" value="${renderContext.site}"/>
<c:choose>
    <c:when test="${jcr:isNodeType(siteNode, 'bootstrap4mix:siteBrand')}">
        <c:set var="brandImage" value="${siteNode.properties.brandImage.node}"/>
        <c:set var="brandImageMobile" value="${siteNode.properties.brandImageMobile.node}"/>
        <c:set var="brandText" value="${siteNode.properties.brandText.string}"/>
    </c:when>
    <c:when test="${jcr:isNodeType(currentNode, 'bootstrap4mix:brand')}">
        <c:set var="brandImage" value="${currentNode.properties.brandImage.node}"/>
        <c:set var="brandImageMobile" value="${currentNode.properties.brandImageMobile.node}"/>
        <c:set var="brandText" value="${currentNode.properties.brandText.string}"/>
    </c:when>
</c:choose>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:customButtonNavbar')}">
    <c:set var="buttonClass" value="${currentNode.properties.buttonClass.string}"/>
</c:if>

<c:if test="${empty buttonClass}">
    <c:set var="buttonClass" value="navbar-toggler navbar-toggler-right"/>
</c:if>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:advancedNavbar')}">
    <c:set var="navClass" value="${currentNode.properties.navClass.string}"/>
    <c:set var="divClass" value="${currentNode.properties.divClass.string}"/>
    <c:set var="addContainerWithinTheNavbar" value="${currentNode.properties.addContainerWithinTheNavbar.boolean}"/>
    <c:set var="addLoginButton" value="${currentNode.properties.addLoginButton.boolean}"/>
    <c:set var="addLanguageButton" value="${currentNode.properties.addLanguageButton.boolean}"/>
</c:if>
<c:if test="${empty navClass}">
    <c:set var="navClass" value="navbar navbar-expand-lg navbar-light bg-light"/>
</c:if>
<%-- try to get the expand size --%>
<c:set var="expand" value="lg"/>
<c:forEach items="${fn:split(navClass, ' ')}" var="currentClass">
    <c:if test="${fn:startsWith(currentClass, 'navbar-expand-')}">
        <c:set var="expand" value="${fn:replace(currentClass, 'navbar-expand-', '')}"/>
    </c:if>
</c:forEach>
<c:if test="${empty divClass}">
    <c:set var="divClass" value="collapse navbar-collapse"/>
</c:if>
<c:if test="${empty addContainerWithinTheNavbar}">
    <c:set var="addContainerWithinTheNavbar" value="false"/>
</c:if>
<c:if test="${empty addLoginButton}">
    <c:set var="addLoginButton" value="false"/>
</c:if>
<c:if test="${empty addLanguageButton}">
    <c:set var="addLanguageButton" value="true"/>
</c:if>

<c:set var="root" value="${currentNode.properties.root.string}"/>

<c:set var="curentPageNode" value="${renderContext.mainResource.node}"/>
<c:if test="${! jcr:isNodeType(curentPageNode,'jmix:navMenuItem')}">
    <c:set var="curentPageNode" value="${jcr:getParentOfType(curentPageNode, 'jmix:navMenuItem')}"/>
</c:if>

<c:choose>
    <c:when test="${root eq 'currentPage'}">
        <c:set var="rootNode" value="${curentPageNode}"/>
    </c:when>
    <c:when test="${root eq 'parentPage'}">
        <c:set var="rootNode" value="${curentPageNode.parent}"/>
    </c:when>
    <c:otherwise>
        <c:set var="rootNode" value="${renderContext.site.home}"/>
    </c:otherwise>
</c:choose>
<nav class="${navClass}">
    <c:if test="${addContainerWithinTheNavbar}">
        <div class="container">
    </c:if>
    <c:choose>
        <c:when test="${fn:startsWith(currentNode.path,'/modules') || renderContext.editModeConfigName eq 'studiomode'}">
            <c:url var="rootNodeUrl" value="${rootNode.url}"/>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${jcr:isNodeType(rootNode, 'jnt:virtualsite')}">
                    <c:url var="rootNodeUrl" value="${renderContext.site.home.url}"/>
                </c:when>
                <c:otherwise>
                    <c:url var="rootNodeUrl" value="${rootNode.url}"/>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>

    <a class="navbar-brand" href="${rootNodeUrl}">
        <c:if test="${! empty brandImage}">
            <c:url var="brandImageUrl" value="${brandImage.url}" context="/"/>
            <c:choose>
                <c:when test="${! empty brandImageMobile}">
                    <c:url var="brandImageMobileeUrl" value="${brandImageMobile.url}" context="/"/>
                    <img src="${brandImageUrl}" class="align-top d-none d-${expand}-inline-block" alt="">
                    <img src="${brandImageMobileeUrl}" class="align-top d-inline-block d-${expand}-none" alt="">
                </c:when>
                <c:otherwise>
                    <img src="${brandImageUrl}" class="d-inline-block align-top" alt="">
                </c:otherwise>
            </c:choose>

        </c:if>
        ${brandText}
    </a>

    <button class="${buttonClass}" type="button" data-toggle="collapse"
            data-target="#navbar-${currentNode.identifier}" aria-controls="navbar-${currentNode.identifier}"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="${divClass}" id="navbar-${currentNode.identifier}">
        <template:include view="basenav"/>
        <c:if test="${addLoginButton}">
            <template:include view="hidden.login"/>
        </c:if>
        <c:if test="${addLanguageButton}">
            <template:include view="hidden.languages"/>
        </c:if>
    </div>
    <c:if test="${addContainerWithinTheNavbar}">
        </div>
    </c:if>
</nav>
