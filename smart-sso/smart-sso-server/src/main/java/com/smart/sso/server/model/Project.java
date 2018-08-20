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

public class Project extends PersistentObject {

    private static final long serialVersionUID = 1895198493347056461L;
    private final Logger      logger           = LoggerFactory.getLogger(getClass());
    /** 项目名 */
    private String            name;
    /** 项目描述信息 */
    private String            description;
    /** 项目是否有效 */
    private Boolean           enabled          = Boolean.valueOf(true);
    /** 项目所属域ID */
    private String            domain_id;
    /** 父项目ID */
    private String            parent_id;
    /** 是否是域 */
    private Boolean           is_domain        = Boolean.valueOf(true);
    /** 项目排序 */
    private Integer           sort             = Integer.valueOf(0);
    /** 项目代码 */
    private String            code;
    /** 创建时间 */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date              createTime;
    /** 用户附加属性 */
    private byte[]            extra;

    public String getName() {

        return name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public String getDescription() {

        return description;
    }

    public void setDescription(String description) {

        this.description = description;
    }

    public Boolean getEnabled() {

        return enabled;
    }

    public void setEnabled(Boolean enabled) {

        this.enabled = enabled;
    }

    public String getDomain_id() {

        return domain_id;
    }

    public void setDomain_id(String domain_id) {

        this.domain_id = domain_id;
    }

    public String getParent_id() {

        return parent_id;
    }

    public void setParent_id(String parent_id) {

        this.parent_id = parent_id;
    }

    public Boolean getIs_domain() {

        return is_domain;
    }

    public void setIs_domain(Boolean is_domain) {

        this.is_domain = is_domain;
    }

    public Integer getSort() {

        if(sort != 0) {
            return sort;
        }
        if (StringUtils.isBlank((String) serialExtra().get("sort"))) {
            sort = 0;
        } else {
            sort = Integer.valueOf((String) serialExtra().get("sort"));
        }
        return sort;
    }

    public void setSort(Integer sort) {

        this.sort = sort;
    }

    public String getCode() {

        if(StringUtils.isBlank(code)) {
            if (StringUtils.isBlank((String) serialExtra().get("code"))) {
                code = null;
            } else {
                code = (String) serialExtra().get("code");
            }
        }
        return code;
    }

    public void setCode(String code) {

        this.code = code;
    }

    public Date getCreateTime() {
        if(createTime == null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                if (StringUtils.isBlank((String) serialExtra().get("createTime"))) {
                    createTime = null;
                } else {
                    createTime = sdf.parse((String) serialExtra().get("createTime"));
                }
            } catch (ParseException e) {
                logger.error(e.getMessage(), e);
            }
        }
        return createTime;
    }

    public void setCreateTime(Date createTime) {

        this.createTime = createTime;
    }

    public byte[] getExtra() {

        return extra;
    }

    public void setExtra(byte[] extra) {

        this.extra = extra;
    }

    public String getIsDomainStr() {

        return (is_domain != null && is_domain) ? TrueFalseEnum.TRUE.getLabel() : TrueFalseEnum.FALSE.getLabel();
    }

    public String getIsEnableStr() {

        return (enabled != null && enabled) ? TrueFalseEnum.TRUE.getLabel() : TrueFalseEnum.FALSE.getLabel();
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
        map.put("code", getCode());
        map.put("sort", String.valueOf(getSort()));
        map.put("createTime", getCreateTime() == null ? null : sdf.format(getCreateTime()));
        JsonUtils.parseJson(map);
        try {
            setExtra(JsonUtils.parseJson(map).getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            logger.error(e.getMessage(), e);
        }
    }
}