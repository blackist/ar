package com.xzit.ar.manage.service.info.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.info.InfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/17 17:23.
 */
@Service("infoService")
public class InfoServiceImpl implements InfoService {

    @Resource
    private InformationMapper informationMapper;

    /**
     * TODO 根据条件查询信息
     *
     * @param page
     * @param query
     * @param state
     * @param infoType
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> queryInfo(
            Page<Map<String, Object>> page, String query, String state, String infoType)
            throws ServiceException {

        //
        Map<String, Object> information = new HashMap<>();
        if (CommonUtil.isNotEmpty(query)) {
            information.put("query", "%" + query + "%");
        }
        information.put("state", null);
        information.put("infoType", null);
        page.setQueryMap(information);

        return informationMapper.queryInfoByVo(page);
    }
}
