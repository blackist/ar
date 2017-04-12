package com.xzit.ar.common.util.forum;

import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.mapper.dict.DictionaryDataMapper;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/12 21:35.
 */
public class ForumUtil {

    /**
     * TODO Forum初始化
     * @throws UtilException
     */
    public static void initForum() throws UtilException {
        loadPostTheme();
    }

    /**
     * TODO 加载帖子主题
     * @throws UtilException
     */
    public static void loadPostTheme() throws UtilException {
        System.out.println("-------------------- 加载帖子主题 --------------------");
        try {
            DictionaryDataMapper dataMapper = ARContext.applicationContext.getBean(DictionaryDataMapper.class);
            ARContext.postTheme = dataMapper.loadDictData("t");
        } catch (Exception e) {
            throw new UtilException("系统初始化异常！");
        }
    }
}
