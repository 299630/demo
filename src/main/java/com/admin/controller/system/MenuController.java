package com.admin.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.entity.Menu;
import com.admin.service.MenuService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("system/menu")
public class MenuController {
	@Autowired
	MenuService menuService;

	@RequestMapping(value = "", produces = "application/json;charset=utf-8")
	public String menu() {
		return "system/menu/menuList";
	}

	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getList(Menu menu) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("rows", menuService.getList(menu));
		return new JSONArray(menuService.getList(menu)).toString();
	}
	@RequestMapping( value = "dynamicTree",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String dynamicMenu(Menu menu) {
		Map<String, Object> map = new HashMap<>();
		List<Menu> list = menuService.getParentId(menu.getParentId());
		if (list.size() > 0){
			for (Menu m : list){
				if (menuService.getParentId(m.getId()).size() > 0){
					m.setState("closed");
				}else {
					m.setState("open");
				}
			}
		}
		map.put("rows",list);
		if (menu.getParentId() != 0){
			return new JSONArray(list).toString();
		}
		return new JSONObject(map).toString();
	}
	@PostMapping("/insert")
	@ResponseBody
	public String insert(Menu menu) {
		return menuService.insert(menu)+"";
	}

	@PostMapping("/update")
	@ResponseBody
	public String update(Menu menu) {
		return menuService.update(menu)+"";
	}

	@RequestMapping("/getMenu")
	@ResponseBody
	public String getMenu(Menu menu) {
		Map<String, Object> map = new HashMap<>();
		map.put("rows", menuService.getMenu(menu));
		return new JSONObject(map).toString();
	}

	@RequestMapping(value = "/getPage", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getPage(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", menuService.getPage(menu));
		map.put("total", menuService.getCount(menu));
		return new JSONObject(map).toString();
	}

}