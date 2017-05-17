package com.xzit.ar.common.util.info;

import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.mapper.dict.DictionaryDataMapper;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/12 21:35.
 */
public class InfoUtil {

    /**
     * TODO Info初始化
     * @throws UtilException
     */
    public static void initForum() throws UtilException {
        loadInfoTheme();
        loadInfoType();
    }

    /**
     * TODO 加载帖子主题
     * @throws UtilException
     */
    public static void loadInfoTheme() throws UtilException {
        System.out.println("-------------------- 加载帖子主题 --------------------");
        try {
            DictionaryDataMapper dataMapper = ARContext.applicationContext.getBean(DictionaryDataMapper.class);
            ARContext.infoTheme = dataMapper.loadDictData("t");
        } catch (Exception e) {
            throw new UtilException("系统初始化异常！");
        }
    }

    /**
     * TODO 加载信息类型
     * @throws UtilException
     */
        public static void loadInfoType() throws UtilException{
        System.out.println("-------------------- 加载信息分类 --------------------");
        DictionaryDataMapper dataMapper = ARContext.applicationContext.getBean(DictionaryDataMapper.class);
        try {
            ARContext.infoType = dataMapper.loadDictData("in");
        } catch (Exception e) {
            throw new UtilException("系统初始化异常！");
        }
    }
}
