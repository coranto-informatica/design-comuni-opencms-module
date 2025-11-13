<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" buffer="none" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="org.opencms.jsp.*, org.opencms.file.*, org.opencms.main.*, org.opencms.search.solr.*, org.opencms.search.*, org.json.*" %>
<%
    CmsObject cms = CmsFlexController.getCmsObject(request);
    String lang = cms.getRequestContext().getLocale().toString();
    String category = request.getParameter("category");

    String resType = "COMService";
    String path = cms.getRequestContext().getSiteRoot() + "/.content/COMService";

    JSONArray jsonArray = new JSONArray();

    try {
        CmsSolrIndex index = OpenCms.getSearchManager().getIndex("default");
        CmsSolrQuery query = new CmsSolrQuery("*:*");

        query.addFilterQuery("parent-folders:\"" + path + "\"");
        query.addFilterQuery("type:" + resType);
        query.addFilterQuery("con_locales:" + lang);
        if (category != null && !category.isEmpty() && !"relazioniconilpubblico".equals(category)) {
            query.addFilterQuery("Category_" + lang + ":" + category);
        }

        query.setSort("title_" + lang + "_s", CmsSolrQuery.ORDER.asc);
        query.setFields("title_" + lang + "_s", "id");
        query.setRows(100);

        CmsSolrResultList results = index.search(cms, query);

        for (CmsSearchResource res : results) {
            JSONObject obj = new JSONObject();
            obj.put("label", res.getField("title_" + lang + "_s"));
            obj.put("value", res.getId().toString());
            jsonArray.put(obj);
        }
    } catch (Exception e) {
        // loggare o ignorare
    }

    out.print(jsonArray.toString());
%>
