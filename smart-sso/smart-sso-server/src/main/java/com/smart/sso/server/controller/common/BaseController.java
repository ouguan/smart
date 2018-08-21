package com.smart.sso.server.controller.common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.openstack4j.model.identity.v3.Token;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.util.StringUtils;
import com.smart.sso.client.SessionUtils;
import com.smart.sso.server.model.User;
import com.smart.sso.server.util.SerializeUtil;

/**
 * Controller基类
 * 
 * @author Joe
 */
public class BaseController {

    public static User  user;
    public static Token token;

    public static void init(User loginUser, Token keyStoneToken) {

        if (loginUser != null && keyStoneToken != null) {
            user = loginUser;
            token = keyStoneToken;
            if (!loginUser.getAccount().equals(token.getUser().getName())) {
                Result.create(ResultCode.VALIDATE_ERROR).setMessage("登录失败");
            }
        }
    }

    public static void init(Token keyStoneToken, HttpServletRequest request) {

        if (keyStoneToken != null) {
            token = keyStoneToken;
            return;
        }
        token = SerializeUtil.bytesToToken(SessionUtils.getSessionUser(request).getAuthToken());
    }

    public static User getLoginUser() {

        return user;
    }

    public static Token getLoginToken() {

        return token;
    }

    private String[] getAjaxIds(final String str, final String separator) {

        String[] ids = null;
        if (str != null) {
            String[] strs = str.split(separator);
            ids = new String[strs.length];
            for (int i = 0, length = strs.length; i < length; i++) {
                ids[i] = String.valueOf(strs[i]);
            }
        }
        return ids;
    }

    protected List<String> getAjaxIds(final String ids) {

        return StringUtils.isBlank(ids) ? new ArrayList<String>(0) : Arrays.asList(getAjaxIds(ids, ","));
    }

    /**
     * 获取IP地址
     * 
     * @param request
     * @return
     */
    protected String getIpAddr(HttpServletRequest request) {

        String ip = request.getHeader("X-Real-IP");
        if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            return ip;
        }
        ip = request.getHeader("X-Forwarded-For");
        if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个IP值，第一个为真实IP。
            int index = ip.indexOf(',');
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        } else {
            return request.getRemoteAddr();
        }
    }
    
    /**
     * 获取IP地址
     * 
     * @param request
     * @return
     */
    protected String getAppCode(HttpServletRequest request) {

        String appCode = request.getContextPath();
        if (!StringUtils.isBlank(appCode) && !"unknown".equalsIgnoreCase(appCode)) {
            // 多次反向代理后会有多个IP值，第一个为真实IP。
            int index = appCode.indexOf('/');
            if (index != -1) {
                return appCode.substring(index + 1, appCode.length());
            } else {
                return appCode;
            }
        } else {
            return appCode;
        }
    }
}