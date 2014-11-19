import java.net.*;
import java.io.*;
import java.util.*;

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
public class ChatServer
{
	// 定义保存所有Socket的ArrayList
	public static ArrayList<Socket> socketList
		= new ArrayList<Socket>();
    public static void main(String[] args)
		throws IOException
    {
		ServerSocket ss = new ServerSocket(30000);
		while(true)
		{
			// 此行代码会阻塞，将一直等待别人的连接
			Socket s = ss.accept();
			socketList.add(s);
			System.out.println(socketList);
			// 每当客户端连接后启动一条ServerThread线程为该客户端服务
			new Thread(new ServerThread(s)).start();
		}
    }
}
// 负责处理每个线程通信的线程类
class ServerThread implements Runnable
{
	// 定义当前线程所处理的Socket
	Socket s = null;
	// 该线程所处理的Socket所对应的输入流
	InputStream is = null;
	public ServerThread(Socket s)
		throws IOException
	{
		this.s = s;
		// 初始化该Socket对应的输入流
		is = s.getInputStream();
	}
	public void run()
	{
		try
		{
			byte[] buff = new byte[2048];
			int hasRead = -1;
			while((hasRead = is.read(buff)) > 0)
			{
				// 遍历socketList中的每个Socket，
				// 将读到的内容向每个Socket发送一次
				for (Iterator<Socket> it = ChatServer.socketList.iterator(); it.hasNext(); )
				{
					Socket s = it.next();
					try{

						OutputStream os = s.getOutputStream();
						os.write(buff , 0 , hasRead);
					}
					catch(SocketException e)
					{
						e.printStackTrace();
						// 删除该Socket。
						it.remove();
						System.out.println(ChatServer.socketList);
					}
				}
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}