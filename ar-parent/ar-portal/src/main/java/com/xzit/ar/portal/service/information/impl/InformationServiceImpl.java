package com.xzit.ar.portal.service.information.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.information.InformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * TODO ${TODO}
 * Created by 董亮亮 on 2017/4/7.
 */
@Service("informationService")
public class InformationServiceImpl implements InformationService {

    @Resource
    private InformationMapper informationMapper;

    /**
     * TODO 根据information id 加载信息
     * @param infoId
     * @return
     * @throws ServiceException
     */
    @Override
    public Information getInfoById(Integer infoId) throws ServiceException {
        Information information = null;
        try {
            if (CommonUtil.isNotEmpty(infoId)){
                information = informationMapper.getById(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载信息时发生异常！");
        }
        return information;
    }
}
