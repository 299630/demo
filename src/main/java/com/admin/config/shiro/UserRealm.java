package com.admin.config.shiro;

import com.admin.entity.User;
import com.admin.service.MenuService;
import com.admin.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Liu LiPu
 * 自定义Realm，通过subject.login(token)触发
 */
public class UserRealm extends AuthorizingRealm
{
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;

	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		String loginName = ((User) principal.getPrimaryPrincipal()).getLoginName();
		User user = userService.get(loginName);
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		//设置权限信息
		authorizationInfo.setStringPermissions(menuService.getPermission(user.getRoleId()));

		return authorizationInfo;
	}

	/**
	 * 认证.登录
	 * @param token
	 * @return
	 * @throws AuthenticationException
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException
	{
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String loginName = upToken.getUsername();
		User user = userService.get(loginName);
		//没找到帐号
		if(user == null)
		{
			throw new UnknownAccountException();
		}
		//账号被冻结
		if(user.getStatus() == 0)
		{
			throw new DisabledAccountException();
		}
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), getName());
		return info;
	}
}
