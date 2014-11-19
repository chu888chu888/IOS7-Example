
import java.net.*;
import java.io.*;
/**
 * Description:
 * <br/>网站: <a href="http://www.crazyit.org">疯狂Java联盟</a>
 * <br/>Copyright (C), 2001-2014, Yeeku.H.Lee
 * <br/>This program is protected by copyright laws.
 * <br/>Program Name:
 * <br/>Date:
 * @author  Yeeku.H.Lee kongyeeku@163.com
 * @version  1.0
 */
public class SimpleServer
{
	public static void main(String[] args)
		throws IOException
	{
		// 创建一个ServerSocket，用于监听客户端Socket的连接请求
		ServerSocket ss = new ServerSocket(30000);  //①
		// 采用循环不断接受来自客户端的请求
		while (true)
		{
			// 每当接受到客户端Socket的请求，服务器端也对应产生一个Socket
			final Socket s = ss.accept();
			new Thread()
			{
				@Override
				public void run()
				{
					try
					{
						InputStream is = s.getInputStream();
						byte[] buff = new byte[2048];
						int hasRead = -1;
						while((hasRead = is.read(buff)) > 0)
						{
							System.out.println("接受的数据："
								+ new String(buff , 0 , hasRead, "utf-8"));
						}
					}
					catch (Exception ex)
					{
						ex.printStackTrace();
					}
				}
			}.start();
			OutputStream os = s.getOutputStream();
			os.write("您好，您收到了Java服务器的新年祝福！\n"
				.getBytes("utf-8"));
		}
	}
}
