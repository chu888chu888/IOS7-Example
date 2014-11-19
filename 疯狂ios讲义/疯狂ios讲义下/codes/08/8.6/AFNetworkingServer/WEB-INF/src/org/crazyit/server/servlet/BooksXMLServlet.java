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
@WebServlet(urlPatterns={"/books.xml"})
public class BooksXMLServlet extends HttpServlet
{
	public void service(HttpServletRequest request ,
		HttpServletResponse response)
		throws IOException , ServletException
	{
		response.setContentType("text/xml");
		response.setCharacterEncoding("utf-8");
		String authorId = request.getParameter("authorId");
		// 获取所有的作者信息
		List<Book> books = new BookService()
			.getBooksByAuthor(Integer.parseInt(authorId));
		PrintWriter writer = response.getWriter();
		writer.println("<books>");
		for (Book book : books )
		{
			writer.println("<book>");
			writer.println("<id>" + book.getId() + "</id>");
			writer.println("<title>" + book.getTitle() + "</title>");
			writer.println("<author>" + book.getAuthor() + "</author>");
			writer.println("<remark>" + book.getRemark() + "</remark>");
			writer.println("</book>");
		}
		writer.println("</books>");
	}
}