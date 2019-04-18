/**  
 * @Title: PathConstant.java
 * @Package com.xzit.ar.common.constant
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月28日 下午8:24:55
 * @version V1.0  
 */
package com.xzit.ar.common.constant;

/**
 * @ClassName: PathConstant
 * @Description: TODO 设置相关路径
 * @author Mr.Black
 * @date 2016年2月28日 下午8:24:55
 */
public interface PathConstant {

	String contextAbsolutePath = "D:/cache";

	/**
	 * 项目的相对路径
	 */
	String contextRelativePath = "/ar";

	/**
	 * 上传的图片的相对路径
	 */
	String pictureRelativePath = contextRelativePath + "/pic/upload";

	/**
	 * 图片上传文件夹
	 */
	String pictureUploadAbsolutePath = contextAbsolutePath + pictureRelativePath;

	/**
	 * 相册默认封面图片路径
	 */
	String albumCoverDefaultRelPath = "assets/images/example/ablum-cover/media-audio.png";

}
