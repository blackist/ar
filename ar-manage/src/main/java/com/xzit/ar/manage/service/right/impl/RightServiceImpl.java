/**
 * @Title: RightServiceImpl.java <br>
 * @Package com.xzit.ar.manage.service.right.impl <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月2日 下午10:50:51 <br>
 * @version V1.0 <br>
 */
package com.xzit.ar.manage.service.right.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.role.RightMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;
import com.xzit.ar.common.util.privilege.PrivilegeUtil;
import com.xzit.ar.manage.service.right.RightService;

/**
 * @author Mr.Black <br>
 * @version V1.0 <br>
 * @ClassName: RightServiceImpl <br>
 * @Description: TODO <br>
 * @date 2016年1月2日 下午10:50:51 <br>
 */
@Service("rightService")
public class RightServiceImpl implements RightService {

    @Resource
    private RightMapper rightMapper;

    @Override
    public int saveRight(Right right) throws ServiceException {
        int row = 0;
        try {
            // 为要存储的权限设置权限位、权限码
            Integer rightPos = null;
            Long rightCode = null;
            // 获取数据库当前最高
            Map<String, Object> topPosCode = rightMapper.selectTopPosCode();
            Integer topPos = null;
            Long topCode = null;
            // 判断是否已获取权限位、权限码
            if (topPosCode != null) {
                topPos = (Integer) topPosCode.get("topPos");
                topCode = (Long) topPosCode.get("topCode");
            }
            // 为要存储的权限计算权限位、权限码
            if (topPos == null) {
                rightPos = 0;
                rightCode = 1L;
            } else {
                // 权限码是否达到最大值
                if (topCode >= (1L << 60)) {
                    rightPos = topPos + 1;
                    rightCode = 1L;
                } else {
                    rightPos = topPos;
                    rightCode = topCode << 1;
                }
            }
            System.out.println(rightPos + " " + rightCode);
            // 设置权限位、权限码
            right.setRightPos(rightPos);
            right.setRightCode(rightCode);

            // 存储权限
            row = rightMapper.save(right);
            // 刷新权限列表
            PrivilegeUtil.refreshAllRights();
        } catch (Exception e) {
            throw new ServiceException("操作异常");
        }
        return row;
    }

    @Override
    public Right selectByRightUrl(String rightUrl) throws ServiceException {
        Right right = null;
        try {
            right = rightMapper.selectByRightUrl(rightUrl);
            if (right != null) {
                System.out.println("权限 URL : " + rightUrl + " 已存在！");
            }
        } catch (Exception e) {
            throw new ServiceException("系统异常！");
        }
        return right;
    }

    @Override
    public List<Map<String, Object>> queryRights(Page<Right> page, String queryInput) throws ServiceException {
        List<Map<String, Object>> rightList = null;
        try {
            // 对关键参数的校验
            if (queryInput == null) {
                queryInput = "";
            }
            queryInput = "%" + queryInput + "%";
            // 查询
            rightList = rightMapper.queryRights(page, queryInput);
        } catch (Exception e) {
            throw new ServiceException("系统异常");
        }

        return rightList;
    }

    @Override
    public Right selectById(Integer rightId) throws ServiceException {
        try {
            return rightMapper.selectById(rightId);
        } catch (Exception e) {
            throw new ServiceException("系统错误");
        }
    }

    @Override
    public int updateRight(Right right) throws ServiceException {
        int row;
        try {
            row = rightMapper.update(right);
            // 刷新权限列表
            PrivilegeUtil.refreshAllRights();
        } catch (Exception e) {
            throw new ServiceException("系统错误，更改失败");
        }
        return row;
    }

    @Override
    public List<Right> getIsNotPublicRights() throws ServiceException {
        try {
            return rightMapper.getIsNotPublicRights();
        } catch (Exception e) {
            throw new ServiceException("记载权限时发生错误");
        }
    }

}
