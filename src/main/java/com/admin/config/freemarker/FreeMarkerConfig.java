package com.admin.config.freemarker;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.jagregory.shiro.freemarker.ShiroTags;

import freemarker.template.TemplateException;

/**
 * @author     Liu LiPu
 * freemarker配置类
 */
@Configuration
public class FreeMarkerConfig {
	/**
	 * 配置freemarker
	 * @return
	 * @throws IOException
	 * @throws TemplateException
	 */
	@Bean
	public FreeMarkerConfigurer freeMarkerConfigurer() throws IOException, TemplateException {
	    FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
	    //设置模板路径，自动拼接.ftl后缀
	    freeMarkerConfigurer.setTemplateLoaderPath("classpath:templates/");
	    freemarker.template.Configuration configuration = freeMarkerConfigurer.createConfiguration();
	    configuration.setDefaultEncoding("UTF-8");
	    //freemarker启用shiro标签
	    configuration.setSharedVariable("shiro", new ShiroTags());
	    //设置日期格式化
	    configuration.setDateFormat("yyyy-MM-dd");
	    configuration.setTimeFormat("HH:mm:ss");
	    configuration.setDateTimeFormat("yyyy-MM-dd HH:mm:ss");
	    configuration.setClassicCompatible(true);
	    freeMarkerConfigurer.setConfiguration(configuration);
	    return freeMarkerConfigurer;
	}
}
