package com.ht.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ServerListener implements ServletContextListener {

	private static final Logger logger = LoggerFactory.getLogger(ServerListener.class);

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		logger.info("办公系统正在启动------服务器即将被启动------并且保存到应用上下文中");
	}

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		logger.info("办公系统正在销毁------服务器即将被关闭------并且从应用上下文中删除");
	}

}
