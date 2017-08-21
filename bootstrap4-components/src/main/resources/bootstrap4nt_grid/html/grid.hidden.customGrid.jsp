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

<c:set var="columns" value="${currentNode.properties.gridClasses.string}"/>
<c:set var="colName" value="${currentNode.name}"/>
<c:set var="createAbsoluteAreas" value="${jcr:isNodeType(currentNode, 'bootstrap4mix:createAbsoluteAreas')}"/>
<c:set var="moduleType" value="${createAbsoluteAreas? 'absoluteArea' : 'area'}"/>
<c:set var="level" value="${createAbsoluteAreas? currentNode.properties.level.string : '0'}" />
<c:if test="${createAbsoluteAreas && renderContext.editModeConfigName eq 'studiomode'}">
    <c:set var="displayAbsoluteArea">
        <div class="card text-white bg-danger mb-3">
            <div class="card-header">
                <fmt:message key="bootstrap4nt_grid.absolute.area.title"/>
            </div>
            <div class="card-body">
                <p class="card-text">
                <fmt:message key="bootstrap4nt_grid.absolute.area.desc">
                    <fmt:param value="${level}"/>
                </fmt:message>
                </p>
            </div>
        </div>
    </c:set>
</c:if>

<c:choose>
    <c:when test="${not empty columns}">
        <c:forTokens items="${columns}" delims="," varStatus="status" var="col">
            <div class="${fn:trim(col)}">${displayAbsoluteArea}
                <template:area path="${colName}-col${status.index}"
                               areaAsSubNode="true" moduleType="${moduleType}" level="${level}"/>
            </div>
        </c:forTokens>
    </c:when>

    <c:otherwise>
        <div class="col-md-12">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <strong><fmt:message key="bootstrap4nt_grid.warning"/></strong>
                <span><fmt:message key="bootstrap4nt_grid.couldNotDisplayGrid">
                    <fmt:param value="${columns}"/>
                </fmt:message></span>
            </div>
        </div>
    </c:otherwise>
</c:choose>

