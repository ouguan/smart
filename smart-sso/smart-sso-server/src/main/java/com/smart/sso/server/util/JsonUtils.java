package com.smart.sso.server.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.springframework.util.StringUtils;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.TypeReference;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @desc: JSON封装工具类
 * @author: wsy
 * @createTime: 2018年2月6日 上午11:17:36
 * @history:
 * @version: v1.0
 * @since JDK 1.8
 */
public class JsonUtils {

    private static final ObjectMapper mapper = new ObjectMapper();

    /**
     * 将对象转化为json
     * 
     * @author wsy
     * @time 2018年2月6日 下午2:55:10
     * @param obj
     *            待转化的对象
     * @return 当转化发生异常时返回null
     */
    public static String parseJson(Object obj) {

        if (obj == null) {
            return null;
        }
        try {
            return mapper.writeValueAsString(obj);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json转化为map
     * 
     * @author wsy
     * @time 2018年2月6日 下午2:55:10
     * @param obj
     *            待转化的对象
     * @return 当转化发生异常时返回null
     */
    public static Map<String, Object> parseObject(String json) {

        if (StringUtils.hasLength(json) == false) {
            return null;
        }
        Map<String, Object> ret = null;
        try {
            ret = JSONArray.parseObject(json, new TypeReference<Map<String, Object>>() {
            });
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return ret;
    }

    /**
     * 将json转化为map列表
     * 
     * @author wsy
     * @time 2018年2月6日 下午2:55:10
     * @param obj
     *            待转化的对象
     * @return 当转化发生异常时返回null
     */
    @SuppressWarnings("rawtypes")
    public static List<Map> parseObjectArray(String json) {

        if (StringUtils.hasLength(json) == false) {
            return null;
        }
        List<Map> ret = null;
        try {
            ret = JSONArray.parseArray(json, Map.class);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return ret;
    }

    /**
     * 将json转化为对象
     * 
     * @author wsy
     * @time 2018年2月6日 下午2:55:10
     * @param obj
     *            待转化的对象
     * @return 当转化发生异常时返回null
     */
    public static <T> T parseObject(String json, Class<T> clazz) {

        if (StringUtils.hasLength(json) == false) {
            return null;
        }
        try {
            return mapper.readValue(json, clazz);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json对象转化为集合类型
     * 
     * @author wsy
     * @time 2018年2月6日 下午2:55:10
     * @param json
     *            json对象
     * @param collectionClazz
     *            具体的集合类的class，如：ArrayList.class
     * @param clazz
     *            集合内存放的对象的class
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static <T> Collection<T> parseCollection(String json, Class<? extends Collection> collectionClazz, Class<T> clazz) {

        if (StringUtils.hasLength(json) == false) {
            return null;
        }
        try {
            Collection<T> collection = mapper.readValue(json, getCollectionType(collectionClazz, clazz));
            return collection;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static JavaType getCollectionType(Class<?> collectionClass, Class<?> ... elementClasses) {

        return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
    }

    /**
     * @Title: combineSydwCore
     * @Description: 该方法是用于相同对象不同属性值的合并，如果两个相同对象中同一属性都有值，那么sourceBean中的值会覆盖tagetBean重点的值
     * @author: WangLongFei
     * @date: 2017年12月26日 下午1:53:19
     * @param sourceBean
     *            被提取的对象bean
     * @param targetBean
     *            用于合并的对象bean
     * @return targetBean 合并后的对象
     * @return: Object
     */
    public static Object mergeBean(Object sourceBean, Object targetBean) {

        Class<? extends Object> sourceBeanClass = sourceBean.getClass();
        Class<? extends Object> targetBeanClass = targetBean.getClass();
        Field[] sourceFields = sourceBeanClass.getDeclaredFields();
        Field[] targetFields = targetBeanClass.getDeclaredFields();
        for (int i = 0; i < sourceFields.length; i++) {
            Field sourceField = sourceFields[i];
            sourceField.setAccessible(true);
            if (Modifier.isStatic(sourceField.getModifiers())) {
                continue;
            }
            try {
                if (!(sourceField.get(sourceBean) == null) && !"serialVersionUID".equals(sourceField.getName().toString())) {
                    Field targetField = isPropExist(sourceField, targetFields);
                    if(targetField==null) {
                        
                    }
                    targetField.setAccessible(true);
                    targetField.set(targetBean, sourceField.get(sourceBean));
                }
            } catch (IllegalArgumentException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return targetBean;
    }

    public static <T> Object merge(T target, T destination) throws Exception {

        BeanInfo beanInfo = Introspector.getBeanInfo(destination.getClass());
        // Iterate over all the attributes
        for (PropertyDescriptor descriptor : beanInfo.getPropertyDescriptors()) {
            // Only copy writable attributes
            if (descriptor.getReadMethod() != null) {
                Object originalValue = descriptor.getReadMethod().invoke(target);
                // Only copy values values where the destination values is null
                if (originalValue == null) {
                    Object defaultValue = descriptor.getReadMethod().invoke(destination);
                    descriptor.getWriteMethod().invoke(target, defaultValue);
                }
            }
        }
        return beanInfo;
    }

    public static Field isPropExist(Field field, Field[] fields) {

        Field ret = null;
        for (int i = 0; i < fields.length; i++) {
            if (fields[i].getName().toString().equals(field.getName().toString())) {
                ret = fields[i];
                break;
            }
        }
        return ret;
    }
}