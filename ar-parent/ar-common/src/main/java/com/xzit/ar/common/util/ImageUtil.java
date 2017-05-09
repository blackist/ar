/**
 * @Title: ImageUtil.java <br>
 * @Package com.xzit.ar.common.util <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月10日 下午8:15:28 <br>
 * @version V1.0 <br>
 */
package com.xzit.ar.common.util;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;

import com.xzit.ar.common.constant.PathConstant;
import com.xzit.ar.common.exception.ExceptionCode;
import com.xzit.ar.common.exception.UtilException;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.Thumbnails.Builder;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Mr.Black <br>
 * @version V1.0  <br> <br>
 * @ClassName: ImageUtil <br>
 * @Description: TODO <br>
 * @date 2015年12月10日 下午8:15:28 <br>
 */
public final class ImageUtil {

    /**
     * @param @param  source
     * @param @param  dist
     * @param @param  height
     * @param @throws UtilException <br>
     * @return void <br>
     * @throws <br>
     * @Title: pictureZoom <br>
     * @Description: TODO 缩放图片<br>
     * @author Mr.Black <br>
     * @date 2015年12月10日 下午8:16:10 <br>
     */
    public static void pictureZoom(String source, String dist, int height) throws UtilException {
        try {
            Builder<BufferedImage> file = Thumbnails.of(cutByShort(source));
            if (source.toLowerCase().indexOf("jpg") == -1 || source.toLowerCase().indexOf("jpeg") == -1) {
                file.outputFormat("jpg");
                dist = dist.substring(0, dist.lastIndexOf("."));
            }
            file.outputQuality(0.25f).height(height).toFile(dist);
        } catch (Exception e) {
            throw new UtilException(ExceptionCode.IMAGE_ZOOM_10020, e);
        }
    }

    /**
     * @param @param  source
     * @param @param  dist
     * @param @throws UtilException <br>
     * @return void <br>
     * @throws <br>
     * @Title: pictureZoom <br>
     * @Description: TODO 缩放图片 <br>
     * @author Mr.Black <br>
     * @date 2015年12月10日 下午8:22:00 <br>
     */
    public static void pictureZoom(String source, String dist) throws UtilException {
        pictureZoom(source, dist, 100);
    }

    /**
     * @param @param  source
     * @param @return
     * @param @throws UtilException <br>
     * @return BufferedImage <br>
     * @throws <br>
     * @Title: cutByShort <br>
     * @Description: TODO <br>
     * @author Mr.Black <br>
     * @date 2015年12月10日 下午8:15:58 <br>
     */
    private static BufferedImage cutByShort(String source) throws UtilException {

        try {
            BufferedImage src = ImageIO.read(new File(source));
            int width = src.getWidth();
            int height = src.getHeight();
            int size = width > height ? height : width;
            BufferedImage dest = new BufferedImage(size, size, BufferedImage.TYPE_INT_RGB);
            Graphics g = dest.getGraphics();
            g.drawImage(src, 0, 0, size, size, 0, 0, size, size, null);

            return dest;
        } catch (IOException e) {
            throw new UtilException(ExceptionCode.IMAGE_ZOOM_10020, e);
        }
    }

    /**
     * TODO 保存上传的图片到硬盘
     * @param image
     * @return 图片的相对路径
     * @throws UtilException
     */
    public static String saveImage(MultipartFile image) throws UtilException {
        if (image != null) {
            // 原始名称
            String originalImageName = image.getOriginalFilename();
            if (CommonUtil.isNotEmpty(originalImageName)) {
                // 新的图片名称
                String newImageName = UUID.randomUUID()
                        + originalImageName.substring(originalImageName.lastIndexOf("."));
                // 设置物理存储路径
                String dateDir = CommonUtil.createDateDir(PathConstant.pictureUploadAbsolutePath);
                File newImage = new File(PathConstant.pictureUploadAbsolutePath + dateDir + "/" + newImageName);
                try {
                    // 文件保存
                    image.transferTo(newImage);
                } catch (Exception e) {
                    throw new UtilException("图片存储时发生异常");
                }
                // 返回相对路径
                return PathConstant.pictureRelativePath + dateDir + "/" + newImageName;
            }
        }
        return null;
    }
}
