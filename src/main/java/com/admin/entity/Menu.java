package com.admin.entity;

import com.admin.utils.PageUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 *菜单表
 * @author Liu LiPu
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class Menu extends PageUtil  implements Serializable {

	/**
	 * 菜单id
	 */
	private Integer id;

	/**
	 * 菜单名称
	 */
	private String menuName;

	/**
	 * 菜单路径
	 */
	private String menuUrl;

	/**
	 * 权限标识
	 */
	private String permission;

	/**
	 * 权限标识
	 */
	private String menuIcon;

	/**
	 * 父菜单id
	 */
	private Integer parentId;

	/**
	 * 菜单类型0按钮1菜单
	 */
	private Integer status;

	/**
	 * 显示顺序
	 */
	private Integer menuSort;
	private String  state;

}