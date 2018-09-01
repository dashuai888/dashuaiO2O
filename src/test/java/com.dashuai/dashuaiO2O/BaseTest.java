package com.dashuai.dashuaiO2O;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by wangyishuai on 2018/9/2
 * 配置 Spring 和 junit 的整合：在 junit 启动时加载 Spring IOC 容器
 */
// 让测试运行于 Spring 环境
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉 junit spring 配置文件的位置
@ContextConfiguration(
        {"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml"}
        )
public class BaseTest {
}
