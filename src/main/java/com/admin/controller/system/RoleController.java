package com.admin.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.admin.entity.Role;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.service.RoleService;
import sun.reflect.generics.tree.Tree;

/**
 * @author Liu LiPu
 */
@Controller
@RequestMapping("system/role")
public class RoleController {
	@Autowired
	RoleService roleService;

	
	@RequestMapping(value = "", produces = "application/json;charset=utf-8")
	public String role() {
		return "system/role/roleList";
	}

	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getList(Role role) {
		Map<String, Object> map = new HashMap<String, Object>(1);
		map.put("rows", roleService.getList(role));
		return new JSONObject(map).toString();
	}

	@RequestMapping("/append")
	@ResponseBody
	public String append(Role role) {
		return new JSONArray(roleService.getList(role)).toString();
	}

	@RequestMapping(value = "/getPage", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getPage(Role role) {
		Map<String, Object> map = new HashMap<String, Object>(2);
		map.put("rows", roleService.getPage(role));
		map.put("total", roleService.getCount(role));
		return new JSONObject(map).toString();
	}

}