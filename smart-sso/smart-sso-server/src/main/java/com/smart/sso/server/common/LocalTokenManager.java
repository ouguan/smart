package com.smart.sso.server.common;

import java.util.Date;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import org.openstack4j.model.common.Identifier;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.openstack.OSFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.smart.mvc.config.ConfigUtils;
import com.smart.sso.server.model.KeyStone;
import com.smart.sso.server.util.SerializeUtil;

/**
 * 单实例环境令牌管理
 * 
 * @author Joe
 */
public class LocalTokenManager extends TokenManager {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 令牌存储结构
	private final ConcurrentHashMap<String, DummyUser> tokenMap = new ConcurrentHashMap<String, DummyUser>();

	@Override
	public void verifyExpired() {
		Date now = new Date();
		for (Entry<String, DummyUser> entry : tokenMap.entrySet()) {
			String token = entry.getKey();
			DummyUser dummyUser = entry.getValue();
			// 当前时间大于过期时间
			if (now.compareTo(dummyUser.expired) > 0) {
				// 已过期，清除对应token
				if (now.compareTo(dummyUser.expired) > 0) {
					tokenMap.remove(token);
					logger.debug("token : " + token + "已失效");
				}
			}
		}
	}

	@Override
    public void addToken(String token, LoginUser loginUser) {
		DummyUser dummyUser = new DummyUser();
		dummyUser.loginUser = loginUser;
		extendExpiredTime(dummyUser);
		tokenMap.putIfAbsent(token, dummyUser);
	}

	@Override
    public LoginUser validate(String token) {
		DummyUser dummyUser = tokenMap.get(token);
		if (dummyUser == null) {
			return null;
		}
		
		// 重新扩展KeyStone Token信息
        KeyStone keystone = dummyUser.loginUser.getKeystone();
        Token keyStoneToken = SerializeUtil.bytesToToken(keystone.getUsertoken());
        keyStoneToken = OSFactory.builderV3()
                                 .endpoint(ConfigUtils.getProperty("openstack.url"))
                                 .scopeToProject(Identifier.byName(keystone.getProjectname()),Identifier.byName("default"))
                                 .token(keyStoneToken.getId())
                                 .authenticate()
                                 .getToken();
        dummyUser.loginUser.getKeystone().setUsertoken(SerializeUtil.tokenToBytes(keyStoneToken));
		extendExpiredTime(dummyUser);
		return dummyUser.loginUser;
	}

	@Override
    public void remove(String token) {
		tokenMap.remove(token);
	}

	/**
	 * 扩展过期时间
	 * 
	 * @param dummyUser
	 */
	private void extendExpiredTime(DummyUser dummyUser) {
		dummyUser.expired = new Date(new Date().getTime() + tokenTimeout * 1000);
		logger.debug("SSO Token(过期时间) : " + dummyUser.expired);
	}

	// 复合结构体，含loginUser与过期时间expried两个成员
	private class DummyUser {
		private LoginUser loginUser;
		private Date expired; // 过期时间
	}
}
