package com.admin.entity;

import com.admin.utils.PageUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 *用户表
 * @author Liu LiPu
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class User extends PageUtil implements Serializable {

	/**
	 * 用户id
	 */
	private Integer id;

	/**
	 * 用户姓名
	 */
	private String username;

	/**
	 * 密码
	 */
	private String password;

	/**
	 * 角色编号
	 */
	private Integer roleId;

	/**
	 * 帐号状态（1正常 0停用）
	 */
	private Integer status;

	/**
	 * 登录账号
	 */
	private String loginName;

	/**
	 * 最后登陆IP
	 */
	private String loginIp;

	/**
	 * 最后登陆时间
	 */
	private Date loginDate;

	/**
	 * 用户头像
	 */
	private String img;

	/**
	 * 主题
	 */
	private String theme;

	private Role role;
}