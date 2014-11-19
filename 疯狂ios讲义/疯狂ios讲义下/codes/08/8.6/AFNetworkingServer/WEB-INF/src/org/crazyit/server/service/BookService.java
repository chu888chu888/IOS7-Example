package org.crazyit.server.service;

import java.util.*;
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
public class BookService
{
	static List<Author> authorsDb = new ArrayList<>();
	static Map<Integer , List<Book>> booksDb = new LinkedHashMap<>();

	static {
		authorsDb.add(new Author(1 , "李刚" , "国内著名IT技术作家"));
		authorsDb.add(new Author(2 , "冯梦龙" , "著名小说作家"));
		List<Book> books1 = new ArrayList<Book>();
		books1.add(new Book(1, "疯狂iOS讲义" , "李刚"
			, "基于最新版本的iOS 7"));
		books1.add(new Book(2, "疯狂Java讲义" , "李刚"
			, "本书来自作者6年的Java培训经历，凝结了作者近6000个小时的授课经验"));
		books1.add(new Book(3, "轻量级Java EE企业应用实战" , "李刚"
			, "本书主要介绍以Spring+Hibernate+Struts2为基础的Java EE应用"));
		books1.add(new Book(4, "疯狂Android讲义" , "李刚"
			, "本书第一版长期雄踞各网店、书店Android图书销量排行榜的前列"));
		booksDb.put(1 , books1);
		List<Book> books2 = new ArrayList<Book>();
		books2.add(new Book(5, "醒世恒言" , "冯梦龙"
			, "三言二拍之醒世恒言"));
		books2.add(new Book(6, "喻世明言" , "冯梦龙"
			, "三言二拍之喻世明言"));
		books2.add(new Book(7, "警世通言" , "冯梦龙"
			, "三言二拍之警世通言"));
		booksDb.put(2 , books2);
	}

	public List<Author> getAllAuthors()
	{
		return authorsDb;
	}
	public List<Book> getBooksByAuthor(Integer authorId)
	{
		return booksDb.get(authorId);
	}
}
