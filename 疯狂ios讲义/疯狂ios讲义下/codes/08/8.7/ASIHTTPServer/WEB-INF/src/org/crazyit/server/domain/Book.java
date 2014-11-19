package org.crazyit.server.domain;

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
public class Book
{
	private Integer id;
	private String title;
	private String author;
	private String remark;

	public Book()
	{
	}

	public Book(Integer id , String title , String author , String remark)
	{
		this.id = id;
		this.title = title;
		this.author = author;
		this.remark = remark;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}
	public Integer getId()
	{
		return this.id;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getTitle()
	{
		return this.title;
	}

	public void setAuthor(String author)
	{
		this.author = author;
	}
	public String getAuthor()
	{
		return this.author;
	}

	public void setRemark(String remark)
	{
		this.remark = remark;
	}
	public String getRemark()
	{
		return this.remark;
	}

}