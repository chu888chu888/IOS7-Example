package org.crazyit.server.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;
import java.util.*;
import org.json.*;

import org.crazyit.server.service.*;
import org.crazyit.server.domain.*;
/**
 * Description:
 * <br/>网站: <a href="http://www.crazyit.org">疯狂Java联盟</a>
 * <br/>Copyright (C), 2001-2014, Yeeku.H.Lee
 * <br/>This program is protected by copyright laws.
 * <br/>Program Name:
 * <br/>Date:
 * @author Yeeku.H.Lee kongyeeku@163.com
 * @version 1.0
 */
@WebServlet(urlPatterns={"/authors.xml"})
public class AuthorsXMLServlet extends HttpServlet
{
	public void service(HttpServletRequest request ,
		HttpServletResponse response)
		throws IOException , ServletException
	{
		response.setContentType("text/xml");
		response.setCharacterEncoding("utf-8");
		List<Author> authors = new BookService().getAllAuthors();
		PrintWriter writer = response.getWriter();
		writer.println("<authors>");
		for (Author author : authors )
		{
			writer.println("<author>");
			writer.println("<id>" + author.getId() + "</id>");
			writer.println("<name>" + author.getName() + "</name>");
			writer.println("<desc>" + author.getDesc() + "</desc>");
			writer.println("</author>");
		}
		writer.println("</authors>");
	}
}