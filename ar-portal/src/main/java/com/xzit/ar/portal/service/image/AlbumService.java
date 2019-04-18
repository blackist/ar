package com.xzit.ar.portal.service.image;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.album.Album;

import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/29 11:01.
 */
public interface AlbumService {


    /**
     * TODO 根据Id查询相册信息
     * @param albumId
     * @return album对象
     * @throws ServiceException
     */
    Album getAlbumById(Integer albumId) throws ServiceException;

    /**
     * TODO 加载组织的相册列表
     * @param page 分页类
     * @param originId originId
     * @return 相册列表
     * @throws ServiceException
     */
    List<Album> getAlbums(Page<Album> page, Integer originId) throws ServiceException;

    /**
     * TODO 保存创建的相册
     * @param album
     * @return
     * @throws ServiceException
     */
    Integer saveAlbum(Album album) throws ServiceException;

    /**
     * TODO 编辑相册
     * @param album
     * @return
     * @throws ServiceException
     */
    Integer updateAlbum(Album album) throws ServiceException;


    /**
     * TODO 删除相册
     * @param albumId
     * @return
     * @throws ServiceException
     */
    Integer deleteAlbum(Integer albumId) throws ServiceException;

    /**
     * TODO 加载相册图片
     * @param albumId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getAlbumImage(Page<Map<String, Object>> page, Integer albumId) throws ServiceException;

}
