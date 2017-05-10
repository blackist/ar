package com.xzit.ar.portal.service.image;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.image.Image;

import java.util.List;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/29 11:01.
 */
public interface ImageService {

    /**
     * TODO 查询图片信息
     * @param imageId
     * @return
     * @throws ServiceException
     */
    Image getImageById(Integer imageId) throws ServiceException;

    /**
     * TODO 存储图片信息到数据库
     * @param image
     * @return
     * @throws ServiceException
     */
    Integer saveImage(Image image) throws ServiceException;

    /**
     * TODO 根据id删除图片信息
     * @param imageId
     * @return
     * @throws ServiceException
     */
    Integer deleteImageById(Integer imageId) throws ServiceException;

    /**
     * TODO 上传图片到相册
     * @param image 图片列表
     * @param albumId albumId
     * @return 上传图片的个数
     * @throws ServiceException
     */
    Integer saveAlbumImage(Image image, Integer albumId) throws ServiceException;
}
