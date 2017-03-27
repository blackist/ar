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

import javax.imageio.ImageIO;

import com.xzit.ar.common.exception.ExceptionCode;
import com.xzit.ar.common.exception.UtilException;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.Thumbnails.Builder;

/**
* @ClassName: ImageUtil <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月10日 下午8:15:28 <br>
* @version V1.0  <br> <br>
*/
public final class ImageUtil {

	/**
	* @Title: pictureZoom <br>
	* @Description: TODO 缩放图片<br>
	* @param @param source
	* @param @param dist
	* @param @param height
	* @param @throws UtilException <br>
	* @return void <br>
	* @author Mr.Black <br>
	* @date 2015年12月10日 下午8:16:10 <br>
	* @throws <br>
	 */
	public static void pictureZoom(String source, String dist, int height) throws UtilException {
        try {
            Builder<BufferedImage> file = Thumbnails.of(cutByShort(source));
            if (source.toLowerCase().indexOf("jpg") == -1 || source.toLowerCase().indexOf("jpeg") == -1) {
                file.outputFormat("jpg");
                dist = dist.substring(0, dist.lastIndexOf("."));
            }
            file.outputQuality(0.25f).height(height).toFile(dist);
        }
        catch (Exception e) {
            throw new UtilException(ExceptionCode.IMAGE_ZOOM_10020, e);
        }
    }

    /**
     * 
    * @Title: pictureZoom <br>
    * @Description: TODO 缩放图片 <br>
    * @param @param source
    * @param @param dist
    * @param @throws UtilException <br>
    * @return void <br>
    * @author Mr.Black <br>
    * @date 2015年12月10日 下午8:22:00 <br>
    * @throws <br>
     */
    public static void pictureZoom(String source, String dist) throws UtilException {
        pictureZoom(source, dist, 100);
    }
    
    /**
     * 
    * @Title: cutByShort <br>
    * @Description: TODO <br>
    * @param @param source
    * @param @return
    * @param @throws UtilException <br>
    * @return BufferedImage <br>
    * @author Mr.Black <br>
    * @date 2015年12月10日 下午8:15:58 <br>
    * @throws <br>
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
        }
        catch (IOException e) {
            throw new UtilException(ExceptionCode.IMAGE_ZOOM_10020, e);
        }
    }
}
