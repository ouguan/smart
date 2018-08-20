package com.smart.sso.server.common;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.annotation.Resource;
import org.openstack4j.model.identity.v3.Token;

/**
 * 分布式环境令牌管理
 * 
 * @author Joe
 */
public class RedisTokenManager extends TokenManager {

	/**
	 * 是否需要扩展token过期时间
	 */
	private Set<String> tokenSet = new CopyOnWriteArraySet<String>();

	@Resource
	private RedisCache<Token> redisCache;

	@Override
	public void addToken(String key, Token token) {
		redisCache.set(key, token, tokenTimeout);
	}

	@Override
	public Token validate(String key) {
		Token token = redisCache.get(key);
		if (token != null && !tokenSet.contains(key)) {
			tokenSet.add(key);
			addToken(key, token);
		}
		return token;
	}

	@Override
	public void remove(String token) {
		redisCache.delete(token);
	}

	@Override
	public void verifyExpired() {
		tokenSet.clear();
	}
}
