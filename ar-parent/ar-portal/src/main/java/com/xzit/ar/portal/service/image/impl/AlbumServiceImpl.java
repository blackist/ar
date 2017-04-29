package com.xzit.ar.portal.service.image.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.album.AlbumMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.album.Album;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.image.AlbumService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/29 11:03.
 */
@Service("albumService")
public class AlbumServiceImpl implements AlbumService {

    @Resource
    private AlbumMapper albumMapper;

    /**
     * TODO 加载组织的相册列表
     * @param page     分页类
     * @param originId originId
     * @return 相册列表
     * @throws ServiceException
     */
    @Override
    public List<Album> getAlbums(Page<Album> page, Integer originId) throws ServiceException {
//        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(originId))
                // 查询相册列表
                return albumMapper.getAlbums(page, originId);
//        } catch (Exception e) {
//            throw new ServiceException("加载相册失败");
//        }
        return null;
    }
}
