<%@page import="org.pac4j.core.exception.RequiresHttpAction"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.leleuj.WebUtils"%>
<%@page import="io.buji.pac4j.*"%>
<%@page import="org.pac4j.http.client.*"%>
<%@page import="org.pac4j.oauth.client.*"%>
<%@page import="org.pac4j.cas.client.*"%>
<%
	Subject subject = SecurityUtils.getSubject();
	FacebookClient fbClient = WebUtils.getObject(pageContext, FacebookClient.class, "facebookClient");
	TwitterClient twClient = WebUtils.getObject(pageContext, TwitterClient.class, "twitterClient");
	FormClient formClient = WebUtils.getObject(pageContext, FormClient.class, "formClient");
	BasicAuthClient baClient = WebUtils.getObject(pageContext, BasicAuthClient.class, "basicAuthClient");
	CasClient casClient = WebUtils.getObject(pageContext, CasClient.class, "casClient");
	VkClient vkClient = WebUtils.getObject(pageContext, VkClient.class, "vkClient");
	ShiroWebContext context = new ShiroWebContext(request, response);
%>
<h1>index</h1>
<a href="facebook/index.jsp">Protected url by Facebook : facebook/index.jsp</a><br />
<a href="twitter/index.jsp">Protected url by Twitter : twitter/index.jsp</a><br />
<a href="form/index.jsp">Protected url by form authentication : form/index.jsp</a><br />
<a href="basicauth/index.jsp">Protected url by basic auth : basicauth/index.jsp</a><br />
<a href="cas/index.jsp">Protected url by CAS : cas/index.jsp</a><br />
<a href="vk/index.jsp">Protected url by Vk : vk/index.jsp</a><br />
<br />
<a href="logout">logout</a>
<br /><br />
profile : <%=subject.getPrincipals()%>
<br /><br />
<hr />
<%
try {
%>
<a href="<%=fbClient.getRedirectionUrl(context, false, false)%>">Authenticate with Facebook</a><br />
<a href="<%=twClient.getRedirectionUrl(context, false, false)%>">Authenticate with Twitter</a><br />
<a href="<%=formClient.getRedirectionUrl(context, false, false)%>">Authenticate with form</a><br />
<a href="<%=baClient.getRedirectionUrl(context, false, false)%>">Authenticate with basic auth</a><br />
<a href="<%=casClient.getRedirectionUrl(context, false, false)%>">Authenticate with CAS</a><br />
<a href="<%=vkClient.getRedirectionUrl(context, false, false)%>">Authenticate with Vk</a><br />
<%
} catch (RequiresHttpAction e) {
	// should not happen
}
%>
