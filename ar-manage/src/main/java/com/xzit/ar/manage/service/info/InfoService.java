package com.xzit.ar.manage.service.info;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;

import java.util.List;
import java.util.Map;

/**
 * 描述
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/17 17:23.
 */
public interface InfoService {

    /**
     * 根据条件查询信息
     * @param page
     * @return
     */
    List<Map<String, Object>> queryInfo(Page<Map<String, Object>> page) throws ServiceException;

    /**
     * 保存发布的信息到数据库
     * @param information
     * @return
     */
    Integer saveInfo(Information information) throws ServiceException;

    /**
     * 更新信息的属性
      * @param information
     * @return
     */
    Integer updateInfo(Information information) throws ServiceException;

    /**
     * 删除信息
     * @param infoId
     * @return
     */
    Integer deleteInfo(Integer infoId) throws ServiceException;
}
