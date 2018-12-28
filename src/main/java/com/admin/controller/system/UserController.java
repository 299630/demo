package com.admin.controller.system;

import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.admin.entity.User;
import com.admin.service.UserService;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("system/user")
public class UserController {
	@Autowired
	UserService userService;

	@GetMapping("")
	public String userList()
	{
		return "system/user/userList";
	}

	@GetMapping("/img")
	public String userImg()
	{
		return "system/user/userImg";
	}

	@PostMapping("/toLogin")
	@ResponseBody
	public String toLogin(String loginName, String password, Boolean rememberMe)
	{
		if (rememberMe == null)
		{
			rememberMe = false;
		}
		UsernamePasswordToken token = new UsernamePasswordToken(loginName, password, rememberMe);
		Subject subject = SecurityUtils.getSubject();
		try {
			//调用UserRealm进行认证登录
			subject.login(token);
		} catch (LockedAccountException lae){
			return "账号已被锁定";
		} catch (UnknownAccountException uae) {
			return "用户名错误";
		} catch (IncorrectCredentialsException ice) {
			return "密码错误";
		} catch (DisabledAccountException dae) {
			return "账号已被冻结";
		} catch (Exception e) {
			e.printStackTrace();
			return "登录失败";
		}
		return "index";
	}

	@PostMapping("/upload")
	@ResponseBody
	public Object uploadImg(String image, HttpServletRequest request, HttpServletResponse response)
	{
        String path = "/D:/images/";
		System.out.println(path);
		response.setHeader("Access-Control-Allow-Origin", "*");
		Base64 base64 = new Base64();
		try
		{
		  File file = new File(path);
		  // 判断文件是否存在。
		  if(!file.exists())
		  {
			// 新建文件夹。
			file.mkdirs();
		  }
			if(null != image)
			{
			  byte[] k = base64.decode(image.substring("data:image/jpeg;base64,".length()));
			  InputStream is = new ByteArrayInputStream(k);
			  String fileName = UUID.randomUUID().toString().replace("-", "") + ".jpg";
			  String imgFilePath = path +  fileName;
			  BufferedImage imageB = ImageIO.read(is);
			  boolean flag = ImageIO.write(imageB, "jpg", new File(imgFilePath));
			  System.out.println(imgFilePath + " ------- " + flag);
			  userService.upload(fileName);
			  return "true";
			}
		} catch (IOException e1)
		{
			e1.printStackTrace();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	  }

	@GetMapping("/theme")
	@ResponseBody
	public String theme(String theme)
	{
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		return userService.theme(user.setTheme(theme))+"";
	}

	@GetMapping("/getList")
	@ResponseBody
	public String getList(User user)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", userService.getList(user));
		return new JSONObject(map).toString();
	}

	@GetMapping("/getPage")
	@ResponseBody
	public String getPage(User user)
	{
		Map<String, Object> map = new HashMap<String, Object>(3);
		map.put("rows", userService.getPage(user));
		map.put("total", userService.getCount(user));
		return new JSONObject(map).toString();
	}

}