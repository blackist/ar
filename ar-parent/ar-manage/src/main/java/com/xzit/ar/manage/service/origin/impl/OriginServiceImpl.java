package com.xzit.ar.manage.service.origin.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.manage.service.origin.OriginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/18 22:34.
 */
@Service("originService")
public class OriginServiceImpl implements OriginService {

    @Resource
    private OriginMapper originMapper;

    /**
     * TODO 条件查询组织
     *
     * @param page
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> queryOrigin(Page<Map<String, Object>> page) throws ServiceException {
        try {
            return originMapper.queryOrigin(page);
        } catch (Exception e) {
            throw new ServiceException("查询组织信息时发生异常！");
        }
    }
}
