/**  
 * @Title: ClassRoomProvider.java
 * @Package com.xzit.ar.common.mapper.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:10:25
 * @version V1.0  
 */
package com.xzit.ar.common.mapper.origin;

/**
 * @ClassName: ClassRoomProvider
 * @Description: TODO Class SQL
 * @author Mr.Black
 * @date 2016年2月20日 下午4:10:25
 */
public class ClassRoomProvider {


//	public String classIndex() {
//		return "select o.origin_id classId, o.origin_name className, o.origin_grade classGrade, o.origin_desc classDesc, "
//				+ "o.members members, o.create_time createTime,  ui.true_name mgrName, ui.introduce mgrDesc, o.mgr_id mgrId, "
//				+ "img.image_path mgrImg "
//				+ "from origin o, user_info ui, image img, user u "
//				+ "where o.origin_id=#{classId} and o.state='A' and ui.user_id=o.mgr_id and u.user_id=ui.user_id "
//				+ "and img.image_id=u.head_image_id ";
//	}
	
	public String classIndex() {
		return "select o.origin_id classId, o.origin_name className, o.origin_grade classGrade, o.origin_desc classDesc, "
				+ "o.members members, o.create_time createTime "
				+ "from origin o "
				+ "where o.origin_id=#{classId} and o.state='A'";
	}
	
	public String classDirectory(){
		return "select ui.true_name trueName, ui.qq qq, ui.phone phone, ui.email email, u.user_id userId, "
				+ "ui.microblog microblog, ui.wechat wechat, ui.address address, img.image_path imgPath "
				+ "from origin o, user_origin uo, user_info ui, image img, user u "
				+ "where o.origin_id=#{classId} and o.state='A' "
				+ "and uo.origin_id=o.origin_id and uo.state='A' and ui.user_id=uo.user_id "
				+ "and u.user_id=ui.user_id and img.image_id=u.head_image_id ";
	}
	
	public String classMember(){
		return "select ui.true_name trueName, u.user_id userId, img.image_path imgPath "
				+ "from origin o, user_origin uo, user_info ui, image img, user u "
				+ "where o.origin_id=#{classId} and o.state='A' "
				+ "and uo.origin_id=o.origin_id and uo.state='A' and ui.user_id=uo.user_id "
				+ "and u.user_id=ui.user_id and img.image_id=u.head_image_id order by uo.state_time ";
	}
	
	public String classInfo(){
		return "select info.info_title infoTitle, info.content content, info.thumb_image infoImg, info.comments comments,"
				+ "ui.true_name userName, info.create_time createTime, info.info_id infoId, ui.user_id userId "
				+ "from information info, user_info ui "
				+ "where info.user_id=ui.user_id "
				+ "and info.origin_id=#{classId} and info.info_type='CI' and info.state='A' "
				+ "order by info.create_time desc";
	}
	
	public String classMessage(){
		return "select info.info_title infoTitle, info.content content, info.comments comments,"
				+ "ui.true_name userName, info.create_time createTime, info.info_id infoId, ui.user_id userId "
				+ "from information info, user_info ui "
				+ "where info.user_id=ui.user_id "
				+ "and info.origin_id=#{classId} and info.info_type='CM' and info.state='A' "
				+ "order by info.create_time desc";
	}
	
	public String classInfoDetail(){
		return "select info.info_title infoTitle, info.content content, info.thumb_image infoImg, info.comments comments,"
				+ "ui.true_name userName, ui.introduce userIntroduce, info.create_time createTime, info.info_id infoId, ui.user_id userId, "
				+ "img.image_path userHead "
				+ "from information info, user_info ui, user u, image img "
				+ "where info.user_id=ui.user_id and ui.user_id=u.user_id and u.head_image_id=img.image_id "
				+ "and info.origin_id=#{classId} and info.info_id=#{infoId} and info.info_type='CI' and info.state='A' "
				+ "order by info.create_time ";
	}
}
