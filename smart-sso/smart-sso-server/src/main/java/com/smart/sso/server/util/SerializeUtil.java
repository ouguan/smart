package com.smart.sso.server.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import org.openstack4j.model.identity.v3.Token;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @desc: 对象序列化与反序列化
 * @author: wsy
 * @createTime: 2018年2月9日 上午9:38:43
 * @history:
 * @version: v1.0
 * @since JDK 1.8
 */
public final class SerializeUtil {

    private final static Logger logger = LoggerFactory.getLogger(SerializeUtil.class);

    /**
     * 
     * @author: cao
     * @createTime: 2018年2月6日 上午11:27:00
     * @descript: 反序列化：byte[]转换成Token对象，IO异常暂时吃掉了，没处理
     * @param tokenBytes
     * @return Token
     */
    public static Token bytesToToken(byte[] tokenBytes) {

        Token userToken = null;
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(tokenBytes);
            ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
            userToken = (Token) objectInputStream.readObject();
        } catch (ClassNotFoundException e) {
            logger.error(e.getMessage(), e);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return userToken;
    }
    
    public static String bytesToString(byte[] tokenBytes) {

        String str = null;
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(tokenBytes);
            ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
            str = (String) objectInputStream.readObject();
        } catch (ClassNotFoundException e) {
            logger.error(e.getMessage(), e);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return str;
    }

    /**
     * 
     * @author: cao
     * @createTime: 2018年2月6日 上午11:50:27
     * @descript: 将Token序列化为byte[]
     * @param userToken
     * @return byte[]
     */
    public static byte[] tokenToBytes(Token userToken) {

        byte[] tokenBytes = null;
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(byteArrayOutputStream);
            out.writeObject(userToken);
            tokenBytes = byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        logger.info("Token口令字节数：" + tokenBytes.length);
        return tokenBytes;
    }

    //序列化一个对象（可以存储到一个文件也可以存储到字节数组）这里存储到自己数组
    public static byte[] serialByte(Object obj) {

        if (obj == null) {
            return null;
        }
        long start = System.currentTimeMillis();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos;
        try {
            oos = new ObjectOutputStream(baos);
            oos.writeObject(obj);
            oos.close();
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
        long end = System.currentTimeMillis();
        logger.debug("usetime is" + (end - start));
        return baos.toByteArray();
    }

    @SuppressWarnings("unchecked")
    public static <T> Object deserializeObjectInputStream(byte[] bytes, Class<T> clazz) {

        if (bytes == null) {
            return null;
        }
        long start = System.currentTimeMillis();
        ObjectInputStream os;
        T ret = null;
        try {
            os = new ObjectInputStream(new ByteArrayInputStream(bytes));
            ret = (T) os.readObject();
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        } catch (ClassNotFoundException e) {
            logger.error(e.getMessage(), e);
        }
        long end = System.currentTimeMillis();
        logger.debug("usetime is" + (end - start));
        return ret;
    }
}