<%@ taglib uri="http://www.jahia.org/tags/jcr" prefix="jcr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="backgroundColor" value="${currentNode.properties.backgroundColor.string}"/>

<div class="alert alert-${backgroundColor}" role="alert">
    ${wrappedContent}
</div>
