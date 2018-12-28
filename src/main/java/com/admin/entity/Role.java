package com.admin.entity;

import com.admin.utils.PageUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 *角色表
 * @author Liu LiPu
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Role extends PageUtil  implements Serializable {

	/**
	 * 角色id
	 */
	private Integer id;

	/**
	 * 角色名称
	 */
	private String roleName;

	/**
	 * 显示顺序
	 */
	private Integer roleSort;
}