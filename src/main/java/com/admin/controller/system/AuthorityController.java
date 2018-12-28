package com.admin.controller.system;

import java.util.HashMap;
import java.util.Map;

import com.admin.entity.Authority;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.service.AuthorityService;

/**
 * @author Liu LiPu
 */
@Controller
@RequestMapping("authority")
public class AuthorityController {
	@Autowired
	AuthorityService authorityService;

	@RequestMapping(value = "", produces = "application/json;charset=utf-8")
	public String authority() {
		return "authority/authorityList";
	}

	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getList(Authority authority) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", authorityService.getList(authority));
		return new JSONObject(map).toString();
	}
	
	@RequestMapping(value = "/getPage", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getPage(Authority authority) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", authorityService.getPage(authority));
		map.put("total", authorityService.getCount(authority));
		return new JSONObject(map).toString();
	}

}