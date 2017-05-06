package com.xzit.ar.portal.service.image;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.album.Album;

import java.util.List;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/29 11:01.
 */
public interface AlbumService {

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
}
