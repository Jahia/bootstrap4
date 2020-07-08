<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<template:option node="${currentNode}" nodetype="html5mix:htmlAttrCustom" view="withElement" >
    <template:param name="element" value="article" />
</template:option>