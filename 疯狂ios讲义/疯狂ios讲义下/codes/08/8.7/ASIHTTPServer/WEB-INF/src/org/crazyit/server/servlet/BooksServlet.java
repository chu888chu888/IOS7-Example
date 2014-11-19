package org.crazyit.server.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;
import org.json.*;

import org.crazyit.server.service.*;
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
@WebServlet(urlPatterns={"/books.json"})
public class BooksServlet extends HttpServlet
{
	public void service(HttpServletRequest request ,
		HttpServletResponse response)
		throws IOException , ServletException
	{
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		String authorId = request.getParameter("authorId");
		// 获取所有的作者信息
		JSONArray jsonArr= new JSONArray(new BookService()
			.getBooksByAuthor(Integer.parseInt(authorId)));
		response.getWriter().println(jsonArr.toString());
	}
}