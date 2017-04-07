package com.xzit.ar.portal.service.service.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.service.ServiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.sql.rowset.serial.SerialException;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * Created by 董亮亮 on 2017/4/7.
 */
@Service("serviceService")
public class ServiceServiceImpl implements ServiceService {

    @Resource
    private InformationMapper informationMapper;

    /**
     * TODO 获取校园服务信息列表
     * @return
     */
    @Override
    public List<Map<String, Object>> getSchoolService(String infoType, Integer schoolId) throws ServiceException {
        List<Map<String, Object>> services = null;
        try {
            if(CommonUtil.isNotEmpty(schoolId)){
                services = informationMapper.loadOriginInfos(infoType, schoolId, 10);
            }
        } catch (Exception e) {
            throw new ServiceException("查询校园服务信息时发生异常！");
        }
        return services;
    }
}
