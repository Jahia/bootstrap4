<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js,bootstrap.min.js"/>

<c:set var="items" value="${jcr:getChildrenOfType(currentNode, 'bootstrap4nt:carouselItem')}"/>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:carouselAdvancedSettings')}">
    <c:set var="interval" value="${currentNode.properties.interval.long}"/>
    <c:set var="keyboard" value="${currentNode.properties.keyboard.boolean}"/>
    <c:set var="pause" value="${currentNode.properties.pause.boolean}"/>
    <c:set var="ride" value="${currentNode.properties.ride.boolean}"/>
    <c:set var="wrap" value="${currentNode.properties.wrap.boolean}"/>
    <c:set var="fade" value="${currentNode.properties.fade.boolean}"/>
    <c:set var="useIndicators" value="${currentNode.properties.useIndicators.boolean}"/>
    <c:set var="useLeftAndRightControls" value="${currentNode.properties.useLeftAndRightControls.boolean}"/>
    <c:set var="carouselClass" value=" ${currentNode.properties.carouselClass.string}"/>
</c:if>
<c:if test="${empty useIndicators}">
    <c:set var="useIndicators" value="true"/>
</c:if>
<c:if test="${empty useLeftAndRightControls}">
    <c:set var="useLeftAndRightControls" value="true"/>
</c:if>
<c:if test="${empty ride}">
    <c:set var="ride" value="true"/>
</c:if>
<c:if test="${empty keyboard}">
    <c:set var="keyboard" value="true"/>
</c:if>
<c:if test="${empty ride}">
    <c:set var="wrap" value="true"/>
</c:if>
<c:if test="${empty fade}">
    <c:set var="fade" value="false"/>
</c:if>
<c:if test="${carouselClass eq ' '}">
    <c:remove var="carouselClass"/>
</c:if>
<c:if test="${fade}">
    <c:set var="carouselClass" value="${carouselClass} carousel-fade"/>
</c:if>

<c:set var="options">
    <c:if test="${! empty interval && interval != 5000}">
        data-interval="${interval}"
    </c:if>
    <c:if test="${! keyboard}">
        data-keyboard="false"
    </c:if>
    <c:if test="${pause}">
        data-pause="hover"
    </c:if>
    <c:if test="${ride}">
        data-ride="carousel"
    </c:if>
    <c:if test="${! wrap}">
        data-wrap="false"
    </c:if>
</c:set>

<fmt:message key="bootstrap4nt_carousel.label" var="carouselLabel"/>
<fmt:message key="bootstrap4nt_carousel.pause" var="pauseLabel"/>
<fmt:message key="bootstrap4nt_carousel.play" var="playLabel"/>
<div id="carousel_${currentNode.identifier}" class="carousel${renderContext.editMode?'edit':' '} slide${carouselClass}" ${options}
     aria-label="${fn:escapeXml(carouselLabel)}" aria-roledescription="carousel">
    <%-- Indicators --%>
    <c:if test="${useIndicators && ! renderContext.editMode}">
        <fmt:message key="bootstrap4nt_carousel.indicators" var="indicatorsLabel"/>
        <ol class="carousel-indicators" aria-label="${fn:escapeXml(indicatorsLabel)}">
            <c:forEach items="${items}" var="item" varStatus="status">
                <fmt:message key="bootstrap4nt_carousel.goToSlide" var="goToSlideLabel">
                    <fmt:param value="${status.index + 1}"/>
                </fmt:message>
                <li>
                    <button type="button"
                            data-target="#carousel_${currentNode.identifier}"
                            data-slide-to="${status.index}"
                            class="${status.first ? 'active' : ''}"
                            aria-label="${fn:escapeXml(goToSlideLabel)}"
                            <c:if test="${status.first}">aria-current="true"</c:if>>
                    </button>
                </li>
            </c:forEach>
        </ol>
    </c:if>

    <%-- Wrapper for slides --%>
    <div class="carousel-inner${renderContext.editMode?'edit':''}">
        <c:forEach items="${items}" var="item" varStatus="status">

            <template:module node="${item}" nodeTypes="bootstrap4nt:carouselItem">
                <template:param name="currentStatus" value="${status.first?' active':''}"/>
                <template:param name="slideIndex" value="${status.index + 1}"/>
                <template:param name="totalSlides" value="${fn:length(items)}"/>
            </template:module>

        </c:forEach>
    </div>

    <%-- Controls --%>
    <c:if test="${useLeftAndRightControls && ! renderContext.editMode}">
        <button class="carousel-control-prev" type="button"
                data-target="#carousel_${currentNode.identifier}" data-slide="prev"
                aria-label="<fmt:message key='bootstrap4nt_carousel.previous'/>">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button"
                data-target="#carousel_${currentNode.identifier}" data-slide="next"
                aria-label="<fmt:message key='bootstrap4nt_carousel.next'/>">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </c:if>

    <%-- Pause/play control (WCAG 2.2.2) --%>
    <c:if test="${ride && ! renderContext.editMode}">
        <button type="button"
                id="carousel-pause-${currentNode.identifier}"
                class="btn btn-sm btn-secondary position-absolute"
                style="bottom: 1rem; right: 1rem; z-index: 15;"
                aria-label="${fn:escapeXml(pauseLabel)}">
            <span aria-hidden="true">&#9646;&#9646;</span>
        </button>
    </c:if>
</div>

<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="bootstrap4nt:carouselItem"/>
</c:if>
<c:if test="${ride && ! renderContext.editMode}">
    <template:addResources targetTag="body" type="inline">
        <script>
        (function () {
            var el = document.getElementById('carousel-pause-${currentNode.identifier}');
            var playing = true;
            if (!el) return;
            el.addEventListener('click', function () {
                if (playing) {
                    $('#carousel_${currentNode.identifier}').carousel('pause');
                    el.setAttribute('aria-label', '${fn:escapeXml(playLabel)}');
                    el.innerHTML = '<span aria-hidden="true">&#9654;<\/span>';
                } else {
                    $('#carousel_${currentNode.identifier}').carousel('cycle');
                    el.setAttribute('aria-label', '${fn:escapeXml(pauseLabel)}');
                    el.innerHTML = '<span aria-hidden="true">&#9646;&#9646;<\/span>';
                }
                playing = !playing;
            });
        }());
        </script>
    </template:addResources>
</c:if>
