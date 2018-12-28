package com.admin.controller.monitor;

import com.admin.entity.server.Server;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author:Liu LiPu
 */
@Controller
@RequestMapping("monitor/server")
public class ServerController
{
    @RequestMapping(value = "")
    public String server(ModelMap mmap) throws Exception
    {
        Server server = new Server();
        //获取服务器信息
        server.copyTo();
        //ModelMap可以在返回时往前台传递map集合，类似的方法还有Model,ModelAndView等
        mmap.put("server", server);
        return "monitor/server";
    }
}
