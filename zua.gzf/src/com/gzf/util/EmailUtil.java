package com.gzf.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


public class EmailUtil {
	public static void createMimeMessage(String email,String content) throws UnsupportedEncodingException, MessagingException {
		Properties properties = new Properties();
//		使用的协议
		properties.setProperty("mail.transport.protocol", "smtp");
//QQ邮箱协议地址
		properties.setProperty("mail.smtp.host", "smtp.qq.com");
//端口号
		properties.setProperty("mail.smtp.port", "465");
//是否需要授权
		properties.setProperty("mail.smtp.auth", "true");
//qq:ssl安全认证
		//引用需要的类
		properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		//是否处理未经SSL认证的信息
		properties.setProperty("mail.smtp.socketFactory.fallback", "true");
		//SSL认证的端口号
		properties.setProperty("mail.smtp.socketFactory.port", "465");
		Session session = Session.getInstance(properties);
		//		MimeMessage定义了大多数消息公共属性的抽象获取和设置方法
		MimeMessage mimeMessage = new MimeMessage(session);
	//	设置发件人地址信息
		Address address = new InternetAddress("1226164732@qq.com","gzf","utf-8"); 
		mimeMessage.setFrom(address);
		mimeMessage.setSubject("来自谷占方的邮件","utf-8");
		content = "您正在注册宿舍管理系统管理员，验证码为"+content;
		mimeMessage.setContent(content, "text/html;charset=utf-8");
		//设置传送日期
		mimeMessage.setSentDate(new Date());
		//设置接收人,  .to为正常发送  .cc为抄送  .bcc为密送
		mimeMessage.setRecipient(RecipientType.TO,new InternetAddress(email, "小可爱", "utf-8"));
		//保存邮件
		mimeMessage.saveChanges();
		
		
		//实例化一个对象，单例模式
		
		session.setDebug(true);
		
		//创建邮箱
		//建立连接对象
		Transport transport = session.getTransport();
		//此处QQ必须填密钥而不是密码
		transport.connect("1226164732@qq.com", "xaetrwzpaknkgeeb");
		//进行发送
		transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());
		//关闭连接
		transport.close();
		
	}
}
