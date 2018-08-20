package com.smart.sso.server.model;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.smart.mvc.model.PersistentObject;
import com.smart.mvc.util.StringUtils;
import com.smart.sso.server.enums.TrueFalseEnum;
import com.smart.sso.server.util.JsonUtils;

/**
 * 角色
 * 
 * @author Joe
 */
public class Role extends PersistentObject {

    private static final long serialVersionUID = 564115576254799088L;
    private final Logger      logger           = LoggerFactory.getLogger(getClass());
    /** 名称 */
    private String            name;
    /** 排序 */
    private Integer           sort             = Integer.valueOf(1);
    /** 描述 */
    private String            description;
    /** 是否启用 */
    private Boolean           isEnable         = Boolean.valueOf(true);
    /** 以下为显示辅助参数 */
    private Boolean           isChecked        = Boolean.valueOf(false);
    /** 角色附加属性 */
    private byte[]            extra;

    public String getName() {

        return this.name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public Integer getSort() {

        if(sort != 0) {
            return this.sort;
        }
        if (StringUtils.isBlank((String) serialExtra().get("sort"))) {
            this.sort = 0;
        } else {
            this.sort = Integer.parseInt((String) serialExtra().get("sort"));
        }
        return this.sort;
    }

    public void setSort(Integer sort) {

        this.sort = sort;
    }

    public String getDescription() {

        if(StringUtils.isBlank(description)) {
            if (StringUtils.isBlank((String) serialExtra().get("description"))) {
                this.description = null;
            } else {
                this.description = (String) serialExtra().get("description");
            }
        }
        return this.description;
    }

    public void setDescription(String description) {

        this.description = description;
    }

    public Boolean getIsEnable() {

        if(StringUtils.isBlank(description)) {
            if (StringUtils.isBlank((String) serialExtra().get("isEnable"))) {
                this.isEnable = false;
            } else {
                this.isEnable = Boolean.valueOf((String) serialExtra().get("isEnable"));
            }
        }
        return this.isEnable;
    }

    public void setIsEnable(Boolean isEnable) {

        this.isEnable = isEnable;
    }

    public Boolean getIsChecked() {

        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {

        this.isChecked = isChecked;
    }

    public String getIsEnableStr() {

        return (isEnable != null && isEnable) ? TrueFalseEnum.TRUE.getLabel() : TrueFalseEnum.FALSE.getLabel();
    }

    public byte[] getExtra() {

        return extra;
    }

    public void setExtra(byte[] extra) {

        this.extra = extra;
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

        Map<String, Object> map = serialExtra();
        map.put("sort", String.valueOf(getSort()));
        map.put("description", getDescription());
        map.put("isEnable", String.valueOf(getIsEnable()));
        JsonUtils.parseJson(map);
        try {
            setExtra(JsonUtils.parseJson(map).getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            logger.error(e.getMessage(), e);
        }
    }
}
