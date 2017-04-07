package com.xzit.ar.portal.service.information;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.info.Information;

/**
 * TODO 信息相关业务
 * Created by 董亮亮 on 2017/4/7.
 */
public interface InformationService {

    /**
     * TODO 根据information id 加载信息
     * @param infoId
     * @return
     * @throws ServiceException
     */
    public Information getInfoById(Integer infoId) throws ServiceException;
}
