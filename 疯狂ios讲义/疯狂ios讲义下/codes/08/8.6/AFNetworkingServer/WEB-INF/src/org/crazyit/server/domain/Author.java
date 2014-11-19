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
public class Author
{
	private Integer id;
	private String name;
	private String desc;

	public Author()
	{
	}

	public Author(Integer id , String name , String desc)
	{
		this.id = id;
		this.name = name;
		this.desc = desc;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}
	public Integer getId()
	{
		return this.id;
	}

	public void setName(String name)
	{
		this.name = name;
	}
	public String getName()
	{
		return this.name;
	}

	public void setDesc(String desc)
	{
		this.desc = desc;
	}
	public String getDesc()
	{
		return this.desc;
	}
}