
import java.io.*;
import java.net.*;
/**
 * Description:
 * <br/>网站: <a href="http://www.crazyit.org">疯狂Java联盟</a>
 * <br/>Copyright (C), 2001-2012, Yeeku.H.Lee
 * <br/>This program is protected by copyright laws.
 * <br/>Program Name:
 * <br/>Date:
 * @author Yeeku.H.Lee kongyeeku@163.com
 * @version 1.0
 */
public class ChatClient
{
	public static void main(String[] args)throws Exception
	{
		Socket s = new Socket("192.168.1.88" , 30000);
		// 客户端启动ClientThread线程不断读取来自服务器的数据
		new Thread(new ClientThread(s)).start();
		// 获取该Socket对应的输出流
		OutputStream os = s.getOutputStream();
		String line = null;
		// 不断读取键盘输入
		BufferedReader br = new BufferedReader(
			new InputStreamReader(System.in));
		while ((line = br.readLine()) != null)
		{
			// 将用户的键盘输入内容写入Socket对应的输出流
			os.write(("Java说：" + line).getBytes("utf-8"));
		}
	}
}
class ClientThread implements Runnable
{
	// 该线程负责处理的Socket
	private Socket s;
	// 该线程所处理的Socket所对应的输入流
	InputStream is = null;
	public ClientThread(Socket s)
		throws IOException
	{
		this.s = s;
		is = s.getInputStream();
	}
	public void run()
	{
		byte[] buff = new byte[2048];
		int hasRead = -1;
		try
		{
			while((hasRead = is.read(buff)) > 0)
			{
				System.out.println(new String(buff , 0
					, hasRead , "utf-8"));
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}