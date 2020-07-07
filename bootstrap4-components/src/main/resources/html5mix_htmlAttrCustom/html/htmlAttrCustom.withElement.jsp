<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<${currentResource.moduleParams.element} <template:option node="${currentNode}" nodetype="html5mix:htmlAttrCustom" view="default" /> >
    <template:area path="${currentResource.moduleParams.element}" areaAsSubNode="true" moduleType="area" />
</${currentResource.moduleParams.element}>