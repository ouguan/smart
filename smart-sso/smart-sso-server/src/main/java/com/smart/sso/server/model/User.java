package com.smart.sso.server.model;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.annotation.JSONField;
import com.smart.mvc.model.PersistentObject;
import com.smart.mvc.util.StringUtils;
import com.smart.sso.server.enums.TrueFalseEnum;
import com.smart.sso.server.util.JsonUtils;

/**
 * 用户
 * 
 * @author Joe
 */
public class User extends PersistentObject {

    private static final long serialVersionUID  = 1106412532325860697L;
    private final Logger      logger            = LoggerFactory.getLogger(getClass());
    /** 用户名 */
    private String            account;
    /** 用户名 */
    private String            password;
    /** 用户邮箱信息 */
    private String            email;
    /** 用户描述信息 */
    private String            description;
    /** 用户是否有效 */
    private Boolean           isEnable          = Boolean.valueOf(true);
    /** 用户默认工程ID */
    private String            default_project_id;
    /** 用户所属域ID */
    private String            domain_id;
    /** 用户认证失败次数 */
    private Integer           failed_auth_count = Integer.valueOf(0);
    /** 最后登录IP */
    private String            lastLoginIp;
    /** 登录总次数 */
    private Integer           loginCount        = Integer.valueOf(0);
    /** 最后登录时间 */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date              lastLoginTime;
    /** 创建时间 */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date              createTime;
    /** 最后活跃时间 */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date              last_active_at;
    /** 登录失败时间 */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date              failed_auth_at;
    /** 用户附加属性 */
    private byte[]            extra;
    /** 以下为显示辅助参数 */
    private Boolean           isChecked        = Boolean.valueOf(false);

    public String getEmail() {
        
        if(StringUtils.isBlank(email)) {
            if (StringUtils.isBlank((String) serialExtra().get("email"))) {
                email = null;
            } else {
                email = (String) serialExtra().get("email");
            }
        }
        return email;
    }

    public void setEmail(String email) {
        
        this.email = email;
    }
    
    public String getDescription() {
    
        if(StringUtils.isBlank(description)) {
            if (StringUtils.isBlank((String) serialExtra().get("description"))) {
                description = null;
            } else {
                description = (String) serialExtra().get("description");
            }
        }
        return description;
    }

    public void setDescription(String description) {
    
        this.description = description;
    }

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {

        this.password = password;
    }

    public String getLastLoginIp() {

        if(StringUtils.isBlank(lastLoginIp)) {
            lastLoginIp = (String) serialExtra().get("lastLoginIp");
        }
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {

        this.lastLoginIp = lastLoginIp;
    }

    public Integer getLoginCount() {

        if(loginCount == 0) {
            if (StringUtils.isBlank((String) serialExtra().get("loginCount"))) {
                loginCount = 0;
            } else {
                loginCount = Integer.valueOf((String) serialExtra().get("loginCount"));
            }
        }
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {

        this.loginCount = loginCount;
    }

    public Date getLastLoginTime() {

        if(lastLoginTime == null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                if (StringUtils.isBlank((String) serialExtra().get("lastLoginTime"))) {
                    lastLoginTime = null;
                } else {
                    lastLoginTime = sdf.parse((String) serialExtra().get("lastLoginTime"));
                }
            } catch (ParseException e) {
                logger.error(e.getMessage(), e);
            }
        }
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {

        this.lastLoginTime = lastLoginTime;
    }

    public Date getCreateTime() {

        return createTime;
    }

    public void setCreateTime(Date createTime) {

        this.createTime = createTime;
    }

    public Date getLast_active_at() {

        return last_active_at;
    }

    public void setLast_active_at(Date last_active_at) {

        this.last_active_at = last_active_at;
    }

    public String getAccount() {

        return account;
    }

    public void setAccount(String account) {

        this.account = account;
    }

    public Boolean getIsEnable() {

        return isEnable;
    }

    public void setIsEnable(Boolean isEnable) {

        this.isEnable = isEnable;
    }

    public String getDefault_project_id() {

        return default_project_id;
    }

    public void setDefault_project_id(String default_project_id) {

        this.default_project_id = default_project_id;
    }

    public String getDomain_id() {

        return domain_id;
    }

    public void setDomain_id(String domain_id) {

        this.domain_id = domain_id;
    }

    public Integer getFailed_auth_count() {

        return failed_auth_count;
    }

    public void setFailed_auth_count(Integer failed_auth_count) {

        this.failed_auth_count = failed_auth_count;
    }

    public Date getFailed_auth_at() {

        return failed_auth_at;
    }

    public void setFailed_auth_at(Date failed_auth_at) {

        this.failed_auth_at = failed_auth_at;
    }

    public Boolean getIsChecked() {

        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {

        this.isChecked = isChecked;
    }

    public byte[] getExtra() {

        return extra;
    }

    public void setExtra(byte[] extra) {

        this.extra = extra;
    }

    public String getIsEnableStr() {

        return (isEnable != null && isEnable) ? TrueFalseEnum.TRUE.getLabel() : TrueFalseEnum.FALSE.getLabel();
    }

    public Map<String, Object> serialExtra() {

        Map<String, Object> map = new HashMap<String, Object>();
        if (this.extra != null && map.isEmpty()) {
            try {
                String res = new String(this.extra, "utf-8");
                map = JsonUtils.parseObject(res);
            } catch (UnsupportedEncodingException e) {
                logger.error(e.getMessage(), e);
            }
        }
        return map;
    }

    public void updateExtra() {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map<String, Object> map = serialExtra();
        map.put("lastLoginIp", getLastLoginIp());
        map.put("loginCount", String.valueOf(getLoginCount()));
        map.put("lastLoginTime", getLastLoginTime() ==null?null:sdf.format(getLastLoginTime()));
        map.put("email", getEmail());
        map.put("description", getDescription());
        JsonUtils.parseJson(map);
        try {
            setExtra(JsonUtils.parseJson(map).getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            logger.error(e.getMessage(), e);
        }
    }
}
