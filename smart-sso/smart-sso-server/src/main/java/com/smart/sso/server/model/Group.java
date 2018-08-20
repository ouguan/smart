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

public class Group extends PersistentObject {

    private static final long serialVersionUID = 1106412511325860697L;
    private final Logger      logger           = LoggerFactory.getLogger(getClass());
    /** 组名 */
    private String            name;
    /** 组描述信息 */
    private String            description;
    /** 组是否有效 */
    private Boolean           isEnable         = Boolean.valueOf(true);
    /** 组所属域ID */
    private String            domain_id;
    /** 创建时间 */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date              createTime;
    /** 组附加属性 */
    private byte[]            extra;
    /** 以下为显示辅助参数 */
    private Boolean           isChecked        = Boolean.valueOf(false);

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

    public Boolean getIsEnable() {

        if (StringUtils.isBlank((String) serialExtra().get("isEnable"))) {
            isEnable = false;
        } else {
            isEnable = true;
        }
        return isEnable;
    }

    public void setIsEnable(Boolean isEnable) {

        this.isEnable = isEnable;
    }

    public String getDomain_id() {

        return domain_id;
    }

    public void setDomain_id(String domain_id) {

        this.domain_id = domain_id;
    }

    public Date getCreateTime() {

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

    public Boolean getIsChecked() {

        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {

        this.isChecked = isChecked;
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
        map.put("createTime", this.createTime == null ? null : sdf.format(this.createTime));
        map.put("isEnable", String.valueOf(this.isEnable));
        JsonUtils.parseJson(map);
        try {
            setExtra(JsonUtils.parseJson(map).getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            logger.error(e.getMessage(), e);
        }
    }
}