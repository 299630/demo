package com.admin.service.Impl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.entity.Menu;
import com.admin.mapper.MenuMapper;
import com.admin.service.MenuService;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	MenuMapper menuMapper;

	@Override
	public List<Menu> getPage(Menu menu) {
		return menuMapper.getPage(menu);
	}

	@Override
	public List<Menu> getList(Menu menu) {
		return menuMapper.getList(menu);
	}

	@Override
	public Menu get(Integer id) {
		return menuMapper.get(id);
	}

	@Override
	public int getCount(Menu menu) {
		return menuMapper.getCount(menu);
	}

	@Override
	public int insert(Menu menu) {
		return menuMapper.insert(menu);
	}

	@Override
	public int delete(Integer id) {
		return menuMapper.delete(id);
	}

	@Override
	public int update(Menu menu) {
		return menuMapper.update(menu);
	}

	@Override
	public Set<String> getPermission(Integer roleId) {
		List<String> perms = menuMapper.getPermission(roleId);
		Set<String> permsSet = new HashSet<>();
		for (String perm : perms)
		{
			permsSet.addAll(Arrays.asList(perm.trim().split(",")));
		}
		return permsSet;
	}

	@Override
	public JSONArray getMenu(Menu tree){
		JSONArray array = new JSONArray();
		JSONObject temp = new JSONObject();
		List<Menu> list = menuMapper.getList(tree);
		if (list.size() > 0){
			for(Menu t :list) {
				//只遍历顶级节点
				if (t.getParentId() == 0){
					temp.put("id", t.getId());
					temp.put("text", t.getMenuName());
					putGridChild(temp, list, t.getId());
					array.add(temp);
				}
			}
		}
		return array;
	}

	//递归生成树
	private void putGridChild(JSONObject obj, List<Menu> list, Integer parId){
		JSONArray array = new JSONArray();
		JSONObject temp = new JSONObject();
		for(Menu t :list){
			if(parId.equals(t.getParentId())){
				temp.put("id",t.getId());
				temp.put("text",t.getMenuName());
				putGridChild(temp, list, t.getId());
				array.add(temp);
			}
		}
		if(array != null){
			obj.put("children",array);
		}
	}

	@Override
	public List<Menu> getParentId(Integer id) {
		return menuMapper.getParentId(id);
	}
}