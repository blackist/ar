package com.xzit.ar.portal.service.image.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.album.AlbumImageMapper;
import com.xzit.ar.common.mapper.album.AlbumMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.album.Album;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.image.AlbumService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    @Resource
    private AlbumImageMapper albumImageMapper;

    /**
     * TODO 根据Id查询相册信息
     *
     * @param albumId
     * @return album对象
     * @throws ServiceException
     */
    @Override
    public Album getAlbumById(Integer albumId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(albumId)) {
                return albumMapper.getById(albumId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载相册信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 加载组织的相册列表
     *
     * @param page     分页类
     * @param originId originId
     * @return 相册列表
     * @throws ServiceException
     */
    @Override
    public List<Album> getAlbums(Page<Album> page, Integer originId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(originId))
                // 查询相册列表
                return albumMapper.getAlbums(page, originId);
        } catch (Exception e) {
            throw new ServiceException("加载相册失败");
        }
        return null;
    }

    /**
     * TODO 保存创建的相册
     *
     * @param album
     * @return 相册的id
     * @throws ServiceException
     */
    @Override
    public Integer saveAlbum(Album album) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(album.getUserId()) && CommonUtil.isNotEmpty(album.getOriginId())) {
                albumMapper.save(album);
                return album.getAlbumId();
            }
        } catch (Exception e) {
            throw new ServiceException("创建相册时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 编辑相册
     *
     * @param album
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer updateAlbum(Album album) throws ServiceException {
        try {
            // 关键参数校验
            if (CommonUtil.isNotEmpty(album.getAlbumId())) {
                return albumMapper.update(album);
            }
        } catch (Exception e) {
            throw new ServiceException("更新相册信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 删除相册
     *
     * @param albumId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deleteAlbum(Integer albumId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(albumId)) {
                // 删除与相册相关的图片
                albumImageMapper.deleteAlbum(albumId);
                // 删除相册
                return albumMapper.delete(albumId);
            }

        } catch (Exception e) {
            throw new ServiceException("删除相册时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 加载相册图片
     *
     * @param albumId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getAlbumImage(Page<Map<String, Object>> page, Integer albumId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(albumId)) {
                return albumImageMapper.getAlbumImage(page, albumId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载相册图片时发生异常！");
        }
        return null;
    }
}
