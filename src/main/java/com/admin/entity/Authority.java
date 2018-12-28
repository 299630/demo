package com.admin.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 *权限表
 * @author Liu LiPu
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class Authority  implements Serializable {

	/**
	 * 权限id
	 */
	private Integer id;

	/**
	 * 角色id
	 */
	private Integer roleId;

	/**
	 * 菜单id
	 */
	private Integer menuId;
}