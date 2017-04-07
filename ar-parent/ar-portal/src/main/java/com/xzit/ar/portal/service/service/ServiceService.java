package com.xzit.ar.portal.service.service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.info.Information;

import javax.sql.rowset.serial.SerialException;
import java.util.List;
import java.util.Map;

/**
 * TODO 校园服务业务
 * Created by 董亮亮 on 2017/4/7.
 */
public interface ServiceService {

    /**
     * TODO 获取校园服务信息列表
     * @return
     */
    public List<Map<String, Object>> getSchoolService(String infoType, Integer schoolId) throws ServiceException;
}
