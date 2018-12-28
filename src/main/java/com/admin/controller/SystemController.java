package com.admin.controller;

import com.admin.entity.Menu;
import com.admin.entity.User;
import com.admin.entity.server.Server;
import com.admin.service.MenuService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author:Liu LiPu
 */
@Controller
public class SystemController {
    @Autowired
    MenuService menuService;

    @RequestMapping(value = "/")
    public String home()
    {
        return "index";
    }

    /**
     * shiro已经提供了权限控制，这里只是为了保险
     * @param mmap
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(ModelMap mmap)
    {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        List<Menu> list = menuService.getList(new Menu());
        List<Menu> menus = new ArrayList<>();
        List<Menu> menu = new ArrayList<>();
        if (list.size() > 0){
            for (Menu m : list){
                if (m.getParentId() == 0){
                    menus.add(m);
                }else {
                    menu.add(m);
                }
            }
        }
        mmap.addAttribute("menus", menus);
        mmap.addAttribute("menu", menu);
        return "index";
    }

    /**
     * 若shiro配置的logout不生效，可以启用以下注销方法
     * @return
     */
/*    @GetMapping("/logout")
    public String logout() {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        return "login";
    }*/

    @GetMapping("/login")
    public String login() {
//        redirect
        return "login";
    }

    @RequestMapping(value = "AuthCode")
    public String authCode()
    {
        return "AuthCode";
    }

    @RequestMapping(value = "/server")
    public String server(ModelMap mmap) throws Exception
    {
        Server server = new Server();
        server.copyTo();
        mmap.put("server", server);
        return "server";
    }

}